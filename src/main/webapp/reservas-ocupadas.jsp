<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    response.setContentType("application/json;charset=UTF-8");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        String sql =
            "SELECT DISTINCT r_fecha " +
            "FROM reserva " +
            "WHERE r_estado IN ('Pendiente', 'Confirmada')";

        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        out.print("[");

        boolean primero = true;

        while (rs.next()) {
            String fecha = rs.getString("r_fecha");

            if (!primero) {
                out.print(",");
            }

            out.print("\"" + fecha + "\"");

            primero = false;
        }

        out.print("]");

    } catch (Exception e) {
        out.print("[]");

    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>