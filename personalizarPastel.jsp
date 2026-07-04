<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personalizar Pastel | El Lado Dulce</title>
    <link rel="stylesheet" href="inicio.css">
    <link rel="stylesheet" href="personalizarPastel.css">
</head>

<body>

    <!-- ================= NAVBAR ================= -->
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
            <a href="#">Boquitas</a>
            <a class="active" href="pasteles.jsp">Pasteles</a>
            <a href="#">Reservas</a>
            <a href="#">Actividades</a>
            <a href="#">Nosotros</a>
            <a href="#">Mi Cuenta</a>
        </nav>

        <div class="cart">
            🛒
            <span id="cartCount">0</span>
        </div>
    </header>

    <!--================ HERO =================-->
    <section class="custom-header">
        <div class="header-text">
            <h1>Personaliza tu pastel</h1>
            <p>
                Diseña tu pastel ideal seleccionando el sabor, la cobertura y la decoración. 
                La vista previa cambiará automáticamente conforme hagas tus elecciones.
            </p>
        </div>
        <a href="index.jsp" class="btn-custom">← Volver</a>
    </section>

    <!--================ CONFIGURADOR =================-->
    <section class="configurator-grid">

        <!--========== VISTA PREVIA ==========-->
        <div class="preview-panel">
            <img id="previewCake" src="img/combinaciones/base1_sabor1_cobertura1_decoracion1.png" alt="Vista previa">
        </div>

        <!--========== PANEL DEL ASISTENTE POR PASOS ==========-->
        <div class="options-panel">
            
            <!-- PASO 1: SABOR -->
            <div class="step-container active" id="step1">
                <div class="category">
                    <h2>1. Elige el Sabor</h2>
                    <div class="cards" id="cardsSabor"></div>
                </div>
                <div class="step-navigation">
                    <div></div> <!-- Espacio vacío a la izquierda -->
                    <button class="btn-nav" onclick="cambiarPaso(1)">Siguiente →</button>
                </div>
            </div>

            <!-- PASO 2: COBERTURA -->
            <div class="step-container" id="step2">
                <div class="category">
                    <h2>2. Elige la Cobertura</h2>
                    <div class="cards" id="cardsCobertura"></div>
                </div>
                <div class="step-navigation">
                    <button class="btn-nav btn-secondary" onclick="cambiarPaso(-1)">← Volver</button>
                    <button class="btn-nav" onclick="cambiarPaso(1)">Siguiente →</button>
                </div>
            </div>

            <!-- PASO 3: DECORACIÓN Y RESUMEN FINAL -->
            <div class="step-container" id="step3">
                <div class="category">
                    <h2>3. Elige la Decoración</h2>
                    <div class="cards" id="cardsDecoracion"></div>
                </div>
                
                <!-- El resumen ahora aparece solo al final en este mismo panel -->
                <aside class="summary-panel text-left">
                    <h2>Resumen de tu pedido</h2>
                    <div class="summary-item">
                        <span>Sabor:</span>
                        <strong id="txtSabor">Vainilla</strong>
                    </div>
                    <div class="summary-item">
                        <span>Cobertura:</span>
                        <strong id="txtCobertura">Chantillí</strong>
                    </div>
                    <div class="summary-item">
                        <span>Decoración:</span>
                        <strong id="txtDecoracion">Flores</strong>
                    </div>
                    <hr>
                    <div class="summary-price">
                        <span>Total:</span>
                        <strong id="txtPrecio">B/.19.99</strong>
                    </div>
                </aside>

                <div class="step-navigation">
                    <button class="btn-nav btn-secondary" onclick="cambiarPaso(-1)">← Volver</button>
                    <button id="btnAgregar" class="btn-primary">Agregar al carrito 🛒</button>
                </div>
            </div>

        </div>

    </section> <!-- ¡AQUÍ ESTÁ LA CORRECCIÓN! Ahora cerramos correctamente el configurador antes del footer -->

    <!-- ================= FOOTER ================= -->
    <footer class="footer">
        <div>
            <div class="footer-logo">
                <img src="imagenes/logo2019.png" class="footer-logo-img" alt="Logo">
                <h3>El <span>Lado Dulce</span></h3>
            </div>
            <p>Tu lugar favorito para celebrar cada ocasión con un postre hecho especialmente para ti.</p>
        </div>

        <div>
            <h3>Horarios</h3>
            <p>Lunes<br>10:00 a.m. - 8:00 p.m.</p>
            <br>
            <p>Martes a Domingo<br>10:00 a.m. - 9:00 p.m.</p>
        </div>

        <div>
            <h3>Ubicación</h3>
            <p>Brisas Mall<br>San Miguelito<br>Provincia de Panamá</p>
            <br>
            <a href="#">Cómo llegar →</a>
        </div>

        <div>
            <h3>Contacto</h3>
            <p>@elladodulce</p>
            <br>
            <p>+507 318-8752</p>
        </div>

        <div class="copyright">
            © 2026 El Lado Dulce. Todos los derechos reservados.
        </div>
    </footer>

    <!-- ================= JAVASCRIPT ================= -->
    <script src="personalizarPastel.js"></script>

</body>
</html>