<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="inicio.css">
</head>
<body>

    <header class="navbar">
        <div class="logo">
            <img src="imagenes/logo2019.png" class="logo-img" alt="Logo El Lado Dulce" />
            <span>El <strong>Lado Dulce</strong></span>
        </div>

        <nav class="menu">
            <a href="index.jsp">Inicio</a>
            <a href="helados.jsp">Helados</a>
            <a href="html/bebidas.jsp">Bebidas</a>
            <a href="crepes.jsp">Crepes</a> <!-- Corregido: ya no está vacío -->

            <!-- ÍTEM DESPLEGABLE DE BOQUITAS (Igual al de las otras secciones para evitar errores) -->
            <div class="dropdown" style="display: inline-block; position: relative;">
                <a href="#" class="dropdown-toggle">Boquitas <span class="arrow">∨</span></a>
                <div class="dropdown-menu">
                    <a href="boquitas-dulces.jsp">Boquitas Dulces</a>
                    <a href="boquitas-saladas.jsp">Boquitas Saladas</a>
                </div>
            </div>

            <a href="Pasteles.jsp">Pasteles</a>
            <a href="reservas.jsp">Reservas</a>
            <a href="nosotros.jsp">Nosotros</a>
            <a href="mi-cuenta.jsp">Mi cuenta</a>
        </nav>
        <div class="cart">
            <a href="pantalla-de-carrito.jsp">
                <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
            </a>
        </div>
    </header>

    <main>

        <section class="hero">
            <div class="hero-inner">
                <div class="hero-content">
                    <h1>Endulza tu día <br><span>con Ellado Dulce</span></h1>
                    <p>
                        Helados, crepes, cafés, pasteles personalizados, boquitas para eventos
                        y un rincón de noticias reposteras para los amantes del buen dulce.
                    </p>

                    <div class="hero-buttons">
                        <a href="#" class="btn btn-primary">Ver menú</a>
                        <a href="#" class="btn btn-outline">Reservar ahora</a>
                    </div>
                </div>

                <div class="hero-images">
                    <div class="hero-card dark">Light Gray</div>
                    <div class="hero-card light">Light Gray</div>
                    <div class="hero-card wide">Light Gray</div>
                </div>
            </div>
        </section>

        <section class="section container">
            <h2><span></span> Productos destacados</h2>

            <div class="product-grid">
                <article class="product-card">
                    <span class="badge">Popular</span>
                    <button class="favorite">♡</button>
                    <div class="product-img">Light Gray</div>
                    <h3>Ice Rolls</h3>
                    <p class="price">$5.50</p>
                    <button class="small-btn">+ Agregar</button>
                </article>

                <article class="product-card">
                    <span class="badge">Popular</span>
                    <button class="favorite">♡</button>
                    <div class="product-img">Light Gray</div>
                    <h3>Frozen Yogurt</h3>
                    <p class="price">$5.00</p>
                    <button class="small-btn">+ Agregar</button>
                </article>

                <article class="product-card">
                    <button class="favorite">♡</button>
                    <div class="product-img">Light Gray</div>
                    <h3>Crepes Nutella Fresa</h3>
                    <p class="price">$7.00</p>
                    <button class="small-btn">+ Agregar</button>
                </article>

                <article class="product-card">
                    <button class="favorite">♡</button>
                    <div class="product-img">Light Gray</div>
                    <h3>Granizado Fresa</h3>
                    <p class="price">$3.50</p>
                    <button class="small-btn">+ Agregar</button>
                </article>
            </div>
        </section>

        <!-- SECCIÓN PROMO MODIFICADA: Ahora solo contiene los pasteles -->
        <section class="promo-section container" style="display: block;">
            <article class="promo-card light-promo" style="max-width: 100%; width: 100%;">
                <h3>Pasteles personalizados</h3>
                <p>
                    Diseña tu pastel ideal eligiendo los bizcochos, las coberturas de crema chantilly, 
                    los rellenos más cremosos y decoraciones espectaculares con chispas para tus celebraciones.
                </p>
                <div style="margin-top: 15px;">
                    <a href="personalizarPastel.jsp" class="btn btn-primary">Personalizar pastel</a>
                    <a href="Pasteles.jsp" class="btn btn-outline small-outline dark-text">Ver diseños</a>
                </div>
            </article>
        </section>
        
        <section class="reserve-band">
            <div class="reserve-section">
                <div class="reserve-info">
                    <h2><span></span> Reserva de local</h2>
                    <p>
                        Celebra en nuestro espacio con decoración personalizada,
                        ambiente acogedor y un menú inolvidable para tu evento especial.
                    </p>

                    <div class="hero-buttons">
                        <a href="#" class="btn btn-primary">Reservar ahora</a>
                    </div>
                </div>

                <div class="reserve-prices">
                    <div class="price-box">
                        <span>Precio base</span>
                        <strong>$60</strong>
                        <small>2 horas</small>
                    </div>

                    <div class="price-box dark-box">
                        <span>Extra hora</span>
                        <strong>$20</strong>
                        <small>c/u</small>
                    </div>
                </div>
            </div>
        </section>

		<section class="section container">
		    <h2><span></span> Noticias Dulces</h2>
		
		    <div class="activity-grid">
		        <article class="activity-card pink">
		            <div class="activity-icon" style="width: 80px; height: 80px; margin: 0 auto 15px auto; overflow: hidden; border-radius: 50%;">
		                <img src="https://cimamastologia.com.ar/wp-content/uploads/2025/03/azucar.png" alt="Tendencias" style="width: 100%; height: 100%; object-fit: cover;" onerror="this.src='imagenes/iconos/compra3 (1).png'">
		            </div>
		            <h3>Tendencias: Menos Azúcar, Más Sabor</h3>
		            <p>La repostería artesanal evoluciona con el uso de azúcares naturales de frutas y alternativas orgánicas que mantienen intacto el sabor de siempre.</p>
		            <a href="#">Leer artículo</a>
		        </article>
		
		        <article class="activity-card purple">
		            <div class="activity-icon" style="width: 80px; height: 80px; margin: 0 auto 15px auto; overflow: hidden; border-radius: 50%;">
		                <img src="https://edenred.com.uy/wp-content/uploads/2023/06/el-chocolate-un-placer-con-beneficios-nutricionales-1024x683.jpg" alt="Postres de autor" style="width: 100%; height: 100%; object-fit: cover;" onerror="this.src='imagenes/iconos/medall (1).png'">
		            </div>
		            <h3>El Auge de los Postres de Autor</h3>
		            <p>Expertos pasteleros revelan por qué las presentaciones individuales y las fusiones exóticas están dominando las mesas de dulces este año.</p>
		            <a href="#">Leer artículo</a>
		        </article>
		        
		        <article class="activity-card yellow">
		            <div class="activity-icon" style="width: 80px; height: 80px; margin: 0 auto 15px auto; overflow: hidden; border-radius: 50%;">
		                <img src="https://cdn0.uncomo.com/es/posts/6/3/9/como_endurecer_el_merengue_para_decorar_49936_600.jpg" alt="Azúcar Glass" style="width: 100%; height: 100%; object-fit: cover;" onerror="this.src='imagenes/iconos/giftbox1.1 (1).png'">
		            </div>
		            <h3>Secretos del Azúcar Glass Perfecto</h3>
		            <p>Descubre el impacto técnico que tiene la finura del azúcar en coberturas delicadas como el merengue y el glaseado para boquitas.</p>
		            <a href="#">Leer artículo</a>
		        </article>
		    </div>
		</section>
        
        <section class="points-wrapper">
            <div class="points-section">
                <div>
                    <h2>Sistema de puntos</h2>
                    <p>
                        Cada compra te acerca a más beneficios. Acumula puntos en cada visita
                        y canjéalos por productos, descuentos y beneficios especiales.
                    </p>
                </div>

                <div class="points-steps">
                    <div class="point-step">
                        <img src="imagenes/iconos/compra3 (1).png" alt="Icono de compra">
                        <p>Compra</p>
                    </div>

                    <div class="point-step">
                        <img src="imagenes/iconos/medall (1).png" alt="Icono de puntos">
                        <p>Puntos</p>
                    </div>

                    <div class="point-step">
                        <img src="imagenes/iconos/giftbox1.1 (1).png" alt="Icono de premio">
                        <p>Premio</p>
                    </div>
                </div>

                <a href="#" class="btn btn-primary">Conocer más</a>
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
            <p>+507 123-4567</p>
        </div>

        <div class="copyright">
            © 2026 Ellado Dulce. Todos los derechos reservados.
        </div>
    </footer>

</body>
</html>