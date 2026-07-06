<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Boquitas Dulces | Ellado Dulce</title>

    <link rel="stylesheet" href="catalogo-productos.css">
</head>
<body>

<header class="navbar">
    <div class="logo">
        <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="logo-img">
        <span>El <strong>Lado Dulce</strong></span>
    </div>

    <nav class="menu">
            <a href="index.jsp">Inicio</a>

            <div class="dropdown" style="display: inline-block; position: relative;">
                <a href="#" class="dropdown-toggle">Boquitas <span class="arrow">∨</span></a>
                <div class="dropdown-menu">
                    <a href="boquitas-dulces.jsp">Boquitas Dulces</a>
                    <a href="boquitas-saladas.jsp">Boquitas Saladas</a>
                </div>
            </div>

            <a href="Pasteles.jsp">Pasteles</a>
            <a href="reservas.jsp">Reservas</a>
            <a href="actividades.jsp">Actividades</a>
            <a href="Nosotros.jsp">Nosotros</a>
            <a href="mi-cuenta.jsp">Mi cuenta</a>
        </nav>

    <div class="cart">
        <a href="pantalla-de-carrito.jsp">
            <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
        </a>
    </div>
</header>

<section class="cake-hero">
    <div class="cake-info">
        <h1>Boquitas Dulces</h1>

        <p>
            Disfruta nuestras opciones dulces para eventos, reuniones y celebraciones.
            Ideales para compartir en porciones pequeñas y deliciosas.
        </p>

        <div class="cake-tags">
            <span>Eventos</span>
            <span>Por encargo</span>
            <span>Dulces artesanales</span>
        </div>
    </div>

    <div class="cake-image">
        <img src="imagenes/productos/boquitas-dulces.webp" alt="Boquitas Dulces">
    </div>
</section>

<section class="cakes-section">

    <h2>BOQUITAS DULCES</h2>

    <div class="cakes-grid">

<%
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
            "SELECT m_id_menu, m_producto, m_precio, m_descripcion " +
            "FROM menu " +
            "WHERE m_ct_id_categoria = ? " +
            "ORDER BY m_id_menu";

        ps = con.prepareStatement(sql);
        ps.setInt(1, 7);

        rs = ps.executeQuery();

        while (rs.next()) {
            int idMenu = rs.getInt("m_id_menu");
            String producto = rs.getString("m_producto");
            String descripcion = rs.getString("m_descripcion");
            double precio = rs.getDouble("m_precio");

            String precioTexto = String.format(java.util.Locale.US, "%.2f", precio);
%>

        <div class="cake-card">
            <img 
                src="imagenes/productos/producto-<%= idMenu %>.webp" 
                alt="<%= producto %>">

            <div class="cake-content">
                <h3><%= producto %></h3>

                <strong class="cake-price">B/.<%= precioTexto %></strong>

                <p><%= descripcion %></p>

                <a href="detalle-boquita.jsp?id=<%= idMenu %>">Ver más</a>
            </div>
        </div>

<%
        }

    } catch (Exception e) {
%>

        <p>Error al cargar las boquitas dulces.</p>

<%
        e.printStackTrace();

    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

    </div>

</section>

<footer class="footer">
    <div class="footer-col">
        <div class="footer-logo">
            <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="footer-logo-img">
            <h3>Ellado <span>Dulce</span></h3>
        </div>
        <p>Tu lugar favorito para endulzar cada momento.</p>
    </div>

    <div class="footer-col">
        <h3>Horarios</h3>
        <p>Lunes<br>1:00 p.m. - 8:00 p.m.</p>
        <p>Martes a Domingo<br>1:00 p.m. - 9:00 p.m.</p>
    </div>

    <div class="footer-col">
        <h3>Ubicación</h3>
        <p>Brisas Mall, Av. Principal, San Miguelito, Provincia de Panamá.</p>
        <a href="#">Cómo llegar →</a>
    </div>

    <div class="footer-col">
        <h3>Contacto</h3>
        <p>@elladodulce</p>
        <p>+507 315-8752</p>
    </div>

    <div class="copyright">
        © 2026 Ellado Dulce. Todos los derechos reservados.
    </div>
</footer>

</body>
</html>