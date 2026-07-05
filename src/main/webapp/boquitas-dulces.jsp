<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boquitas Dulces | El Lado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="inicio.css"> 
</head>
<body>

    <!-- NAVBAR PRINCIPAL -->
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
            <a class="active" href="Boquitas.jsp">Boquitas</a>
            <a href="pasteles.jsp">Pasteles</a>
            <a href="#">Reservas</a>
            <a href="#">Actividades</a>
            <a href="#">Nosotros</a>
            <a href="#">Mi cuenta</a>
        </nav>
        
        <div class="cart">
            <a href="">
                <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
                <span id="cartCount">0</span>
            </a>
        </div>
    </header>

    <main>
        <!-- HERO DE BOQUITAS DULCES -->
        <section class="cake-hero">
            <div class="cake-info">
                <h1>Boquitas Dulces</h1>
                <p>Pequeños antojos, grandes momentos. Bocaditos dulces preparados para tus eventos o para endulzar tu día.</p>
            </div>
            <div class="cake-image">
                <!-- Imagen decorativa lateral superior derecha en la captura -->
                <div style="width: 200px; height: 200px; background: rgba(255,255,255,0.1); border-radius: 18px; backdrop-filter: blur(5px); border: 2px dashed rgba(255,255,255,0.2);"></div>
            </div>
        </section>

        <!-- SECCIÓN DE PRODUCTOS -->
        <section class="cakes-section">
            <h2>NUESTRAS BOQUITAS DULCES</h2>

            <div class="cakes-grid">
                
                <!-- Tarjeta 1: Mini Donas -->
                <article class="cake-card">
                    <img src="imagenes/boquitas/mini-donas.jpg" alt="Mini Donas" onerror="this.src=''; this.style.background='#ececec';">
                    <div class="cake-content">
                        <h3>Mini Donas</h3>
                        <p>Bocaditos suaves y dulces, perfectos para compartir.</p>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
                            <span class="price" style="font-size: 18px; margin-bottom: 0;">$4.50</span>
                            <a href="detalle-boquitas-donas.jsp">Ver más</a>
                        </div>
                    </div>
                </article>

                <!-- Tarjeta 2: Mini Cupcakes -->
                <article class="cake-card">
                    <img src="imagenes/boquitas/mini-cupcakes.jpg" alt="Mini Cupcakes" onerror="this.src=''; this.style.background='#ececec';">
                    <div class="cake-content">
                        <h3>Mini Cupcakes</h3>
                        <p>Pequeños cupcakes esponjosos con topping delicado.</p>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
                            <span class="price" style="font-size: 18px; margin-bottom: 0;">$4.75</span>
                            <a href="detalle-boquitas-cupcakes.jsp">Ver más</a>
                        </div>
                    </div>
                </article>

                <!-- Tarjeta 3: Tres Leches -->
                <article class="cake-card">
                    <img src="imagenes/boquitas/tres-leches.jpg" alt="Tres Leches" onerror="this.src=''; this.style.background='#ececec';">
                    <div class="cake-content">
                        <h3>Tres Leches</h3>
                        <p>Postre cremoso y clásico con sabor casero.</p>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
                            <span class="price" style="font-size: 18px; margin-bottom: 0;">$5.00</span>
                            <a href="detalle-boquitas-leches.jsp">Ver más</a>
                        </div>
                    </div>
                </article>

                <!-- Tarjeta 4: Brownies -->
                <article class="cake-card">
                    <img src="imagenes/boquitas/brownies.jpg" alt="Brownies" onerror="this.src=''; this.style.background='#ececec';">
                    <div class="cake-content">
                        <h3>Brownies</h3>
                        <p>Cuadros intensos de chocolate, suaves y deliciosos.</p>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
                            <span class="price" style="font-size: 18px; margin-bottom: 0;">$4.50</span>
                            <a href="detalle-boquitas-brownies.jsp">Ver más</a>
                        </div>
                    </div>
                </article>

                <!-- Tarjeta 5: Galletas -->
                <article class="cake-card">
                    <img src="imagenes/boquitas/galletas.jpg" alt="Galletas" onerror="this.src=''; this.style.background='#ececec';">
                    <div class="cake-content">
                        <h3>Galletas</h3>
                        <p>Galletas dulces, ideales para cualquier ocasión.</p>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
                            <span class="price" style="font-size: 18px; margin-bottom: 0;">$3.50</span>
                            <a href="detalle-boquitas-galletas.jsp">Ver más</a>
                        </div>
                    </div>
                </article>

                <!-- Tarjeta 6: Alfajores -->
                <article class="cake-card">
                    <img src="imagenes/boquitas/alfajores.jpg" alt="Alfajores" onerror="this.src=''; this.style.background='#ececec';">
                    <div class="cake-content">
                        <h3>Alfajores</h3>
                        <p>Suaves y rellenos, con un toque tradicional.</p>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
                            <span class="price" style="font-size: 18px; margin-bottom: 0;">$4.00</span>
                            <a href="detalle-boquitas-alfajores.jsp">Ver más</a>
                        </div>
                    </div>
                </article>

                <!-- Tarjeta 7: Paletas -->
                <article class="cake-card">
                    <img src="imagenes/boquitas/paletas.jpg" alt="Paletas" onerror="this.src=''; this.style.background='#ececec';">
                    <div class="cake-content">
                        <h3>Paletas</h3>
                        <p>Paletas frías y dulces para refrescar tu día.</p>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
                            <span class="price" style="font-size: 18px; margin-bottom: 0;">$3.75</span>
                            <a href="detalle-boquitas-paletas.jsp">Ver más</a>
                        </div>
                    </div>
                </article>

                <!-- Tarjeta 8: Arroz con Leche -->
                <article class="cake-card">
                    <img src="imagenes/boquitas/arroz-con-leche.jpg" alt="Arroz con Leche" onerror="this.src=''; this.style.background='#ececec';">
                    <div class="cake-content">
                        <h3>Arroz con Leche</h3>
                        <p>Clásico tradicional, cremoso y reconfortante.</p>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 10px;">
                            <span class="price" style="font-size: 18px; margin-bottom: 0;">$4.25</span>
                            <a href="detalle-boquitas-arroz.jsp">Ver más</a>
                        </div>
                    </div>
                </article>

            </div>
        </section>
    </main>

    <!-- FOOTER -->
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

</body>
</html>