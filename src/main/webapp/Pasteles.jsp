<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Pasteles | El Lado Dulce</title>

    <link rel="stylesheet" href="catalogo-productos.css">
    
</head>

<body>

<header class="navbar">

    <div class="logo">
        <img src="imagenes/logo2019.png" class="logo-img" alt="Logo El Lado Dulce">
        <span>El <strong>Lado Dulce</strong></span>
    </div>

    <nav class="menu">
            <a href="index.jsp">Inicio</a>

            <div class="dropdown" style="display: inline-block; position: relative;">
                <a href="#" class="dropdown-toggle">Boquitas <span class="arrow">∨</span></a>
                <div class="dropdown-menu">
                    <a href="boquitas-dulces.jsp">Boquitas Dulces</a>
                    <a href="boquitas-saladas.jsp">Boquitas Saladas</a>
                </div>
            </div>

            <a href="Pasteles.jsp">Pasteles</a>
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

<section class="cake-hero">

    <div class="cake-info">

        <h1>Pasteles</h1>

        <p>
            Pasteles personalizados y prediseñados para cada ocasión especial.
        </p>

        <div class="cake-buttons">

            <a href="#" class="btn-whatsapp">
                Cotizar por WhatsApp
            </a>

        </div>
    </div>

    <div class="cake-image">
        <img src="https://hips.hearstapps.com/hmg-prod/images/tarta-de-nata-y-fresas-elle-gourmet-67d13e7412b2a.jpg?crop=0.564xw:1.00xh;0.300xw,0&resize=640:*" alt="Pastel principal">
    </div>

</section>

<section class="cakes-section">

    <h2>PASTELES PREDISEÑADOS</h2>

    <div class="cakes-grid">

        <div class="cake-card">
            <img src="https://images.aws.nestle.recipes/resized/2024_10_23T06_40_18_badun_images.badun.es_tarta_fria_de_chocolate_blanco_con_frutas_1290_742.jpg" alt="Pastel de frutas">

            <div class="cake-content">
                <h3>Pastel Frutas</h3>

                <strong class="cake-price">B/.18.00</strong>

                <p>
                    Delicado pastel decorado con frutas naturales y crema suave.
                </p>

                <a href="detalle-pastel.jsp?id=5">Ver más</a>

            </div>
        </div>

        <div class="cake-card">
            <img src="https://amoradulce.com/wp-content/uploads/2019/12/Torta-chocolate-1_04_13_2024-scaled.jpg" alt="Pastel de chocolate">

            <div class="cake-content">
                <h3>Pastel de Chocolate</h3>

                <strong class="cake-price">B/.20.00</strong>

                <p>
                    Intenso y húmedo, cubierto de ganache y decoraciones artesanales.
                </p>

                <a href="detalle-pastel.jsp?id=6">Ver más</a>

            </div>
        </div>

        <div class="cake-card">
            <img src="https://cdn.shopify.com/s/files/1/0806/9876/9709/files/Delivery_Dia_del_Nino_2024confetti_480x480.jpg?v=1712098271" alt="Pastel infantil">

            <div class="cake-content">
                <h3>Pastel Infantil</h3>

                <strong class="cake-price">B/.22.00</strong>

                <p>
                    Colorido y divertido, perfecto para celebrar con los más pequeños.
                </p>

                <a href="detalle-pastel.jsp?id=7">Ver más</a>
            </div>
        </div>

        <div class="cake-card">
            <img src="https://cafedelaflor.com/images/productos/20250418115254pag.web_-_2025-04-18t115241.272.jpg" alt="Pastel Red Velvet">

            <div class="cake-content">
                <h3>Pastel Red Velvet</h3>

                <strong class="cake-price">B/.24.00</strong>

                <p>
                    Bizcocho sedoso de color rojo brillante con un sutil toque de cacao y relleno de crema de queso dulce.
                </p>

                <a href="detalle-pastel.jsp?id=8">Ver más</a>
            </div>
        </div>

        <div class="cake-card">
            <img src="https://thescranline.com/wp-content/uploads/2021/09/BEST-EVER-BIRTHDAY-CAKE-THUMBNAIL-24-1.jpg" alt="Pastel de cumpleaños">

            <div class="cake-content">
                <h3>Pastel de Cumpleaños</h3>

                <strong class="cake-price">B/.25.00</strong>

                <p>
                    Clásico y festivo, ideal para hacer memorable cada celebración.
                </p>

                <a href="detalle-pastel.jsp?id=9">Ver más</a>
            </div>
        </div>

        <div class="cake-card">
            <img src="https://marubotana.tv/uploads/responsive/2026/03/torta-de-vainilla-768.webp" alt="Pastel de vainilla">

            <div class="cake-content">
                <h3>Pastel de Vainilla</h3>

                <strong class="cake-price">B/.18.00</strong>

                <p>
                    Bizcocho esponjoso, suave y aromático elaborado con extracto natural de vainilla.
                </p>

                <a href="detalle-pastel.jsp?id=10">Ver más</a>
            </div>
        </div>

    </div>

</section>

<footer class="footer">

    <div>

        <div class="footer-logo">
            <img src="imagenes/logo2019.png" class="footer-logo-img" alt="Logo El Lado Dulce">
            <h3>El <span>Lado Dulce</span></h3>
        </div>

        <p>
            Tu lugar favorito para endulzar cada momento.
        </p>

    </div>

    <div>
        <h3>Horarios</h3>

        <p>
            Lunes<br>
            1:00 p.m. - 8:00 p.m.
        </p>

        <br>

        <p>
            Martes a Domingos<br>
            1:00 p.m. - 9:00 p.m.
        </p>
    </div>

    <div>
        <h3>Ubicación</h3>

        <p>
            Brisas Mall, Av. Principal,
            San Miguelito,
            Provincia de Panamá.
        </p>

        <br>

        <a href="#">
            Cómo llegar →
        </a>
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