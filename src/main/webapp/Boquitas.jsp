<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boquitas | El Lado Dulce</title>
    <link rel="stylesheet" href="boquitas.css">
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
        <a class="active" href="Boquitas.jsp">Boquitas</a>
        <a href="Pasteles.jsp">Pasteles</a>
        <a href="reservas.jsp">Reservas</a>
        <a href="actividades.jsp">Actividades</a>
        <a href="Nosotros.jsp">Nosotros</a>
        <a href="mi-cuenta.jsp">Mi cuenta</a>
    </nav>

    <div class="cart">
        <a href="#">🛒</a>
    </div>
</header>

<section class="snacks-hero">
    <div class="snacks-info">
        <h1>Boquitas</h1>
        <p>
            Boquitas dulces y saladas para eventos, reuniones y celebraciones.
            Armamos el paquete perfecto según la cantidad de invitados.
        </p>
        <div class="snacks-buttons">
            <a href="#" class="btn-whatsapp">Cotizar por WhatsApp</a>
            <a href="#" class="btn-custom">Armar mi paquete</a>
        </div>
        <div class="snacks-tags">
            <span>Ideal para eventos</span>
            <span>Dulces y saladas</span>
        </div>
    </div>
    <div class="snacks-image">
        <img src="imagenes/boquitas.png" alt="Boquitas para eventos">
    </div>
</section>

<section class="snacks-section">

    <details class="menu-accordion" open>
        <summary class="accordion-header">
            <h2>BOQUITAS DULCES</h2>
            <span class="icon">▼</span>
        </summary>
        <div class="accordion-content">
            <div class="menu-item">
                <span class="item-name">Mini Donas</span>
                <span class="item-description">| Glaseadas en variedad de colores con toppings artesanales. Mín. 12 uds.</span>
                <span class="item-price">$12.50</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Cupcakes Tradicionales</span>
                <span class="item-description">| Esponjosos con buttercream de vainilla, chocolate o dulce de leche. Mín. 12 uds.</span>
                <span class="item-price">$15.00</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Brownies de Fudge</span>
                <span class="item-description">| Húmedos de chocolate intenso, cortados en cuadritos individuales. Mín. 10 uds.</span>
                <span class="item-price">$10.00</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Alfajores de Maicena</span>
                <span class="item-description">| Rellenos de abundante dulce de leche y borde de coco rallado. Mín. 12 uds.</span>
                <span class="item-price">$9.50</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Mini Tartaletas de Frutas</span>
                <span class="item-description">| Base de galleta crocante con crema pastelera y frutas frescas de temporada. Mín. 12 uds.</span>
                <span class="item-price">$14.00</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Macarons Surtidos</span>
                <span class="item-description">| Delicados bocadillos franceses rellenos de ganache de sabores. Mín. 10 uds.</span>
                <span class="item-price">$16.50</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Shots Dulces en Vasito</span>
                <span class="item-description">| Mini postres individuales (Tres leches, Marquesa de chocolate, Cheesecake). Mín. 15 uds.</span>
                <span class="item-price">$22.50</span>
            </div>
        </div>
    </details>

    <!-- ACORDEÓN 2: BOQUITAS SALADAS -->
    <details class="menu-accordion">
        <summary class="accordion-header">
            <h2>BOQUITAS SALADAS</h2>
            <span class="icon">▼</span>
        </summary>
        <div class="accordion-content">
            <div class="menu-item">
                <span class="item-name">Mini Empanaditas</span>
                <span class="item-description">| Masa horneada crujiente rellenas de carne molida, pollo desmechado o queso. Mín. 20 uds.</span>
                <span class="item-price">$18.00</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Tequeños Venezolanos</span>
                <span class="item-description">| Deditos de masa frita rellenos de queso blanco fundido, dorados y crujientes. Mín. 25 uds.</span>
                <span class="item-price">$15.50</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Canapés Gourmet Surtidos</span>
                <span class="item-description">| Base de pan tostado con combinaciones elegantes (salmón, queso crema, jamón serrano). Mín. 15 uds.</span>
                <span class="item-price">$22.00</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Mini Quiches</span>
                <span class="item-description">| Tartas saladas francesas de jamón con queso (Lorraine) o espinacas. Mín. 12 uds.</span>
                <span class="item-price">$14.50</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Croquetas de Jamón</span>
                <span class="item-description">| Crujientes por fuera y extremadamente cremosas por dentro. Mín. 20 uds.</span>
                <span class="item-price">$16.00</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Mini Hamburguesas Artesanales</span>
                <span class="item-description">| Pan brioche suave, carne premium, queso fundido y salsa de la casa. Mín. 10 uds.</span>
                <span class="item-price">$24.00</span>
            </div>
        </div>
    </details>

    <!-- ACORDEÓN 3: ESTACIONES Y TABLAS -->
    <details class="menu-accordion">
        <summary class="accordion-header">
            <h2>TABLAS Y ESTACIONES</h2>
            <span class="icon">▼</span>
        </summary>
        <div class="accordion-content">
            <div class="menu-item">
                <span class="item-name">Tabla de Quesos y Embutidos Mediana</span>
                <span class="item-description">| Selección de quesos finos, jamones, frutas secas, aceitunas y galletas. Para 6-8 personas.</span>
                <span class="item-price">$38.00</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Tabla de Quesos y Embutidos Grande</span>
                <span class="item-description">| Presentación premium ideal para mesas principales de picadas. Para 12-15 personas.</span>
                <span class="item-price">$65.00</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Estación de Crudités</span>
                <span class="item-description">| Bastoncitos de zanahoria, apio, pepino y tomates cherry acompañados de dip de yogurt y cilantro.</span>
                <span class="item-price">$20.00</span>
            </div>
        </div>
    </details>

    <!-- ACORDEÓN 4: BEBIDAS PARA EVENTOS -->
    <details class="menu-accordion">
        <summary class="accordion-header">
            <h2>BEBIDAS REFRESCANTES</h2>
            <span class="icon">▼</span>
        </summary>
        <div class="accordion-content">
            <div class="menu-item">
                <span class="item-name">Dispensador de Limonada con Hierbabuena</span>
                <span class="item-description">| Bebida refrescante natural en dispensador de vidrio premium. Incluye vasos. Capacidad: 5 Litros.</span>
                <span class="item-price">$18.50</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Dispensador de Té Frío de la Casa</span>
                <span class="item-description">| Té negro preparado de forma artesanal con toques de limón y endulzado al punto. Capacidad: 5 Litros.</span>
                <span class="item-price">$16.00</span>
            </div>
            <div class="menu-item">
                <span class="item-name">Pack de Botellas de Agua Personalizadas</span>
                <span class="item-description">| Agua mineral de manantial fresca con etiquetas limpias de la marca. Paquete de 12 uds.</span>
                <span class="item-price">$10.00</span>
            </div>
        </div>
    </details>

</section>

<section class="reserve-section">
    <div class="reserve-info">
        <h2><span></span> Paquetes para eventos</h2>
        <p style="color: black">
            Elige el paquete de boquitas que mejor se adapte a tu evento.
            Incluye variedad dulce y salada, con opción de personalizar el menú.
        </p>
        <div class="hero-buttons">
            <a href="#" class="btn btn-primary">Cotizar ahora</a>
            <a href="#" class="btn btn-outline">Más información</a>
        </div>
    </div>
    <div class="reserve-prices">
        <div class="price-box">
            <span>Paquete Básico</span>
            <strong>$45</strong>
            <small>25 uds.</small>
        </div>
        <div class="price-box dark-box">
            <span>Paquete Premium</span>
            <strong>$85</strong>
            <small>50 uds.</small>
        </div>
    </div>
</section>

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