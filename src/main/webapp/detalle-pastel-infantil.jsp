<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pastel Infantil | El Lado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

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
            <a href="helados.jsp">Helados</a>
            <a href="html/bebidas.jsp">Bebidas</a>
            <a href="#">Crepes</a>
            <a href="Boquitas.jsp">Boquitas</a>
            <a class="active" href="pasteles.jsp">Pasteles</a>
            <a href="#">Reservas</a>
            <a href="#">Actividades</a>
            <a href="#">Nosotros</a>
            <a href="#">Mi cuenta</a>
        </nav>
        <div class="cart">
            <a href="">
                <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
            </a>
        </div>
    </header>

    <main class="product-page">

        <a href="pasteles.jsp" class="back-link">← Volver a Pasteles</a>

        <section class="product-detail">

            <div class="product-gallery">
                <!-- Aquí puedes colocar la imagen por defecto del pastel infantil -->
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
                    <h1>Pastel Infantil</h1>
                    <p class="product-price">Desde $24.50</p>
                    <p class="product-description">
                        Colorido, divertido y delicioso, perfecto para celebrar con los más pequeños. 
                        Decorado con divertidos colores y chispas que alegrarán su día especial.
                    </p>
                </div>

                <form class="order-form" id="orderForm" data-base-price="24.50">

                    <section class="option-box">
                        <h2>1. Elige tu presentación</h2>

                        <div class="flavor-options">
                            <label class="flavor-card selected">
                                <input type="radio" name="presentacion" value="Redondo" checked>
                                <span class="flavor-circle"></span>
                                <small>Redondo</small>
                            </label>

                            <label class="flavor-card">
                                <input type="radio" name="presentacion" value="Cuadrado">
                                <span class="flavor-circle"></span>
                                <small>Cuadrado</small>
                            </label>

                            <label class="flavor-card">
                                <input type="radio" name="presentacion" value="Corazón">
                                <span class="flavor-circle"></span>
                                <small>Corazón</small>
                            </label>
                        </div>
                    </section>

                    <section class="option-box">
                        <h2>2. Detalles adicionales <span>(opcional)</span></h2>
                        <p class="option-note">Puedes elegir más de uno para hacerlo más divertido.</p>

                        <div class="topping-grid">
                            <label class="topping-option">
                                <input type="checkbox" class="topping-checkbox" value="Chispas Extra" data-price="0.75">
                                <span>Chispas de colores</span>
                                <strong>+$0.75</strong>
                            </label>

                            <label class="topping-option">
                                <input type="checkbox" class="topping-checkbox" value="Gomitas" data-price="1.25">
                                <span>Gomitas</span>
                                <strong>+$1.25</strong>
                            </label>

                            <label class="topping-option">
                                <input type="checkbox" class="topping-checkbox" value="Malvaviscos" data-price="1.00">
                                <span>Malvaviscos</span>
                                <strong>+$1.00</strong>
                            </label>

                            <label class="topping-option">
                                <input type="checkbox" class="topping-checkbox" value="Topper Cumpleaños" data-price="2.50">
                                <span>Topper Personalizado</span>
                                <strong>+$2.50</strong>
                            </label>
                        </div>
                    </section>

                    <section class="option-box quantity-box">
                        <h2>3. Cantidad</h2>

                        <div class="quantity-control">
                            <button type="button" id="btnRestar">−</button>
                            <span id="cantidad">1</span>
                            <button type="button" id="btnSumar" class="plus">+</button>
                        </div>
                    </section>

                    <section class="option-box">
                        <h2>4. Nombre del cumpleañero y notas especiales <span>(opcional)</span></h2>

                        <textarea id="notas" placeholder="Ej: Escribir 'Feliz Cumpleaños Liam', cambiar colores a azul y blanco, etc..."></textarea>
                    </section>

                    <section class="summary-box">
                        <div>
                            <span>Subtotal</span>
                            <strong id="subtotalPrice">$24.50</strong>
                            <small>Precio provisional</small>
                        </div>

                        <button type="button" class="cart-btn">
                            Agregar al carrito 🛒
                        </button>

                        <a class="whatsapp-btn" id="whatsappBtn" href="#" target="_blank">
                            Pedir vía WhatsApp 💬
                        </a>
                    </section>

                </form>

            </div>

        </section>

        <section class="related-section">
            <h2>También te puede gustar</h2>

            <div class="related-grid">
                <article class="related-card">
                    <div class="related-img placeholder"></div>
                    <h3>Pastel de Vainilla</h3>
                    <p>Esponjoso con buttercream.</p>
                    <strong>$19.99</strong>
                    <a href="detalle-pastel-vainilla.jsp">Ver más</a>
                </article>

                <article class="related-card">
                    <div class="related-img placeholder"></div>
                    <h3>Pastel de Chocolate</h3>
                    <p>Chocolate intenso con ganache.</p>
                    <strong>$22.50</strong>
                    <a href="detalle-pastel-chocolate.jsp">Ver más</a>
                </article>

                <article class="related-card">
                    <div class="related-img placeholder"></div>
                    <h3>Pastel de Frutas</h3>
                    <p>Fresco con crema pastelera y frutas.</p>
                    <strong>$26.50</strong>
                    <a href="detalle-pastel-frutas.jsp">Ver más</a>
                </article>
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
            <br>
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
            <br>
            <p>+507 315-8752</p>
        </div>

        <div class="copyright">
            © 2026 El Lado Dulce. Todos los derechos reservados.
        </div>
    </footer>

    <script src="detalle-producto.js"></script>
</body>
</html>