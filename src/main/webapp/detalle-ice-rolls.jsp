<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ice Cream Rolls | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="detalle-producto.css">
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
                    <h1>Ice Cream Rolls</h1>
                    <p class="product-price">Desde $5.50</p>
                    <p class="product-description">
                        Helado preparado al momento en planchas frías con ingredientes frescos y naturales.
                        Enrollado a mano, suave y delicioso para cada antojo.
                    </p>
                </div>

                <form class="order-form" id="orderForm" data-base-price="5.50">

                    <section class="option-box">
                        <h2>1. Elige tu sabor</h2>

                        <div class="flavor-options">
                            <label class="flavor-card">
    <input type="radio" name="sabor" value="Fresa" checked>
    <span class="flavor-circle"></span>
    <small>Fresa</small>
</label>
<label class="flavor-card">
    <input type="radio" name="sabor" value="Nutella">
    <span class="flavor-circle"></span>
    <small>Nutella</small>
</label>

<label class="flavor-card">
    <input type="radio" name="sabor" value="Passion Fruit">
    <span class="flavor-circle"></span>
    <small>Passion Fruit</small>
</label>

<label class="flavor-card">
    <input type="radio" name="sabor" value="Vainilla">
    <span class="flavor-circle"></span>
    <small>Vainilla</small>
</label>

<label class="flavor-card">
    <input type="radio" name="sabor" value="Chocolate">
    <span class="flavor-circle"></span>
    <small>Chocolate</small>
</label>
                        </div>
                    </section>

                    <section class="option-box">
                        <h2>2. Agrega toppings <span>(opcional)</span></h2>
                        <p class="option-note">Puedes agregar más de uno.</p>
                        <div class="topping-grid">
    <label class="topping-option">
        <input type="checkbox" class="topping-checkbox" value="Fresa fresca" data-price="1.00">
        <span>Fresa fresca</span>
        <strong>+$1.00</strong>
    </label>

    <label class="topping-option">
        <input type="checkbox" class="topping-checkbox" value="Nutella Banana" data-price="1.50">
        <span>Nutella Banana</span>
        <strong>+$1.50</strong>
    </label>

    <label class="topping-option">
        <input type="checkbox" class="topping-checkbox" value="Oreo triturado" data-price="1.00">
        <span>Oreo triturado</span>
        <strong>+$1.00</strong>
    </label>

    <label class="topping-option">
        <input type="checkbox" class="topping-checkbox" value="Mango y chamoy" data-price="1.25">
        <span>Mango y chamoy</span>
        <strong>+$1.25</strong>
    </label>

    <label class="topping-option">
        <input type="checkbox" class="topping-checkbox" value="Chispas de choco" data-price="0.75">
        <span>Chispas de choco</span>
        <strong>+$0.75</strong>
    </label>

    <label class="topping-option">
        <input type="checkbox" class="topping-checkbox" value="Leche condensada" data-price="0.75">
        <span>Leche condensada</span>
        <strong>+$0.75</strong>
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
                        <h2>4. Notas especiales <span>(opcional)</span></h2>

                        <textarea placeholder="Ej: sin azúcar, extra fresa, sin leche condensada..."></textarea>
                    </section>

                    <section class="summary-box">
                        <div>
                            <span>Subtotal</span>
                            <strong id="subtotalPrice">$5.50</strong>
                            <small>Precio provisional</small>
                        </div>

                        <button type="button" class="cart-btn" id="btnAgregarCarrito">
    Agregar al carrito
</button>

                        <a
                            class="whatsapp-btn"
                            href="https://wa.me/5071234567?text=Hola,%20quiero%20pedir%20un%20Ice%20Cream%20Rolls."
                            target="_blank">
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
                    <h3>Frozen Yogurt</h3>
                    <p>Yogurt helado con tus toppings favoritos.</p>
                    <strong>$4.75</strong>
                    <a href="#">Ver más</a>
                </article>

                <article class="related-card">
                    <div class="related-img placeholder"></div>
                    <h3>Sundae</h3>
                    <p>Helado clásico con sirope y toppings.</p>
                    <strong>$4.95</strong>
                    <a href="#">Ver más</a>
                </article>

                <article class="related-card">
                    <div class="related-img placeholder"></div>
                    <h3>Cono de Vainilla</h3>
                    <p>Vainilla cremosa en cono crujiente.</p>
                    <strong>$2.50</strong>
                    <a href="#">Ver más</a>
                </article>

                <article class="related-card">
                    <div class="related-img placeholder"></div>
                    <h3>Crepa Nutella Fresa</h3>
                    <p>Crepa dulce con Nutella y frutas.</p>
                    <strong>$7.00</strong>
                    <a href="#">Ver más</a>
                </article>
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
    <script src="detalle-producto.js"></script>
</body>
</html>