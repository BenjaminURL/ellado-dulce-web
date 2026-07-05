<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String usuario = request.getParameter("usuario");
    String correo = request.getParameter("correo");
    String telefono = request.getParameter("telefono");
    String contrasena = request.getParameter("contrasena");
    

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        String sql = "INSERT INTO cliente (c_p_nombre, c_p_apellido, c_p_usuario, c_p_correo, c_p_telefono, c_p_contrasena) VALUES (?, ?, ?, ?, ?, ?)";

        ps = con.prepareStatement(sql);
        ps.setString(1, nombre);
        ps.setString(2, apellido);
        ps.setString(3, usuario);
        ps.setString(4, correo);
        ps.setString(5, telefono);
        ps.setString(6, contrasena);

        ps.executeUpdate();

        response.sendRedirect("login.jsp?registro=ok");

} catch (SQLIntegrityConstraintViolationException e) {
    response.sendRedirect("registro.jsp?error=duplicado");
} catch (Exception e) {
    out.println("<h2>Error al registrar cliente</h2>");
    out.println("<pre>");
    e.printStackTrace(new java.io.PrintWriter(out));
    out.println("</pre>");
}
%>