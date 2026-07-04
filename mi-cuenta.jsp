<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi cuenta | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="mi-cuenta.css">
</head>
<body>

    <header class="navbar">
        <div class="logo">
            <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="logo-img">
            <span>Ellado <strong>Dulce</strong></span>
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

    <main class="account-page">

        <section class="account-grid">

            <div class="main-column">

                <section class="welcome-card">
                    <div class="user-info">
                        <div class="avatar"></div>

                        <div>
                            <span>Bienvenida de vuelta</span>
                            <h1>Hola, <strong id="userName">María</strong></h1>
                            <p>
                                Aquí puedes ver tus pedidos, reservas, actividades y disfrutar los beneficios.
                            </p>
                        </div>
                    </div>

                    <div class="points-box">
                        <span>PUNTOS</span>
                        <strong id="totalPoints">0</strong>
                    </div>
                </section>

                <section class="activities-card" id="activitiesCard">
                    <div class="section-header">
                        <h2>Mis actividades</h2>
                        <a href="actividades.jsp">Ver todas mis actividades →</a>
                    </div>

                    <div class="activities-table">
                        <div class="table-head">
                            <span>Actividad</span>
                            <span>Fecha y hora</span>
                            <span>Precio</span>
                            <span></span>
                        </div>

                        <div id="activitiesList">
                            <!-- Las actividades compradas se cargan con JavaScript -->
                        </div>
                    </div>

                    <div class="info-message">
                        <span>ⓘ</span>
                        <p>Si tienes alguna confirmación aparece aquí para ir al inicio de tu actividad.</p>
                    </div>
                </section>

            </div>

            <aside class="side-column">

                <section class="personal-card">
                    <div class="personal-header">
                        <h2>Datos personales</h2>
                        <a href="editar-perfil.jsp">✎ Editar</a>
                    </div>

                    <div class="personal-data">
                        <p>
                            <span>👤</span>
                            <strong id="profileName">María Alejandra</strong>
                        </p>

                        <p>
                            <span>✉</span>
                            <strong id="profileEmail">maria@ejemplo.com</strong>
                        </p>

                        <p>
                            <span>📞</span>
                            <strong id="profilePhone">+507 6123-4567</strong>
                        </p>
                    </div>

                    <a href="editar-perfil.jsp" class="edit-profile-btn">Editar perfil</a>
                </section>

            </aside>

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
            <p>+507 312-2322</p>
        </div>

        <div class="copyright">
            © 2025 Ellado Dulce. Todos los derechos reservados.
        </div>
    </footer>

    <script src="mi-cuenta.js"></script>
</body>
</html>