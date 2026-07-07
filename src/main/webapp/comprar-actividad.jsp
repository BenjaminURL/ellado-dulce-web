<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    if (session.getAttribute("idCliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int idCliente = Integer.parseInt(session.getAttribute("idCliente").toString());

    String idActividadParam = request.getParameter("idActividad");

    if (idActividadParam == null || idActividadParam.trim().equals("")) {
        response.sendRedirect("actividades.jsp");
        return;
    }

    int idActividad = Integer.parseInt(idActividadParam);

    Connection con = null;
    PreparedStatement psVerificar = null;
    PreparedStatement psCompra = null;
    PreparedStatement psActualizarCupos = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        con.setAutoCommit(false);

        String sqlVerificar =
            "SELECT a_cupos, a_estado " +
            "FROM actividad " +
            "WHERE a_id_actividad = ? " +
            "FOR UPDATE";

        psVerificar = con.prepareStatement(sqlVerificar);
        psVerificar.setInt(1, idActividad);

        rs = psVerificar.executeQuery();

        if (!rs.next()) {
            con.rollback();
            response.sendRedirect("actividades.jsp");
            return;
        }

        int cupos = rs.getInt("a_cupos");
        String estado = rs.getString("a_estado");

        if (cupos <= 0 || "Agotada".equalsIgnoreCase(estado)) {
            con.rollback();

            out.println("<script>");
            out.println("alert('Esta actividad ya no tiene cupos disponibles.');");
            out.println("window.location.href='actividades.jsp';");
            out.println("</script>");
            return;
        }

        String numeroConfirmacion = "ACT-" + System.currentTimeMillis();

        String sqlCompra =
            "INSERT INTO actividad_compra " +
            "(ac_id_actividad, ac_id_cliente, ac_numero_confirmacion, ac_estado) " +
            "VALUES (?, ?, ?, ?)";

        psCompra = con.prepareStatement(sqlCompra);
        psCompra.setInt(1, idActividad);
        psCompra.setInt(2, idCliente);
        psCompra.setString(3, numeroConfirmacion);
        psCompra.setString(4, "Confirmada");
        psCompra.executeUpdate();

        String sqlActualizarCupos =
            "UPDATE actividad " +
            "SET a_cupos = a_cupos - 1, " +
            "a_estado = CASE " +
            "   WHEN a_cupos - 1 <= 0 THEN 'Agotada' " +
            "   ELSE a_estado " +
            "END " +
            "WHERE a_id_actividad = ?";

        psActualizarCupos = con.prepareStatement(sqlActualizarCupos);
        psActualizarCupos.setInt(1, idActividad);
        psActualizarCupos.executeUpdate();

        con.commit();

        response.sendRedirect("pedido-confirmado.jsp");
        return;

    } catch (Exception e) {
        if (con != null) {
            try {
                con.rollback();
            } catch (Exception rollbackError) {
                rollbackError.printStackTrace();
            }
        }

        out.println("<h2>Error al comprar el cupo</h2>");
        out.println("<pre>");
        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");
        return;

    } finally {
        if (rs != null) rs.close();
        if (psVerificar != null) psVerificar.close();
        if (psCompra != null) psCompra.close();
        if (psActualizarCupos != null) psActualizarCupos.close();
        if (con != null) con.close();
    }
%>