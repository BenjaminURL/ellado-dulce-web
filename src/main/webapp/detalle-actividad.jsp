<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.net.URLEncoder" %>

<%
    request.setCharacterEncoding("UTF-8");

    String idParam = request.getParameter("id");

    if (idParam == null || idParam.trim().equals("")) {
        response.sendRedirect("actividades.jsp");
        return;
    }

    int idActividad = 0;

    try {
        idActividad = Integer.parseInt(idParam);
    } catch (Exception e) {
        response.sendRedirect("actividades.jsp");
        return;
    }

    String nombre = "";
    String descripcion = "";
    String estado = "";
    double precio = 0.00;
    int cupos = 0;
    java.sql.Date fecha = null;
    java.sql.Time hora = null;

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
            "SELECT a_id_actividad, a_nombre, a_descripcion, a_fecha, a_hora, a_precio, a_cupos, a_estado " +
            "FROM actividad " +
            "WHERE a_id_actividad = ?";

        ps = con.prepareStatement(sql);
        ps.setInt(1, idActividad);

        rs = ps.executeQuery();

        if (rs.next()) {
            nombre = rs.getString("a_nombre");
            descripcion = rs.getString("a_descripcion");
            fecha = rs.getDate("a_fecha");
            hora = rs.getTime("a_hora");
            precio = rs.getDouble("a_precio");
            cupos = rs.getInt("a_cupos");
            estado = rs.getString("a_estado");

            if (estado == null || estado.trim().equals("")) {
                estado = "Disponible";
            }
        } else {
            response.sendRedirect("actividades.jsp");
            return;
        }

    } catch (Exception e) {
        out.println("<h2>Error al cargar la actividad</h2>");
        out.println("<pre>");
        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");
        return;

    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }

    SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat formatoHora = new SimpleDateFormat("hh:mm a");

    String fechaTexto = formatoFecha.format(fecha);
    String horaTexto = formatoHora.format(hora);
    String precioTexto = String.format(java.util.Locale.US, "%.2f", precio);

    String imagenActividad = "imagenes/actividades/" + nombre + "-" + idActividad + ".png";

    boolean agotada = cupos <= 0 || "Agotada".equalsIgnoreCase(estado) || "Cancelada".equalsIgnoreCase(estado);
    boolean clienteLogueado = session.getAttribute("idCliente") != null;

    String nombreWhatsapp = URLEncoder.encode(nombre, "UTF-8");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= nombre %> | El Lado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="layout.css">
    <link rel="stylesheet" href="detalle-producto.css">
</head>
<body>

<header class="navbar">
    <div class="logo">
        <img src="imagenes/logo2019.png" alt="Logo El Lado Dulce" class="logo-img">
        <span>El <strong>Lado Dulce</strong></span>
    </div>

    <nav class="menu">
        <a href="index.jsp">Inicio</a>

        <div class="dropdown">
    <a href="Boquitas.jsp" class="dropdown-toggle">
        Boquitas <span class="arrow">∨</span>
    </a>

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

<main class="product-page">

    <a href="actividades.jsp" class="back-link">← Volver a Actividades</a>

    <section class="product-detail">

        <div class="product-gallery">
            <div class="main-product-image">
                <img src="<%= imagenActividad %>" alt="<%= nombre %>">
            </div>

            <div class="thumbnail-row">
                <div class="thumbnail active-thumb">
                    <img src="<%= imagenActividad %>" alt="<%= nombre %>">
                </div>
            </div>
        </div>

        <div class="product-config">

            <div class="product-header">
                <h1><%= nombre %></h1>

                <p class="product-price">
                    B/.<%= precioTexto %>
                </p>

                <p class="product-description">
                    <%= descripcion %>
                </p>
            </div>

            <section class="option-box">
                <h2>1. Información de la actividad</h2>

                <p class="option-note">
                    <strong>Fecha:</strong> <%= fechaTexto %>
                </p>

                <p class="option-note">
                    <strong>Hora:</strong> <%= horaTexto %>
                </p>

                <p class="option-note">
                    <strong>Cupos disponibles:</strong> <%= cupos %>
                </p>

                <p class="option-note">
                    <strong>Estado:</strong> <%= estado %>
                </p>
            </section>

            <section class="summary-box">
                <div>
                    <span>Total a pagar</span>
                    <strong id="subtotalPrice">B/.<%= precioTexto %></strong>
                    <small>Compra de 1 cupo para la actividad</small>
                </div>

                <% if (agotada) { %>

                    <button type="button" class="cart-btn" disabled style="opacity: 0.5; cursor: not-allowed;">
                        Actividad no disponible
                    </button>

                <% } else if (!clienteLogueado) { %>

                    <a href="login.jsp" class="cart-btn">
                        Comprar cupo
                    </a>

                <% } else { %>

                    <form action="pago.jsp" method="post">
                    <input type="hidden" name="tipoPago" value="actividad">
                    <input type="hidden" name="idActividad" value="<%= idActividad %>">
                    <input type="hidden" name="nombreActividad" value="<%= nombre %>">
                    <input type="hidden" name="precioActividad" value="<%= precioTexto %>">

                     <button type="submit" class="cart-btn">
                     Comprar cupo
                     </button>
                    </form>

                <% } %>

                <a 
                    class="whatsapp-btn" 
                    href="https://wa.me/5073158752?text=Hola,%20quiero%20información%20sobre%20la%20actividad%20<%= nombreWhatsapp %>." 
                    target="_blank">
                    Consultar por WhatsApp
                </a>
            </section>

        </div>

    </section>

</main>

<footer class="footer">
    <div class="footer-col">
        <div class="footer-logo">
            <img src="imagenes/logo2019.png" alt="Logo El Lado Dulce" class="footer-logo-img">
            <h3>El <span>Lado Dulce</span></h3>
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
        © 2026 El Lado Dulce. Todos los derechos reservados.
    </div>
</footer>

</body>
</html>