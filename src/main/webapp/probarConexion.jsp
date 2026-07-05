<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Probar conexión</title>
</head>
<body>

<%
    Connection con = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        out.println("<h2>Conexión exitosa a la base de datos</h2>");

    } catch (Exception e) {
        out.println("<h2>Error de conexión</h2>");
        out.println("<p>" + e.getMessage() + "</p>");
    } finally {
        if (con != null) {
            con.close();
        }
    }
%>

</body>
</html>