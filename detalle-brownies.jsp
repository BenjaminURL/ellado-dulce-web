<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Brownies de Fudge | El Lado Dulce</title>

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
            <a href="">
                <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
            </a>
        </div>
    </header>

    <main class="product-page">

        <a href="Boquitas.jsp" class="back-link">← Volver a Boquitas</a>

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
                    <h1>Brownies de Fudge</h1>
                    <p class="product-price">$10.00</p>
                    <p class="product-description">
                        Húmedos de chocolate intenso, cortados en cuadritos individuales.
                        Mínimo 10 unidades por pedido. Perfectos para cualquier ocasión.
                    </p>
                </div>

                <form class="order-form" id="orderForm" data-base-price="10.00">

                    <section class="option-box">
                        <h2>1. Elige el tipo</h2>

                        <div class="flavor-options">
                            <label class="flavor-card selected">
                                <input type="radio" name="sabor" value="Clásico" checked>
                                <span class="flavor-circle"></span>
                                <small>Clásico</small>
                            </label>

                            <label class="flavor-card">
                                <input type="radio" name="sabor" value="Con nueces">
                                <span class="flavor-circle"></span>
                                <small>Con nueces</small>
                            </label>

                            <label class="flavor-card">
                                <input type="radio" name="sabor" value="Con chispas">
                                <span class="flavor-circle"></span>
                                <small>Con chispas</small>
                            </label>
                        </div>
                    </section>

                    <section class="option-box">
                        <h2>2. Agrega toppings <span>(opcional)</span></h2>
                        <p class="option-note">Puedes agregar más de uno.</p>

                        <div class="topping-grid">
                            <label class="topping-option">
                                <input type="checkbox" class="topping-checkbox" value="Salsa de chocolate" data-price="1.00">
                                <span>Salsa de chocolate</span>
                                <strong>+$1.00</strong>
                            </label>

                            <label class="topping-option">
                                <input type="checkbox" class="topping-checkbox" value="Helado de vainilla" data-price="1.50">
                                <span>Helado de vainilla</span>
                                <strong>+$1.50</strong>
                            </label>

                            <label class="topping-option">
                                <input type="checkbox" class="topping-checkbox" value="Fresas frescas" data-price="1.00">
                                <span>Fresas frescas</span>
                                <strong>+$1.00</strong>
                            </label>
                        </div>
                    </section>

                    <section class="option-box quantity-box">
                        <h2>3. Cantidad (mín. 10 uds.)</h2>

                        <div class="quantity-control">
                            <button type="button" id="btnRestar">−</button>
                            <span id="cantidad">10</span>
                            <button type="button" id="btnSumar" class="plus">+</button>
                        </div>
                        <p style="font-size: 12px; color: #b0aec4; margin-top: 10px;">Mínimo 10 unidades</p>
                    </section>

                    <section class="option-box">
                        <h2>4. Notas especiales <span>(opcional)</span></h2>

                        <textarea id="notas" placeholder="Ej: sin nueces, extra húmedo..."></textarea>
                    </section>

                    <section class="summary-box">
                        <div>
                            <span>Subtotal</span>
                            <strong id="subtotalPrice">$10.00</strong>
                            <small>Precio provisional</small>
                        </div>

                        <button type="button" class="cart-btn">
                            Agregar al carrito
                        </button>

                        <a class="whatsapp-btn" id="whatsappBtn" href="#" target="_blank">
                            Pedir vía WhatsApp
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
                    <h3>Mini Donas</h3>
                    <p>Glaseadas con toppings artesanales.</p>
                    <strong>$12.50</strong>
                    <a href="detalle-mini-donas.jsp">Ver más</a>
                </article>

                <article class="related-card">
                    <div class="related-img placeholder"></div>
                    <h3>Cupcakes Tradicionales</h3>
                    <p>Esponjosos con buttercream.</p>
                    <strong>$15.00</strong>
                    <a href="detalle-cupcakes.jsp">Ver más</a>
                </article>

                <article class="related-card">
                    <div class="related-img placeholder"></div>
                    <h3>Alfajores de Maicena</h3>
                    <p>Rellenos de dulce de leche.</p>
                    <strong>$9.50</strong>
                    <a href="detalle-alfajores.jsp">Ver más</a>
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
            © 2026 El Lado Dulce. Todos los derechos reservados.
        </div>
    </footer>

    <script src="detalle-producto.js"></script>
</body>
</html>