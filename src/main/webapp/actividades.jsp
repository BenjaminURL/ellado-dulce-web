<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actividades | El Lado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="catalogo-productos.css?">
</head>
<body>

<header class="navbar">
    <div class="logo">
        <img src="imagenes/logo2019.png" class="logo-img" alt="Logo El Lado Dulce">
        <span>El <strong>Lado Dulce</strong></span>
    </div>

    <nav class="menu">
        <a href="index.jsp">Inicio</a>
        <a href="helados.jsp">Helados</a>
        <a href="html/bebidas.jsp">Bebidas</a>
        <a href="#">Crepes</a>
        <a href="Boquitas.jsp">Boquitas</a>
        <a href="Pasteles.jsp">Pasteles</a>
        <a href="reservas.jsp">Reservas</a>
        <a class="active" href="actividades.jsp">Actividades</a>
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
        <h1>Actividades</h1>

        <p>
            Participa en talleres creativos de crochet, dibujo, decoración, origami y más.
            Compra tu cupo y recibe un número de confirmación.
        </p>

        <div class="cake-tags">
            <span>🎨 Talleres creativos</span>
            <span>🎟 Cupos limitados</span>
        </div>
    </div>

    <div class="cake-image">
        <img src="https://images.unsplash.com/photo-1513364776144-60967b0f800f?q=80&w=640&auto=format&fit=crop" alt="Actividades creativas">
    </div>
</section>

<section class="cakes-section">

    <h2>ACTIVIDADES DISPONIBLES</h2>

    <div class="cakes-grid">

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat formatoHora = new SimpleDateFormat("hh:mm a");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        String sql =
            "SELECT a_id_actividad, a_nombre, a_descripcion, a_fecha, a_hora, a_precio, a_cupos, a_imagen, a_estado " +
            "FROM actividad " +
            "ORDER BY a_fecha, a_hora";

        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            int idActividad = rs.getInt("a_id_actividad");
            String nombre = rs.getString("a_nombre");
            String descripcion = rs.getString("a_descripcion");
            Date fecha = rs.getDate("a_fecha");
            Time hora = rs.getTime("a_hora");
            double precio = rs.getDouble("a_precio");
            int cupos = rs.getInt("a_cupos");
            String imagen = rs.getString("a_imagen");
            String estado = rs.getString("a_estado");

            String fechaTexto = formatoFecha.format(fecha);
            String horaTexto = formatoHora.format(hora);
            String precioTexto = String.format(java.util.Locale.US, "%.2f", precio);

            if (imagen == null || imagen.trim().equals("")) {
                imagen = "actividad-default.png";
            }

            boolean agotada = cupos <= 0 || "Agotada".equalsIgnoreCase(estado);
%>

        <div class="cake-card">
            <img src="imagenes/actividades/<%= imagen %>" alt="<%= nombre %>">

            <div class="cake-content">
                <h3><%= nombre %></h3>

                <strong class="cake-price">B/.<%= precioTexto %></strong>

                <p>
                    <%= descripcion %>
                </p>

                <div class="tags">
                    <span class="tag orange"><%= fechaTexto %> - <%= horaTexto %></span>
                    <span class="tag pink"><%= cupos %> cupos disponibles</span>
                </div>

                <% if (agotada) { %>
                    <a href="#" style="opacity: 0.5; pointer-events: none;">Agotada</a>
                <% } else { %>
                    <a href="detalle-actividad.jsp?id=<%= idActividad %>">Ver detalles</a>
                <% } %>
            </div>
        </div>

<%
        }

    } catch (Exception e) {
%>

        <p>Error al cargar las actividades.</p>

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
    <div>
        <div class="footer-logo">
            <img src="imagenes/logo2019.png" class="footer-logo-img" alt="Logo El Lado Dulce">
            <h3>El <span>Lado Dulce</span></h3>
        </div>

        <p>Tu lugar favorito para endulzar cada momento.</p>
    </div>

    <div>
        <h3>Horarios</h3>
        <p>Lunes<br>1:00 p.m. - 8:00 p.m.</p>
        <p>Martes a Domingo<br>1:00 p.m. - 9:00 p.m.</p>
    </div>

    <div>
        <h3>Ubicación</h3>
        <p>Brisas Mall, Av. Principal, San Miguelito, Provincia de Panamá.</p>
        <a href="#">Cómo llegar →</a>
    </div>

    <div>
        <h3>Contacto</h3>
        <p>@elladodulce</p>
        <p>+507 315-8752</p>
    </div>

    <div class="copyright">
        © 2026 El Lado Dulce. Todos los derechos reservados.
    </div>
</footer>

</body>
</html>