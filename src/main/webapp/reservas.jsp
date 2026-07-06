<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservas | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="reservas.css">
</head>
<body>

    <header class="navbar">
        <div class="logo">
            <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="logo-img">
            <span>Ellado <strong>Dulce</strong></span>
        </div>

            <nav class="menu">
        <a href="index.jsp">Inicio</a>
        <a href="helados.jsp">Helados</a>
        <a href="html/bebidas.jsp">Bebidas</a>
        <a href="#">Crepes</a>
                <div class="dropdown">
            <a href="Boquitas.jsp" class="dropbtn active">Boquitas ▾</a>

            <div class="dropdown-content">
                <a href="boquitas-dulces.jsp">Boquitas Dulces</a>
                <a href="boquitas-saladas.jsp">Boquitas Saladas</a>
            </div>
        </div>
        <a class="active" href="Pasteles.jsp">Pasteles</a>
        <a href="reservas.jsp">Reservas</a>
        <a href="actividades.jsp">Actividades</a>
        <a href="Nosotros.jsp">Nosotros</a>
        <a href="mi-cuenta.jsp">Mi cuenta</a>
    </nav>
        <div class="cart">
            <a href="">
                <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
            </a>
        </div>
    </header>

    <main>

        <section class="reserve-hero">
            <div class="reserve-hero-inner">
                <div class="reserve-hero-text">
                    <h1>Reserva tu evento</h1>
                    <p>
                        Celebra momentos inolvidables con un espacio dulce,
                        deliciosos detalles y una experiencia hecha para ti.
                    </p>

                    <div class="hero-buttons">
                        <a href="https://wa.me/5071234567?text=Hola,%20quiero%20cotizar%20una%20reserva%20de%20evento."
                           target="_blank"
                           class="btn btn-whatsapp">
                            Cotizar en whatsapp
                        </a>
                    </div>
                </div>

                <div class="reserve-hero-image placeholder"></div>
            </div>
        </section>

        <section class="event-section">
            <h2>ELIGE TU TIPO DE EVENTO</h2>

            <div class="event-grid">

                <article class="event-card">
                    <div class="event-icon pink-icon"></div>

                    <h3>Cumpleaños Dulce</h3>
                    <p class="event-price">$75.00 <span>/ 2 horas</span></p>
                    <p class="event-description">
                        Te preparamos para que celebres en grande con todos los detalles.
                    </p>

                    <ul class="event-list">
                        <li>Decoración básica incluida</li>
                        <li>Mesa de postres</li>
                        <li>Espacio para todos tus invitados</li>
                    </ul>

                    <div class="event-buttons">
                        <a href="detalle-reserva.jsp?id=2">Comprar</a>
                    </div>
                </article>

                <article class="event-card">
                    <div class="event-icon blue-icon"></div>

                    <h3>Evento Corporativo</h3>
                    <p class="event-price">$85.00 <span>/ 2 horas</span></p>
                    <p class="event-description">
                        Perfecto para reuniones, team buildings y lanzamientos.
                    </p>

                    <ul class="event-list">
                        <li>Montaje formal</li>
                        <li>Área para exposiciones</li>
                        <li>Ambiente profesional</li>
                    </ul>

                    <div class="event-buttons">
                        <a href="detalle-reserva.jsp?id=1">Comprar</a>
                    </div>
                </article>

            </div>
        </section>

        <section class="extras-section">
            <h2><span></span> EXTRAS DISPONIBLES</h2>

            <div class="extras-grid">

                <article class="extra-card">
                    <div class="extra-icon cream"></div>
                    <h3>Hora adicional</h3>
                    <p>$20.00</p>
                </article>

                <article class="extra-card">
                    <div class="extra-icon pink"></div>
                    <h3>Boquitas</h3>
                    <p>$25.00</p>
                </article>

                <article class="extra-card">
                    <div class="extra-icon purple"></div>
                    <h3>Pastel personalizado</h3>
                    <p>$45.00</p>
                </article>

                <article class="extra-card">
                    <div class="extra-icon yellow"></div>
                    <h3>Decoración especial</h3>
                    <p>$20.00</p>
                </article>

                <article class="extra-card">
                    <div class="extra-icon soft-pink"></div>
                    <h3>Mesa de dulces</h3>
                    <p>$35.00</p>
                </article>

                <article class="extra-card">
                    <div class="extra-icon mint"></div>
                    <h3>Bebidas adicionales</h3>
                    <p>$15.00</p>
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
            © 2025 Ellado Dulce. Todos los derechos reservados.
        </div>
    </footer>

</body>
</html>