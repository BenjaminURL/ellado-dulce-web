<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%!
    public double convertirDecimal(String valor, double defecto) {
        try {
            if (valor == null || valor.trim().equals("")) {
                return defecto;
            }

            return Double.parseDouble(valor);
        } catch (Exception e) {
            return defecto;
        }
    }

    public int convertirEntero(String valor, int defecto) {
        try {
            if (valor == null || valor.trim().equals("")) {
                return defecto;
            }

            return Integer.parseInt(valor);
        } catch (Exception e) {
            return defecto;
        }
    }
%>

<%
    request.setCharacterEncoding("UTF-8");

    if (session.getAttribute("idCliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int idCliente = (Integer) session.getAttribute("idCliente");

    String[] nombres = request.getParameterValues("nombreProducto");
    String[] precios = request.getParameterValues("precioProducto");
    String[] cantidades = request.getParameterValues("cantidadProducto");
    String[] sabores = request.getParameterValues("saborProducto");
    String[] toppings = request.getParameterValues("toppingsProducto");
    String[] notas = request.getParameterValues("notasProducto");

    String metodoPago = request.getParameter("metodoPago");
    String usarPuntosParam = request.getParameter("usarPuntos");

    if (metodoPago == null || metodoPago.trim().equals("")) {
        metodoPago = "Tarjeta simulada";
    }

    if (nombres == null || precios == null || cantidades == null || nombres.length == 0) {
        response.sendRedirect("pantalla-de-carrito.jsp");
        return;
    }

    Connection con = null;

    PreparedStatement psBuscarMenu = null;
    PreparedStatement psPedido = null;
    PreparedStatement psConsultarPuntos = null;
    PreparedStatement psRestarPuntos = null;
    PreparedStatement psSumarPuntos = null;
    PreparedStatement psMovimiento = null;

    ResultSet rs = null;
    ResultSet rsPuntos = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        con.setAutoCommit(false);

        double subtotalGeneral = 0.00;

        for (int i = 0; i < nombres.length; i++) {
            double precioProducto = convertirDecimal(precios[i], 0.00);
            int cantidadProducto = convertirEntero(cantidades[i], 1);

            subtotalGeneral += precioProducto * cantidadProducto;
        }

        int puntosDisponibles = 0;
        int puntosUsados = 0;
        double descuentoPuntos = 0.00;

        if ("si".equalsIgnoreCase(usarPuntosParam)) {
            String sqlConsultarPuntos =
                "SELECT c_puntos " +
                "FROM cliente " +
                "WHERE c_id_cliente = ? " +
                "FOR UPDATE";

            psConsultarPuntos = con.prepareStatement(sqlConsultarPuntos);
            psConsultarPuntos.setInt(1, idCliente);

            rsPuntos = psConsultarPuntos.executeQuery();

            if (rsPuntos.next()) {
                puntosDisponibles = rsPuntos.getInt("c_puntos");
            }

            rsPuntos.close();
            rsPuntos = null;

            psConsultarPuntos.close();
            psConsultarPuntos = null;

            double descuentoMaximo = puntosDisponibles / 10.0;

            if (descuentoMaximo > subtotalGeneral) {
                descuentoPuntos = subtotalGeneral;
            } else {
                descuentoPuntos = descuentoMaximo;
            }

            puntosUsados = (int) Math.floor(descuentoPuntos * 10);

            if (puntosUsados > 0) {
                String sqlRestarPuntos =
                    "UPDATE cliente " +
                    "SET c_puntos = c_puntos - ? " +
                    "WHERE c_id_cliente = ?";

                psRestarPuntos = con.prepareStatement(sqlRestarPuntos);
                psRestarPuntos.setInt(1, puntosUsados);
                psRestarPuntos.setInt(2, idCliente);
                psRestarPuntos.executeUpdate();
                psRestarPuntos.close();
                psRestarPuntos = null;

                String sqlMovimientoUsado =
                    "INSERT INTO puntos_movimiento " +
                    "(pm_c_id_cliente, pm_tipo, pm_puntos, pm_descripcion) " +
                    "VALUES (?, ?, ?, ?)";

                psMovimiento = con.prepareStatement(sqlMovimientoUsado);
                psMovimiento.setInt(1, idCliente);
                psMovimiento.setString(2, "USADO");
                psMovimiento.setInt(3, puntosUsados);
                psMovimiento.setString(4, "Puntos usados como descuento en pedido");
                psMovimiento.executeUpdate();
                psMovimiento.close();
                psMovimiento = null;
            }
        }

        double totalFinalCompra = subtotalGeneral - descuentoPuntos;

        if (totalFinalCompra < 0) {
            totalFinalCompra = 0.00;
        }

        int puntosGanados = (int) Math.floor(totalFinalCompra);

        String sqlBuscarMenu =
            "SELECT m_id_menu " +
            "FROM menu " +
            "WHERE m_producto = ?";

        String sqlPedido =
            "INSERT INTO pedido " +
            "(" +
            "pd_m_id_menu, " +
            "pd_c_id_cliente, " +
            "pd_cantidad, " +
            "pd_descripcion, " +
            "pd_sabor, " +
            "pd_toppings, " +
            "pd_total, " +
            "pd_estado, " +
            "pf_fechapedido, " +
            "pd_metodo_pago, " +
            "pd_estado_pago, " +
            "pd_puntos_usados, " +
            "pd_descuento_puntos" +
            ") VALUES (?, ?, ?, ?, ?, ?, ?, 'Pendiente', NOW(), ?, 'Pagado', ?, ?)";

        psBuscarMenu = con.prepareStatement(sqlBuscarMenu);
        psPedido = con.prepareStatement(sqlPedido);

        double descuentoPendiente = descuentoPuntos;

        for (int i = 0; i < nombres.length; i++) {
            String nombreProducto = nombres[i];

            double precioProducto = convertirDecimal(precios[i], 0.00);
            int cantidadProducto = convertirEntero(cantidades[i], 1);

            double totalProductoOriginal = precioProducto * cantidadProducto;

            double descuentoAplicadoProducto = 0.00;

            if (descuentoPendiente > 0) {
                if (descuentoPendiente >= totalProductoOriginal) {
                    descuentoAplicadoProducto = totalProductoOriginal;
                } else {
                    descuentoAplicadoProducto = descuentoPendiente;
                }

                descuentoPendiente -= descuentoAplicadoProducto;
            }

            double totalProductoFinal = totalProductoOriginal - descuentoAplicadoProducto;

            if (totalProductoFinal < 0) {
                totalProductoFinal = 0.00;
            }

            String saborProducto = "No seleccionado";
            String toppingsProducto = "Sin toppings";
            String notasProducto = null;

            if (sabores != null && sabores.length > i && sabores[i] != null && !sabores[i].trim().equals("")) {
                saborProducto = sabores[i].trim();
            }

            if (toppings != null && toppings.length > i && toppings[i] != null && !toppings[i].trim().equals("")) {
                toppingsProducto = toppings[i].trim();
            }

            if (notas != null && notas.length > i && notas[i] != null && !notas[i].trim().equals("")) {
                notasProducto = notas[i].trim();
            }

            psBuscarMenu.setString(1, nombreProducto);
            rs = psBuscarMenu.executeQuery();

            if (!rs.next()) {
                throw new Exception("El producto '" + nombreProducto + "' no existe en la tabla menu.");
            }

            int idMenu = rs.getInt("m_id_menu");

            rs.close();
            rs = null;

            psPedido.setInt(1, idMenu);
            psPedido.setInt(2, idCliente);
            psPedido.setInt(3, cantidadProducto);
            psPedido.setString(4, notasProducto);
            psPedido.setString(5, saborProducto);
            psPedido.setString(6, toppingsProducto);
            psPedido.setDouble(7, totalProductoFinal);
            psPedido.setString(8, metodoPago);

            if (i == 0) {
                psPedido.setInt(9, puntosUsados);
                psPedido.setDouble(10, descuentoPuntos);
            } else {
                psPedido.setInt(9, 0);
                psPedido.setDouble(10, 0.00);
            }

            psPedido.addBatch();
        }

        psPedido.executeBatch();

        if (puntosGanados > 0) {
            String sqlSumarPuntos =
                "UPDATE cliente " +
                "SET c_puntos = c_puntos + ? " +
                "WHERE c_id_cliente = ?";

            psSumarPuntos = con.prepareStatement(sqlSumarPuntos);
            psSumarPuntos.setInt(1, puntosGanados);
            psSumarPuntos.setInt(2, idCliente);
            psSumarPuntos.executeUpdate();
            psSumarPuntos.close();
            psSumarPuntos = null;

            String sqlMovimientoGanado =
                "INSERT INTO puntos_movimiento " +
                "(pm_c_id_cliente, pm_tipo, pm_puntos, pm_descripcion) " +
                "VALUES (?, ?, ?, ?)";

            psMovimiento = con.prepareStatement(sqlMovimientoGanado);
            psMovimiento.setInt(1, idCliente);
            psMovimiento.setString(2, "GANADO");
            psMovimiento.setInt(3, puntosGanados);
            psMovimiento.setString(4, "Puntos ganados por compra de pedido");
            psMovimiento.executeUpdate();
            psMovimiento.close();
            psMovimiento = null;
        }

        con.commit();

        response.sendRedirect("pedido-confirmado.jsp");
        return;

    } catch (Exception e) {
        if (con != null) {
            con.rollback();
        }

        out.println("<h2>Error al confirmar pedido</h2>");
        out.println("<pre>");
        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");

    } finally {
        if (rs != null) rs.close();
        if (rsPuntos != null) rsPuntos.close();

        if (psBuscarMenu != null) psBuscarMenu.close();
        if (psPedido != null) psPedido.close();
        if (psConsultarPuntos != null) psConsultarPuntos.close();
        if (psRestarPuntos != null) psRestarPuntos.close();
        if (psSumarPuntos != null) psSumarPuntos.close();
        if (psMovimiento != null) psMovimiento.close();

        if (con != null) con.close();
    }
%>