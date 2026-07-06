<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String usuario = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasena");

    if (usuario == null || contrasena == null || usuario.trim().equals("") || contrasena.trim().equals("")) {
        response.sendRedirect("login.jsp?error=campos");
        return;
    }

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
            "SELECT " +
            "c_id_cliente, " +
            "c_p_nombre, " +
            "c_p_apellido, " +
            "c_p_usuario, " +
            "c_p_correo, " +
            "c_p_telefono, " +
            "c_rol " +
            "FROM cliente " +
            "WHERE (c_p_usuario = ? OR c_p_correo = ?) " +
            "AND c_p_contrasena = ? " +
            "LIMIT 1";

        ps = con.prepareStatement(sql);
        ps.setString(1, usuario.trim());
        ps.setString(2, usuario.trim());
        ps.setString(3, contrasena.trim());

        rs = ps.executeQuery();

        if (rs.next()) {
            int idCliente = rs.getInt("c_id_cliente");
            String nombreCliente = rs.getString("c_p_nombre");
            String apellidoCliente = rs.getString("c_p_apellido");
            String usuarioCliente = rs.getString("c_p_usuario");
            String correoCliente = rs.getString("c_p_correo");
            String telefonoCliente = rs.getString("c_p_telefono");
            String rolCliente = rs.getString("c_rol");

            session.setAttribute("idCliente", idCliente);
            session.setAttribute("nombreCliente", nombreCliente);
            session.setAttribute("apellidoCliente", apellidoCliente);
            session.setAttribute("usuarioCliente", usuarioCliente);
            session.setAttribute("correoCliente", correoCliente);
            session.setAttribute("telefonoCliente", telefonoCliente);
            session.setAttribute("rolCliente", rolCliente);

            if ("ADMIN".equalsIgnoreCase(rolCliente)) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("mi-cuenta.jsp");
            }

            return;

        } else {
            response.sendRedirect("login.jsp?error=credenciales");
            return;
        }

    } catch (Exception e) {
        out.println("<h2>Error al iniciar sesión</h2>");
        out.println("<pre>");
        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");

    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>