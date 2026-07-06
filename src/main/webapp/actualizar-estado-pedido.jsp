<%@ page contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    if (session.getAttribute("idCliente") == null) {
        out.print("NO_SESSION");
        return;
    }

    String rolCliente = (String) session.getAttribute("rolCliente");

    if (rolCliente == null || !"ADMIN".equalsIgnoreCase(rolCliente)) {
        out.print("NO_ADMIN");
        return;
    }

    String idPedidoParam = request.getParameter("idPedido");
    String nuevoEstado = request.getParameter("nuevoEstado");

    if (idPedidoParam == null || nuevoEstado == null ||
        idPedidoParam.trim().equals("") || nuevoEstado.trim().equals("")) {
        out.print("DATOS_INVALIDOS");
        return;
    }

    if (
        !"Pendiente".equals(nuevoEstado) &&
        !"En proceso".equals(nuevoEstado) &&
        !"Listo".equals(nuevoEstado) &&
        !"Entregado".equals(nuevoEstado)
    ) {
        out.print("ESTADO_INVALIDO");
        return;
    }

    int idPedido = 0;

    try {
        idPedido = Integer.parseInt(idPedidoParam);
    } catch (Exception e) {
        out.print("ID_INVALIDO");
        return;
    }

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
            "UPDATE pedido " +
            "SET pd_estado = ? " +
            "WHERE pd_id_pedido = ?";

        ps = con.prepareStatement(sql);
        ps.setString(1, nuevoEstado);
        ps.setInt(2, idPedido);

        int filas = ps.executeUpdate();

        if (filas > 0) {
            out.print("OK");
        } else {
            out.print("NO_EXISTE");
        }

    } catch (Exception e) {
        out.print("ERROR");

    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>