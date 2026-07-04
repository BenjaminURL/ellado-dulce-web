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
        <a href="#">Helados</a>
        <a href="#">Bebidas</a>
        <a href="#">Crepes</a>
        <a href="Boquitas.jsp">Boquitas</a>
        <a href="pasteles.jsp">Pasteles</a>
        <a href="#">Reservas</a>
        <a href="#">Actividades</a>
        <a href="#">Nosotros</a>
        <a href="#">Mi cuenta</a>
    </nav>

    <div class="cart">
        <a class="active" href="carrito.jsp">🛒 <span class="cart-count">3</span></a>
    </div>
</header>

<main class="cart-container">
    <h1 class="cart-title">Tu <span>Carrito</span></h1>

    <div class="cart-layout">
        <section class="cart-items">
            
            <div class="cart-item">
                <div class="item-img-placeholder">
                    <!-- <span>🧁</span> -->
                </div>
                <div class="item-details">
                    <h3>Cupcakes Tradicionales</h3>
                    <p class="item-meta">Categoría: Boquitas Dulces | Mín. 12 uds.</p>
                    <span class="item-unit-price">$15.00</span>
                </div>
                <div class="item-quantity">
                    <button class="qty-btn">-</button>
                    <input type="number" value="1" min="1" readonly>
                    <button class="qty-btn">+</button>
                </div>
                <div class="item-total">
                    $15.00
                </div>
                <button class="item-remove" title="Eliminar producto">×</button>
            </div>

            <div class="cart-item">
                <div class="item-img-placeholder">
                    <!-- <span>🫔</span> -->
                </div>
                <div class="item-details">
                    <h3>Tequeños Venezolanos</h3>
                    <p class="item-meta">Categoría: Boquitas Saladas | Mín. 25 uds.</p>
                    <span class="item-unit-price">$15.50</span>
                </div>
                <div class="item-quantity">
                    <button class="qty-btn">-</button>
                    <input type="number" value="2" min="1" readonly>
                    <button class="qty-btn">+</button>
                </div>
                <div class="item-total">
                    $31.00
                </div>
                <button class="item-remove" title="Eliminar producto">×</button>
            </div>

            <div class="cart-item">
                <div class="item-img-placeholder">
                    <!-- <span>🍋</span> -->
                </div>
                <div class="item-details">
                    <h3>Dispensador de Limonada con Hierbabuena</h3>
                    <p class="item-meta">Categoría: Bebidas | Capacidad: 5 Litros</p>
                    <span class="item-unit-price">$18.50</span>
                </div>
                <div class="item-quantity">
                    <button class="qty-btn">-</button>
                    <input type="number" value="1" min="1" readonly>
                    <button class="qty-btn">+</button>
                </div>
                <div class="item-total">
                    $18.50
                </div>
                <button class="item-remove" title="Eliminar producto">×</button>
            </div>

            <div class="cart-back-link">
                <a href="Boquitas.jsp">← Seguir comprando boquitas u otros productos</a>
            </div>
        </section>

        <aside class="cart-summary">
            <h2>Resumen del Pedido</h2>
            
            <div class="summary-row">
                <span>Subtotal (4 productos)</span>
                <span>$64.50</span>
            </div>
            <div class="summary-row">
                <span>ITBMS (7%)</span>
                <span>$4.52</span>
            </div>
            <div class="summary-row delivery-row">
                <span>Método de entrega</span>
                <select class="summary-select">
                    <option value="pickup">Retiro en Brisas Mall</option>
                    <option value="delivery">Envío a domicilio</option>
                </select>
            </div>
            
            <hr class="summary-divider">

            <div class="summary-row total-row">
                <span>Total Estimado</span>
                <strong>$69.02</strong>
            </div>

            <div class="coupon-container">
                <input type="text" placeholder="Código de descuento" class="coupon-input">
                <button class="coupon-btn">Aplicar</button>
            </div>

            <a href="#" class="btn btn-primary btn-checkout">Proceder al Pago</a>
            
            <div class="secure-checkout-badge">
                <!-- 🔒 Pago 100% seguro y garantizado -->
            </div>
        </aside>
    </div>
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

</body>
</html>