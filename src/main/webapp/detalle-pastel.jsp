<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>

<%
    request.setCharacterEncoding("UTF-8");

    String idParam = request.getParameter("id");

    if (idParam == null || idParam.trim().equals("")) {
        response.sendRedirect("Pasteles.jsp");
        return;
    }

    int idMenu = 0;

    try {
        idMenu = Integer.parseInt(idParam);
    } catch (Exception e) {
        response.sendRedirect("Pasteles.jsp");
        return;
    }

    String nombreProducto = "";
    String descripcionProducto = "";
    double precioProducto = 0.00;

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
            "SELECT m.m_id_menu, m.m_producto, m.m_precio, m.m_descripcion " +
            "FROM menu m " +
            "INNER JOIN categoria c ON m.m_ct_id_categoria = c.ct_id_categoria " +
            "WHERE m.m_id_menu = ? " +
            "AND c.ct_descripcion = 'Pasteles'";

        ps = con.prepareStatement(sql);
        ps.setInt(1, idMenu);

        rs = ps.executeQuery();

        if (rs.next()) {
            nombreProducto = rs.getString("m_producto");
            descripcionProducto = rs.getString("m_descripcion");
            precioProducto = rs.getDouble("m_precio");

            if (descripcionProducto == null || descripcionProducto.trim().equals("")) {
                descripcionProducto = "Pastel especial de El Lado Dulce, ideal para celebraciones y momentos especiales.";
            }
        } else {
            response.sendRedirect("Pasteles.jsp");
            return;
        }

    } catch (Exception e) {
        out.println("<h2>Error al cargar el pastel</h2>");
        out.println("<pre>");
        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");
        return;

    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }

    String precioTexto = String.format(java.util.Locale.US, "%.2f", precioProducto);

    String imagenProducto = "imagenes/Pasteles/" + nombreProducto + "-" + idMenu + ".png";

    String nombreWhatsapp = URLEncoder.encode(nombreProducto, "UTF-8");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= nombreProducto %> | El Lado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="layout.css?v=1">
    <link rel="stylesheet" href="detalle-producto.css?v=1">
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
                <a href="" class="dropdown-toggle">Boquitas <span class="arrow">∨</span></a>
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

    <a href="Pasteles.jsp" class="back-link">← Volver a Pasteles</a>

    <section class="product-detail">

        <div class="product-gallery">
            <div class="main-product-image">
                <img src="<%= imagenProducto %>" alt="<%= nombreProducto %>">
            </div>

            <div class="thumbnail-row">
                <div class="thumbnail active-thumb">
                    <img src="<%= imagenProducto %>" alt="<%= nombreProducto %>">
                </div>
            </div>
        </div>

        <div class="product-config">

            <div class="product-header">
                <h1><%= nombreProducto %></h1>

                <p class="product-price">
                    Desde B/.<%= precioTexto %>
                </p>

                <p class="product-description">
                    <%= descripcionProducto %>
                </p>
            </div>

            <form 
                class="order-form" 
                id="orderForm" 
                data-base-price="<%= precioTexto %>"
                data-nombre="<%= nombreProducto %>"
                data-categoria="Pasteles"
                data-imagen="<%= imagenProducto %>">

                <section class="option-box quantity-box">
                    <h2>1. Cantidad</h2>

                    <div class="quantity-control">
                        <button type="button" id="btnRestar">−</button>
                        <span id="cantidad">1</span>
                        <button type="button" id="btnSumar" class="plus">+</button>
                    </div>
                </section>

                <section class="option-box">
                    <h2>2. Notas especiales <span>(opcional)</span></h2>

                    <textarea 
                        id="notasEspecificas" 
                        placeholder="Ej: mensaje especial, sin frutos secos, entregar frío..."></textarea>
                </section>

                <section class="summary-box">
                    <div>
                        <span>Subtotal</span>
                        <strong id="subtotalPrice">B/.<%= precioTexto %></strong>
                        <small>Precio provisional</small>
                    </div>

                    <button type="button" class="cart-btn" id="btnAgregarCarrito">
                        Agregar al carrito
                    </button>

                    <a 
                        class="whatsapp-btn" 
                        id="whatsappBtn" 
                        href="https://wa.me/5073158752?text=Hola,%20quiero%20pedir%20<%= nombreWhatsapp %>." 
                        target="_blank">
                        Pedir vía WhatsApp
                    </a>
                </section>

            </form>

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

<script>
    const clienteLogueado = <%= session.getAttribute("idCliente") != null ? "true" : "false" %>;
    const idClienteActual = "<%= session.getAttribute("idCliente") != null ? session.getAttribute("idCliente") : "" %>";
</script>

<script src="detalle-producto.js?v=10"></script>

</body>
</html>