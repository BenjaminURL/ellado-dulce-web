<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    String idParam = request.getParameter("id");

    if (idParam == null || idParam.trim().equals("")) {
        response.sendRedirect("boquitas-dulces.jsp");
        return;
    }

    int idMenu = 0;

    try {
        idMenu = Integer.parseInt(idParam);
    } catch (Exception e) {
        response.sendRedirect("boquitas-dulces.jsp");
        return;
    }

    String producto = "";
    String descripcion = "";
    double precio = 0.00;
    int idCategoria = 0;

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
            "SELECT m_id_menu, m_producto, m_precio, m_descripcion, m_ct_id_categoria " +
            "FROM menu " +
            "WHERE m_id_menu = ? " +
            "AND m_ct_id_categoria IN (7, 8)";

        ps = con.prepareStatement(sql);
        ps.setInt(1, idMenu);

        rs = ps.executeQuery();

        if (rs.next()) {
            producto = rs.getString("m_producto");
            precio = rs.getDouble("m_precio");
            descripcion = rs.getString("m_descripcion");
            idCategoria = rs.getInt("m_ct_id_categoria");
        } else {
            response.sendRedirect("boquitas-dulces.jsp");
            return;
        }

    } catch (Exception e) {
        out.println("<h2>Error al cargar la boquita</h2>");
        out.println("<pre>");
        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");
        return;

    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }

    String precioTexto = String.format(java.util.Locale.US, "%.2f", precio);

    String categoriaTexto = "";
    String paginaVolver = "";

    if (idCategoria == 7) {
        categoriaTexto = "Boquitas Dulces";
        paginaVolver = "boquitas-dulces.jsp";
    } else if (idCategoria == 8) {
        categoriaTexto = "Boquitas Saladas";
        paginaVolver = "boquitas-saladas.jsp";
    } else {
        categoriaTexto = "Boquitas";
        paginaVolver = "Boquitas.jsp";
    }

    String imagenProducto = "imagenes/Productos/" + producto + "-" + idMenu + ".png";
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title><%= producto %> | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="layout.css">
    <link rel="stylesheet" href="detalle-producto.css">
</head>
<body>

<header class="navbar">
    <div class="logo">
        <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="logo-img">
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

    <a href="<%= paginaVolver %>" class="back-link">
        ← Volver a <%= categoriaTexto %>
    </a>

    <section class="product-detail">

        <div class="product-gallery">
            <div class="main-product-image">
                <img src="<%= imagenProducto %>" alt="<%= producto %>">
            </div>
        </div>

        <div class="product-config">

            <div class="product-header">
                <h1><%= producto %></h1>

                <p class="product-price">
                    B/.<%= precioTexto %>
                </p>

                <p class="product-description">
                    <%= descripcion %>
                </p>
            </div>

            <form 
                id="orderForm"
                class="order-form"
                data-nombre="<%= producto %>"
                data-categoria="<%= categoriaTexto %>"
                data-base-price="<%= precioTexto %>"
                data-imagen="<%= imagenProducto %>"
                data-sabor="">

                <div class="option-box">
                    <h2>Cantidad</h2>

                    <div class="quantity-control">
                        <button type="button" id="btnRestar">−</button>
                        <span id="cantidad">1</span>
                        <button type="button" id="btnSumar" class="plus">+</button>
                    </div>
                </div>

                <div class="option-box">
                    <h2>Notas específicas</h2>

                    <textarea 
                        id="notasEspecificas"
                        placeholder="Ej: entrega para evento, preferencia de empaque, indicaciones especiales..."></textarea>
                </div>

                <div class="summary-box">
                    <span>Subtotal</span>
                    <strong id="subtotalPrice">B/.<%= precioTexto %></strong>
                    <small>El total se actualizará según la cantidad seleccionada.</small>

                    <button type="button" class="cart-btn" id="btnAgregarCarrito">
                        Agregar al carrito
                    </button>
                </div>

            </form>

        </div>

    </section>

</main>

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

<script>
    const clienteLogueado = <%= session.getAttribute("idCliente") != null ? "true" : "false" %>;
    const idClienteActual = "<%= session.getAttribute("idCliente") != null ? session.getAttribute("idCliente") : "" %>";
</script>

<script src="detalle-producto.js?v=10"></script>

</body>
</html>