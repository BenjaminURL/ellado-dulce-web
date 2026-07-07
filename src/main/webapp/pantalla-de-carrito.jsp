<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    if (session.getAttribute("idCliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int idCliente = (Integer) session.getAttribute("idCliente");

    int puntosCliente = 0;

    Connection conPuntos = null;
    PreparedStatement psPuntos = null;
    ResultSet rsPuntos = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        conPuntos = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        String sqlPuntos =
            "SELECT c_puntos " +
            "FROM cliente " +
            "WHERE c_id_cliente = ?";

        psPuntos = conPuntos.prepareStatement(sqlPuntos);
        psPuntos.setInt(1, idCliente);

        rsPuntos = psPuntos.executeQuery();

        if (rsPuntos.next()) {
            puntosCliente = rsPuntos.getInt("c_puntos");
        }

    } catch (Exception e) {
        puntosCliente = 0;

    } finally {
        if (rsPuntos != null) rsPuntos.close();
        if (psPuntos != null) psPuntos.close();
        if (conPuntos != null) conPuntos.close();
    }

    double descuentoDisponible = puntosCliente / 10.0;
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito | Ellado Dulce</title>

    <link rel="stylesheet" href="layout.css">
    <link rel="stylesheet" href="pantalla-de-carrito.css">
</head>
<body>

<header class="navbar">
    <div class="logo">
        <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="logo-img">
        <span>Ellado <strong>Dulce</strong></span>
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

<main class="cart-page">

    <a href="index.jsp" class="back-link">← Seguir comprando</a>

    <h1 class="cart-title">Tu <span>carrito</span></h1>

    <section class="cart-content">

        <section class="cart-list-card">

            <div class="cart-title-row">
                <h2>Productos seleccionados</h2>

                <button type="button" id="clearCartBtn" class="clear-cart-btn">
                    Vaciar carrito
                </button>
            </div>

            <div id="emptyCartMessage" class="empty-cart-inline hidden">
                <h2>Tu carrito está vacío</h2>
                <p>Agrega productos para continuar con tu compra.</p>
                <a href="index.jsp">Ver productos</a>
            </div>

            <div id="cartItems">
                <!-- Productos cargados con JavaScript -->
            </div>

            <div class="cart-back-link">
                <a href="index.jsp">← Seguir comprando</a>
            </div>

        </section>

        <aside class="cart-summary-card">

            <h2>Resumen del pedido</h2>

            <div class="summary-line">
                <span>Subtotal</span>
                <strong id="subtotalAmount">$0.00</strong>
            </div>

            <div class="summary-line">
                <span>ITBMS</span>
                <strong id="itbmsAmount">$0.00</strong>
            </div>

            <div class="summary-line hidden" id="pointsDiscountLine">
                <span>Descuento por puntos</span>
                <strong id="pointsDiscountAmount">-$0.00</strong>
            </div>

            <div class="points-redeem-box">
                <h3>Usar puntos</h3>

                <p>
                    Tienes <strong><%= puntosCliente %></strong> puntos disponibles.
                </p>

                <p>
                    Equivalen hasta 
                    <strong>B/.<%= String.format(java.util.Locale.US, "%.2f", descuentoDisponible) %></strong>
                    de descuento.
                </p>

                <label class="points-check-label">
                    <input type="checkbox" id="usarPuntosCheck">
                    Usar mis puntos en esta compra
                </label>

                <small>10 puntos = B/.1.00 de descuento.</small>
            </div>

            <div class="summary-divider"></div>

            <div class="summary-divider"></div>

            <div class="summary-line total-line">
                <span>Total</span>
                <strong id="totalAmount">$0.00</strong>
            </div>

            <button type="button" id="checkoutBtn" class="checkout-btn">
                Confirmar pedido
            </button>

        </aside>

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
        <p>Martes a Domingos<br>1:00 p.m. - 9:00 p.m.</p>
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
    const clienteLogueado = true;
    const idClienteActual = "<%= idCliente %>";
    const puntosClienteActual = <%= puntosCliente %>;
</script>

<script src="pantalla-de-carrito.js"></script>

</body>
</html>