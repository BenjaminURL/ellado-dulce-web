<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Cupcakes Tradicionales | El Lado Dulce</title>

    <title>Decoración de Cupcakes | Ellado Dulce</title>


    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="detalle-producto.css">

    <link rel="stylesheet" href="detalle-cupcakes.css">

</head>
<body>

    <header class="navbar">
        <div class="logo">

            <img src="imagenes/logo2019.png" alt="Logo El Lado Dulce" class="logo-img">
            <span>El <strong>Lado Dulce</strong></span>

            <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="logo-img">
            <span>Ellado <strong>Dulce</strong></span>

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
                    <h1>Cupcakes Tradicionales</h1>
                    <p class="product-price">$15.00</p>
                    <p class="product-description">
                        Esponjosos con buttercream de vainilla, chocolate o dulce de leche.
                        Mínimo 12 unidades por pedido. Ideales para cumpleaños y celebraciones.
                    </p>
                </div>

                <form class="order-form" id="orderForm" data-base-price="15.00">

                    <section class="option-box">
                        <h2>1. Elige el sabor</h2>

                        <div class="flavor-options">
                            <label class="flavor-card selected">
                                <input type="radio" name="sabor" value="Vainilla" checked>
                                <span class="flavor-circle"></span>
                                <small>Vainilla</small>
                            </label>

                            <label class="flavor-card">
                                <input type="radio" name="sabor" value="Chocolate">
                                <span class="flavor-circle"></span>
                                <small>Chocolate</small>
                            </label>

                            <label class="flavor-card">
                                <input type="radio" name="sabor" value="Dulce de Leche">
                                <span class="flavor-circle"></span>
                                <small>Dulce de Leche</small>
                            </label>

                            <label class="flavor-card">
                                <input type="radio" name="sabor" value="Surtido">
                                <span class="flavor-circle"></span>
                                <small>Surtido</small>
                            </label>
                        </div>
                    </section>

                    <section class="option-box">
                        <h2>2. Agrega decoración <span>(opcional)</span></h2>
                        <p class="option-note">Puedes agregar más de uno.</p>

                        <div class="topping-grid">
                            <label class="topping-option">
                                <input type="checkbox" class="topping-checkbox" value="Chispas de colores" data-price="0.50">
                                <span>Chispas de colores</span>
                                <strong>+$0.50</strong>
                            </label>

                            <label class="topping-option">
                                <input type="checkbox" class="topping-checkbox" value="Flores comestibles" data-price="1.00">
                                <span>Flores comestibles</span>
                                <strong>+$1.00</strong>
                            </label>

                            <label class="topping-option">
                                <input type="checkbox" class="topping-checkbox" value="Mensaje personalizado" data-price="0.50">
                                <span>Mensaje personalizado</span>
                                <strong>+$0.50</strong>
                            </label>
                        </div>
                    </section>

                    <section class="option-box quantity-box">
                        <h2>3. Cantidad (mín. 12 uds.)</h2>

                        <div class="quantity-control">
                            <button type="button" id="btnRestar">−</button>
                            <span id="cantidad">12</span>
                            <button type="button" id="btnSumar" class="plus">+</button>
                        </div>
                        <p style="font-size: 12px; color: #b0aec4; margin-top: 10px;">Mínimo 12 unidades</p>
                    </section>

                    <section class="option-box">
                        <h2>4. Notas especiales <span>(opcional)</span></h2>

                        <textarea id="notas" placeholder="Ej: sin frutos secos, buttercream extra..."></textarea>
                    </section>

                    <section class="summary-box">
                        <div>
                            <span>Subtotal</span>
                            <strong id="subtotalPrice">$15.00</strong>
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

    <main class="detalle-page">

        <a href="actividades.jsp" class="back-link">← Volver a Actividades</a>

        <section class="detalle-layout">

            <div class="gallery-area">
                <div class="main-image placeholder"></div>

                <div class="thumbs">
                    <button type="button" class="thumb active placeholder"></button>
                    <button type="button" class="thumb placeholder"></button>
                    <button type="button" class="thumb placeholder"></button>
                    <button type="button" class="thumb placeholder"></button>
                </div>
            </div>

            <div class="info-area">
                <h1>Decoración de cupcakes</h1>

                <div class="price">
                    <strong>Desde $18</strong>
                    <span>/ persona</span>
                </div>

                <p class="description">
                    Aprende a decorar cupcakes con crema, glasé, fondant, colores y toppings.
                    Es una actividad dulce, creativa y perfecta para niños, jóvenes o adultos
                    que quieran crear sus propios postres personalizados.
                </p>

                <section class="option-box">
                    <h2><span>1.</span> Elige horario</h2>

                    <div class="schedule-options">
                        <button type="button" class="schedule-option selected" data-horario="Sábado 3:00 p.m.">
                            <strong>Sábado</strong>
                            <small>3:00 p.m.</small>
                        </button>

                        <button type="button" class="schedule-option" data-horario="Domingo 1:00 p.m.">
                            <strong>Domingo</strong>
                            <small>1:00 p.m.</small>
                        </button>
                    </div>
                </section>

                <section class="option-box">
                    <h2><span>2.</span> Cantidad de cupos</h2>

                    <div class="quantity-row">
                        <div class="quantity-control">
                            <button type="button" id="btnRestar">−</button>
                            <strong id="cantidad">1</strong>
                            <button type="button" id="btnSumar">+</button>
                        </div>

                        <p>Cupos limitados por horario.</p>
                    </div>
                </section>

                <section class="option-box">
                    <h2><span>3.</span> Nivel</h2>

                    <div class="level-options">
                        <button type="button" class="level-option selected" data-nivel="Principiante">
                            Principiante
                        </button>

                        <button type="button" class="level-option" data-nivel="Todos los niveles">
                            Todos los niveles
                        </button>
                    </div>
                </section>

                <section class="option-box">
                    <h2><span>4.</span> Notas especiales <small>(opcional)</small></h2>

                    <input 
                        type="text" 
                        id="notas" 
                        placeholder="Ej: edad del participante, alergias, colores preferidos..."
                    >
                </section>

                <section class="summary-box">
                    <div class="summary-top">
                        <div>
                            <span>Resumen</span>
                            <strong>Subtotal</strong>
                        </div>

                        <div class="summary-price">
                            <strong id="subtotal">$18.00</strong>
                            <span>Precio por persona</span>
                        </div>
                    </div>

                    <button type="button" class="buy-btn" id="comprarCupo">
                        Comprar cupo
                    </button>

                    <a href="#" target="_blank" class="whatsapp-btn" id="whatsappBtn">
                        Pedir vía WhatsApp
                    </a>

                    <div class="confirmation-box hidden" id="confirmationBox">
                        <span>Número de confirmación</span>
                        <strong id="confirmationNumber">ED-CUP-0000</strong>
                        <p>Este número aparecerá en el perfil del cliente.</p>
                    </div>

                    <p class="secure-text">
                        Al confirmar el pago recibirás tu número de cupo o confirmación.
                    </p>
                </section>

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


                <article class="related-card">
                    <div class="related-img placeholder"></div>

                    <div class="related-content">
                        <h3>Crochet</h3>
                        <p>
                            Aprende las técnicas básicas del crochet y crea tus primeras piezas.
                        </p>

                        <div class="related-bottom">
                            <strong>$18 <span>/ persona</span></strong>
                            <a href="detalle-crochet.jsp">Ver más</a>
                        </div>
                    </div>

                </article>

                <article class="related-card">
                    <div class="related-img placeholder"></div>

                    <h3>Brownies de Fudge</h3>
                    <p>Húmedos de chocolate intenso.</p>
                    <strong>$10.00</strong>
                    <a href="detalle-brownies.jsp">Ver más</a>


                    <div class="related-content">
                        <h3>Dibujo</h3>
                        <p>
                            Descubre tu creatividad aprendiendo técnicas de dibujo y sombreado.
                        </p>

                        <div class="related-bottom">
                            <strong>$12 <span>/ persona</span></strong>
                            <a href="detalle-dibujo.jsp">Ver más</a>
                        </div>
                    </div>

                </article>

                <article class="related-card">
                    <div class="related-img placeholder"></div>

                    <h3>Alfajores de Maicena</h3>
                    <p>Rellenos de dulce de leche.</p>
                    <strong>$9.50</strong>
                    <a href="detalle-alfajores.jsp">Ver más</a>
                </article>


                    <div class="related-content">
                        <h3>Decoración de galletas</h3>
                        <p>
                            Decora galletas con glasé real, colores vibrantes y diseños únicos.
                        </p>

                        <div class="related-bottom">
                            <strong>$15 <span>/ persona</span></strong>
                            <a href="detalle-galletas.jsp">Ver más</a>
                        </div>
                    </div>
                </article>

                <article class="related-card">
                    <div class="related-img placeholder"></div>

                    <div class="related-content">
                        <h3>Origami</h3>
                        <p>
                            Aprende a doblar papel y crear figuras increíbles.
                        </p>

                        <div class="related-bottom">
                            <strong>$10 <span>/ persona</span></strong>
                            <a href="detalle-origami.jsp">Ver más</a>
                        </div>
                    </div>
                </article>

            </div>
        </section>

    </main>

    <footer class="footer">
        <div class="footer-col">
            <div class="footer-logo">

                <img src="imagenes/logo2019.png" alt="Logo El Lado Dulce" class="footer-logo-img">
                <h3>El <span>Lado Dulce</span></h3>

                <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="footer-logo-img">
                <h3>Ellado <span>Dulce</span></h3>

            </div>
            <p>Tu lugar favorito para endulzar cada momento.</p>
        </div>

        <div class="footer-col">
            <h3>Horarios</h3>

            <p>Lunes<br>10:00 a.m. - 8:00 p.m.</p>
            <p>Martes a Domingo<br>10:00 a.m. - 9:00 p.m.</p>

            <p>Lunes<br>10:00 a.m. - 9:00 p.m.</p>
            <p>Martes a Domingos<br>9:00 a.m. - 9:00 p.m.</p>

        </div>

        <div class="footer-col">
            <h3>Ubicación</h3>

            <p>Brisas Mall, Av. Principal, San Miguelito, Provincia de Panamá.</p>

            <p>Estado Isla, R-1, Principal San Miguelito, Provincia de Panamá.</p>

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

            <p>+507 312-2322</p>
        </div>

        <div class="copyright">
            © 2025 Ellado Dulce. Todos los derechos reservados.
        </div>
    </footer>

    <script src="detalle-cupcakes.js"></script>
</body>
</html>