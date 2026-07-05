<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String usuario = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasena");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/ellado_dulce_db";
        String user = "root";
        String pass = "";

        String sql = "SELECT c_id_cliente, c_p_nombre, c_p_apellido, c_p_usuario, c_p_correo, c_p_telefono " +
             "FROM cliente " +
             "WHERE (c_p_usuario = ? OR c_p_correo = ?) " +
             "AND c_p_contrasena = ?";

        try (
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setString(1, usuario);
            ps.setString(2, usuario);
            ps.setString(3, contrasena);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    session.setAttribute("idCliente", rs.getInt("c_id_cliente"));
                    session.setAttribute("nombreCliente", rs.getString("c_p_nombre"));
                    session.setAttribute("apellidoCliente", rs.getString("c_p_apellido"));
                    session.setAttribute("usuarioCliente", rs.getString("c_p_usuario"));
                    session.setAttribute("correoCliente", rs.getString("c_p_correo"));
                    session.setAttribute("telefonoCliente", rs.getString("c_p_telefono"));

                    response.sendRedirect("mi-cuenta.jsp");
                    return;
                } else {
                    response.sendRedirect("login.jsp?error=1");
                    return;
                }

            }
        }

    } catch (Exception e) {
        out.println("<h2>Error al iniciar sesión</h2>");
        out.println("<pre>");
        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");
    }
%>