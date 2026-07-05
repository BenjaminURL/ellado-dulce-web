<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras | El Lado Dulce</title>
    <link rel="stylesheet" href="pantalla-de-carrito.css">
</head>
<body>

<header class="navbar">
    <div class="logo">
        <img src="imagenes/logo2019.png" class="logo-img">
        <span>El <strong>Lado Dulce</strong></span>
    </div>

    <nav class="menu">
        <a href="index.jsp">Inicio</a>
        <a href="helados.jsp">Helados</a>
        <a href="#">Bebidas</a>
        <a href="#">Crepes</a>
        <a href="Boquitas.jsp">Boquitas</a>
        <a href="Pasteles.jsp">Pasteles</a>
        <a href="reservas.jsp">Reservas</a>
        <a href="actividades.jsp">Actividades</a>
        <a href="Nosotros.jsp">Nosotros</a>
        <a href="mi-cuenta.jsp">Mi cuenta</a>
    </nav>

    <div class="cart">
        <a class="active" href="pantalla-de-carrito.jsp">🛒 <span class="cart-count">3</span></a>
    </div>
</header>

<main class="cart-page">
    <h1 class="cart-title">Tu <span>Carrito</span></h1>

    <section class="cart-content" id="cartContent">
        <div class="cart-list-card">
            <div id="cartItems">
                <div class="empty-cart-inline" id="emptyCart">
                    <h2>Sin productos</h2>
                    <p>Aún no has agregado productos al carrito.</p>
                    <a href="Boquitas.jsp">Ver productos</a>
                </div>
            </div>
        </div>

        <aside class="cart-summary-card">
            <h2>Resumen del pedido</h2>

            <div class="summary-line">
                <span>Subtotal</span>
                <strong id="cartSubtotal">$0.00</strong>
            </div>

            <div class="summary-line">
                <span>ITBMS (7%)</span>
                <strong id="cartTax">$0.00</strong>
            </div>

            <div class="summary-divider"></div>

            <div class="summary-line total-line">
                <span>Total</span>
                <strong id="cartTotal">$0.00</strong>
            </div>

            <a href="#" class="checkout-btn disabled-checkout" id="checkoutBtn">Proceder al pago</a>
        </aside>
    </section>
</main>

<footer class="footer">
    <div>
        <div class="footer-logo">
            <img src="imagenes/logo2019.png" class="footer-logo-img">
            <h3>El <span>Lado Dulce</span></h3>
        </div>
        <p>Tu lugar favorito para endulzar cada momento.</p>
    </div>
    <div>
        <h3>Horarios</h3>
        <p>Lunes<br>10:00 a.m. - 8:00 p.m.</p>
        <br>
        <p>Martes a Domingo<br>10:00 a.m. - 9:00 p.m.</p>
    </div>
    <div>
        <h3>Ubicación</h3>
        <p>Brisas Mall, Av. Principal, San Miguelito, Provincia de Panamá.</p>
        <br>
        <a href="#">Cómo llegar →</a>
    </div>
    <div>
        <h3>Contacto</h3>
        <p>@elladodulce</p>
        <br>
        <p>+507 315-8752</p>
    </div>
    <div class="copyright">
        © 2026 El Lado Dulce. Todos los derechos reservados.
    </div>
</footer>
<script src="pantalla-de-carrito.js"></script>
</body>
</html>