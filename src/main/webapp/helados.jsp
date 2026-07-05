<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Helados | El Lado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- Estilos base compartidos con Pasteles -->
    <link rel="stylesheet" href="inicio.css">
    <!-- Tus estilos específicos y adaptados de helados -->
    <link rel="stylesheet" href="helados.css">
</head>
<body>

    <!-- ================= NAVBAR ================= -->
    <header class="navbar">
        <div class="logo">
            <img src="imagenes/logo2019.png" alt="Logo El Lado Dulce" class="logo-img">
            <span>El <strong>Lado Dulce</strong></span>
        </div>

        <nav class="menu">
            <a href="index.jsp">Inicio</a>
            <a class="active" href="helados.jsp">Helados</a>
            <a href="html/bebidas.jsp">Bebidas</a>
            <a href="#">Crepes</a>
            <a href="Boquitas.jsp">Boquitas</a>
            <a href="Pasteles.jsp">Pasteles</a>
            <a href="reservas.jsp">Reservas</a>
            <a href="actividades.jsp">Actividades</a>
            <a href="Nosotros.jsp">Nosotros</a>
            <a href="mi-cuenta.jsp">Mi cuenta</a>
        </nav>
        
        <div class="cart">
            <a href="pantalla-de-carrito.jsp">🛒</a>
        </div>
    </header>

    <!-- ================= HERO ================= -->
    <section class="cake-hero">
        <div class="cake-info">
            <h1>Helados</h1>
            <p>
                Sabores que enamoran, texturas que sorprenden.<br>
                Elige tu favorito y personalízalo con tus toppings irresistibles.
            </p>

            <div class="cake-buttons">
                <a href="#" class="btn-whatsapp">Cotizar por WhatsApp</a>
                <a href="#" class="btn-custom">Ver Sabores del Mes</a>
            </div>

            <div class="cake-tags">
                <span>❤️ Ingredientes frescos</span>
                <span>🍦 Preparados al momento</span>
            </div>
        </div>

        <div class="cake-image">
            <img src="https://images.unsplash.com/photo-1501443762994-82bd5dace89a?q=80&w=640&auto=format&fit=crop" alt="Helados Principales">
        </div>
    </section>

    <!-- ================= SECCIÓN DE PRODUCTOS (GRID DE COLUMNAS) ================= -->
    <section class="cakes-section">
        <h2>NUESTROS HELADOS</h2>

        <div class="cakes-grid">
            
            <!-- Tarjeta 1: Ice Cream Rolls -->
            <div class="cake-card">
                <img src="https://images.unsplash.com/photo-1563805042-7684c019e1cb?q=80&w=500&auto=format&fit=crop" alt="Ice Cream Rolls">
                <div class="cake-content">
                    <h3>Ice Cream Rolls</h3>
                    <p class="price">Desde B/.5.50</p>
                    <p>Helado preparado al momento en planchas frías con ingredientes frescos. Enrollado a mano, suave y delicioso.</p>
                    
                    <div class="tags">
                        <span class="tag orange">Topping opcional: +B/.0.50</span>
                        <span class="tag pink">Topping incluido</span>
                    </div>

                    <a href="detalle-ice-rolls.jsp">Comprar</a>
                </div>
            </div>

            <!-- Tarjeta 2: Frozen Yogurt -->
            <div class="cake-card">
                <img src="https://images.unsplash.com/photo-1488477181946-6428a0291777?q=80&w=500&auto=format&fit=crop" alt="Frozen Yogurt">
                <div class="cake-content">
                    <h3>Frozen Yogurt</h3>
                    <p class="price">B/.4.75</p>
                    <p>Yogurt helado suave y refrescante. Elige tus toppings favoritos entre frutas frescas, mermeladas y más.</p>
                    
                    <div class="tags">
                        <span class="tag orange">Topping opcional: +B/.0.50</span>
                        <span class="tag pink">Topping incluido</span>
                    </div>

                    <a href="detalle-frozen-yogurt.jsp">Comprar</a>
                </div>
            </div>

            <!-- Tarjeta 3: Sundae -->
            <div class="cake-card">
                <img src="https://images.unsplash.com/photo-1572490122747-3968b75cc699?q=80&w=500&auto=format&fit=crop" alt="Sundae">
                <div class="cake-content">
                    <h3>Sundae</h3>
                    <p class="price">B/.4.95</p>
                    <p>El clásico sundae con bolas de helado, sirope y toppings irresistibles. Personalízalo a tu gusto.</p>
                    
                    <div class="tags">
                        <span class="tag orange">Topping opcional: +B/.0.50</span>
                        <span class="tag pink">Topping incluido</span>
                    </div>

                    <a href="detalle-sundae.jsp">Comprar</a>
                </div>
            </div>

            <!-- Tarjeta 4: Cono de Vainilla -->
            <div class="cake-card">
                <img src="https://images.unsplash.com/photo-1579954115545-a95591f28bfc?q=80&w=500&auto=format&fit=crop" alt="Cono de Vainilla">
                <div class="cake-content">
                    <h3>Cono de Vainilla</h3>
                    <p class="price">B/.2.50</p>
                    <p>Cremoso helado de vainilla servido en un cono crujiente recién preparado. Simple, clásico e irresistible.</p>
                    <a href="detalle-barquillo.jsp">Comprar</a>
                </div>
            </div>

        </div>
    </section>

    <!-- ================= FOOTER ================= -->
    <footer class="footer">
        <div>
            <div class="footer-logo">
                <img src="imagenes/logo2019.png" class="footer-logo-img" alt="Logo">
                <h3>El <span>Lado Dulce</span></h3>
            </div>
            <p>Tu lugar favorito para endulzar cada momento.</p>
        </div>

        <div>
            <h3>Horarios</h3>
            <p>Lunes<br>1:00 p.m. - 8:00 p.m.</p>
            <br>
            <p>Martes a Domingo<br>1:00 p.m. - 9:00 p.m.</p>
        </div>

        <div>
            <h3>Ubicación</h3>
            <p>Brisas Mall, Av. Principal,<br>San Miguelito,<br>Provincia de Panamá.</p>
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