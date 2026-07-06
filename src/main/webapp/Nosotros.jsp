<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Nosotros | El Lado Dulce</title>
    <link rel="stylesheet" href="Nosotros.css" />
</head>
<body>

    <header class="navbar">
        <div class="logo">
            <img src="imagenes/logo2019.png" class="logo-img" alt="Logo El Lado Dulce" />
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
            <a href="Nosotros.jsp">Nosotros</a>
            <a href="mi-cuenta.jsp">Mi cuenta</a>
        </nav>
        
        <div class="cart">
            <a href="">
                <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
            </a>
        </div>
    </header>


    <section class="hero-about">
        <div class="hero-content">
            <h1>Nosotros</h1>
            <p>
                Conoce al equipo que endulza tus días con pasión, creatividad
                y los mejores ingredientes.
            </p>
        </div>
    </section>


    <section class="history-section">
        <div class="history-container">
            <div class="history-text">
                <h2>Nuestra Historia</h2>
                <p>
                    <strong>El Lado Dulce</strong> nació en 2018 con un sueño:
                    compartir la alegría de los postres artesanales hechos con
                    amor y los ingredientes más frescos. Desde un pequeño
                    local en San Miguelito, hemos crecido hasta convertirnos
                    en el lugar favorito de los panameños para celebrar cada
                    momento especial.
                </p>
                <p>
                    Nuestra filosofía es simple: cada pastel, cada helado y
                    cada boquita cuentan una historia. Trabajamos con
                    proveedores locales y apostamos por la repostería
                    sostenible, porque creemos que lo dulce también puede
                    ser responsable.
                </p>
            </div>
            <div class="history-image">
                <div class="placeholder-img"></div>
            </div>
        </div>
    </section>

    <!-- ================= VALORES ================= -->
    <section class="values-section">
        <h2>Nuestros Valores</h2>
        <div class="values-grid">
            <div class="value-card">
                <div class="value-icon">❤️</div>
                <h3>Pasión</h3>
                <p>Amamos lo que hacemos y se refleja en cada detalle de nuestros postres.</p>
            </div>
            <div class="value-card">
                <div class="value-icon">🌿</div>
                <h3>Calidad</h3>
                <p>Usamos ingredientes frescos y naturales, sin conservantes artificiales.</p>
            </div>
            <div class="value-card">
                <div class="value-icon">🤝</div>
                <h3>Cercanía</h3>
                <p>Escuchamos a nuestros clientes y creamos experiencias personalizadas.</p>
            </div>
            <div class="value-card">
                <div class="value-icon">🌟</div>
                <h3>Creatividad</h3>
                <p>Innovamos constantemente para sorprenderte con nuevos sabores y diseños.</p>
            </div>
        </div>
    </section>

    <!-- ================= EQUIPO ================= -->
    <section class="team-section">
        <h2>Nuestro Equipo</h2>
        <p class="team-subtitle">
            Detrás de cada creación hay personas apasionadas que ponen su talento
            al servicio de tu felicidad.
        </p>

        <div class="team-grid" id="teamGrid">
            <!-- Las tarjetas se generarán desde JavaScript -->
        </div>
    </section>

    <!-- ================= FOOTER ================= -->
    <footer class="footer">
        <div>
            <div class="footer-logo">
                <img src="imagenes/logo2019.png" class="footer-logo-img" alt="Logo El Lado Dulce" />
                <h3>El <span>Lado Dulce</span></h3>
            </div>
            <p>Tu lugar favorito para endulzar cada momento.</p>
        </div>

        <div>
            <h3>Horarios</h3>
            <p>Lunes<br />10:00 a.m. - 8:00 p.m.</p>
            <br />
            <p>Martes a Domingo<br />10:00 a.m. - 9:00 p.m.</p>
        </div>

        <div>
            <h3>Ubicación</h3>
            <p>Brisas Mall, Av. Principal, San Miguelito, Provincia de Panamá.</p>
            <br />
            <a href="#">Cómo llegar →</a>
        </div>

        <div>
            <h3>Contacto</h3>
            <p>@elladodulce</p>
            <br />
            <p>+507 315-8752</p>
        </div>

        <div class="copyright">
            © 2026 El Lado Dulce. Todos los derechos reservados.
        </div>
    </footer>

    <!-- ================= JAVASCRIPT ================= -->
    <script src="Nosotros.js"></script>
</body>
</html>