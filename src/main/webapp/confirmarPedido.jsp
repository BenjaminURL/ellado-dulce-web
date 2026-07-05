<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
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
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        con.setAutoCommit(false);

        String sqlBuscarMenu = "SELECT m_id_menu FROM menu WHERE m_producto = ?";

        String sqlPedido =
    "INSERT INTO pedido " +
    "(pd_m_id_menu, pd_c_id_cliente, pd_cantidad, pd_descripcion, pd_sabor, pd_toppings, pd_total, pd_estado, pf_fechapedido, pd_metodo_pago, pd_estado_pago) " +
    "VALUES (?, ?, ?, ?, ?, ?, ?, 'Pendiente', NOW(), ?, 'Pagado')";

        psBuscarMenu = con.prepareStatement(sqlBuscarMenu);
        psPedido = con.prepareStatement(sqlPedido);

        for (int i = 0; i < nombres.length; i++) {
            String nombreProducto = nombres[i];
            double precioProducto = Double.parseDouble(precios[i]);
            int cantidadProducto = Integer.parseInt(cantidades[i]);
            double totalProducto = precioProducto * cantidadProducto;

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
            psPedido.setDouble(7, totalProducto);
            psPedido.setString(8, metodoPago);

            psPedido.addBatch();
        }

        psPedido.executeBatch();

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
        if (psBuscarMenu != null) psBuscarMenu.close();
        if (psPedido != null) psPedido.close();
        if (con != null) con.close();
    }
%>