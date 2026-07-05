<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Barquillo de Vainilla | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="detalle-barquillo.css">
</head>
<body>

    <header class="navbar">
        <div class="logo">
            <img src="imagenes/logo2019.png" class="logo-img" alt="Logo El Lado Dulce" />
            <span>El <strong>Lado Dulce</strong></span>
        </div>

        <nav class="menu">
            <a class="active" href="index.jsp">Inicio</a>
            <a href="helados.jsp">Helados</a>
            <a href="html/bebidas.jsp">Bebidas</a>
            <a href="">Crepes</a>

            <a href="Boquitas.jsp">Boquitas</a>
            <a href="pasteles.jsp">Pasteles</a>
            <a href="reservas.jsp">Reservas</a>
            <a href="actividades.jsp">Actividades</a>
            <a href="nosotros.jsp">Nosotros</a>
            <a href="mi-cuenta.jsp">Mi cuenta</a>
        </nav>
        <div class="cart">
            <a href="pantalla-de-carrito.jsp">
                <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
            </a>
        </div>
    </header>

    <main class="product-page">

        <a href="helados.jsp" class="back-link">← Volver a Helados</a>

        <section class="product-detail">

            <div class="product-gallery">
                <div class="main-product-image placeholder"></div>

                <div class="thumbnail-row">
                    <div class="thumbnail placeholder active-thumb"></div>
                    <div class="thumbnail placeholder"></div>
                    <div class="thumbnail placeholder"></div>
                    <div class="thumbnail placeholder"></div>
                </div>
            </div>

            <div class="product-config">

                <div class="product-header">
                    <h1>Barquillo de Vainilla</h1>
                    <p class="product-price">$2.50</p>
                    <p class="product-description">
                        Barquillo clásico con helado de vainilla suave y cremoso.
                        Una opción sencilla, dulce y perfecta para cualquier momento.
                    </p>
                </div>

                <form 
    class="order-form" 
    id="orderForm" 
    data-base-price="2.50"
    data-nombre="Cono de Vainilla"
    data-categoria="Helados"
    data-sabor="Vainilla"
    data-imagen="URL_DE_LA_IMAGEN">

                    <section class="option-box">
                        <h2>1. Producto</h2>

                        <div class="base-fixed">
                            <span class="base-circle"></span>

                            <div>
                                <strong>Barquillo de vainilla</strong>
                                <p>Este producto no lleva toppings adicionales.</p>
                            </div>
                        </div>
                    </section>

                    <section class="option-box quantity-box">
                        <h2>2. Cantidad</h2>

                        <div class="quantity-control">
                            <button type="button" id="btnRestar">−</button>
<span id="cantidad">1</span>
<button type="button" id="btnSumar" class="plus">+</button>
                        </div>
                    </section>

                    <section class="option-box">
                        <h2>3. Notas especiales <span>(opcional)</span></h2>

                        <textarea id="notasEspecificas" placeholder="Ej: servir bien frío, sin servilleta extra..."></textarea>
                    </section>

                    <section class="summary-box">
                        <div>
                            <span>Subtotal</span>
                            <strong id="subtotalPrice">$2.50</strong>
                            <small>Precio fijo por unidad</small>
                        </div>

                        <button type="button" class="cart-btn" id="btnAgregarCarrito">
    Agregar al carrito
</button>

                        <a
                            class="whatsapp-btn"
                            id="barquilloWhatsapp"
                            href="#"
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
                <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="footer-logo-img">
                <h3>Ellado <span>Dulce</span></h3>
            </div>
            <p>Tu lugar favorito para endulzar cada momento.</p>
        </div>

        <div class="footer-col">
            <h3>Horarios</h3>
            <p>Lunes<br>10:00 a.m. - 8:00 p.m.</p>
            <p>Martes a Domingo<br>10:00 a.m. - 9:00 p.m.</p>
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
            © 2025 Ellado Dulce. Todos los derechos reservados.
        </div>
    </footer>

    <script>
    const clienteLogueado = <%= session.getAttribute("idCliente") != null ? "true" : "false" %>;
    const idClienteActual = "<%= session.getAttribute("idCliente") != null ? session.getAttribute("idCliente") : "" %>";
</script>

<script src="detalle-producto.js"></script>
</body>
</html>