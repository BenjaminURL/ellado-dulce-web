<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    if (session.getAttribute("idCliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int idCliente = Integer.parseInt(session.getAttribute("idCliente").toString());

    String idTipoReservaParam = request.getParameter("idTipoReserva");
    String precioBaseParam = request.getParameter("precioBase");
    String fechaReserva = request.getParameter("fechaReserva");
    String horaReserva = request.getParameter("horaReserva");

    if (idTipoReservaParam == null || idTipoReservaParam.trim().equals("") ||
        precioBaseParam == null || precioBaseParam.trim().equals("") ||
        fechaReserva == null || fechaReserva.trim().equals("") ||
        horaReserva == null || horaReserva.trim().equals("")) {

        response.sendRedirect("reservas.jsp");
        return;
    }

    int idTipoReserva = Integer.parseInt(idTipoReservaParam);
    double totalEstimado = Double.parseDouble(precioBaseParam);

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        String sql =
            "INSERT INTO reserva " +
            "(r_tr_id_tipo, r_c_id_cliente, r_fecha, r_hora, r_total_estimado, r_estado) " +
            "VALUES (?, ?, ?, ?, ?, ?)";

        ps = con.prepareStatement(sql);

        ps.setInt(1, idTipoReserva);
        ps.setInt(2, idCliente);
        ps.setDate(3, java.sql.Date.valueOf(fechaReserva));
        ps.setTime(4, java.sql.Time.valueOf(horaReserva + ":00"));
        ps.setDouble(5, totalEstimado);
        ps.setString(6, "Confirmada");

        ps.executeUpdate();

        response.sendRedirect("pedido-confirmado.jsp");
        return;

    } catch (Exception e) {
        out.println("<h2>Error al guardar la reserva</h2>");
        out.println("<pre>");
        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");
        return;

    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>