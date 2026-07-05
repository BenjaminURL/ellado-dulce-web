<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mini Donas | El Lado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="inicio.css">
</head>
<body>

    <!-- HEADER IDÉNTICO CON EL DROPDOWN DE BOQUITAS -->
    <header class="navbar">
        <div class="logo">
            <img src="imagenes/logo2019.png" class="logo-img" alt="Logo El Lado Dulce" />
            <span>El <strong>Lado Dulce</strong></span>
        </div>

        <nav class="menu">
            <a href="index.jsp">Inicio</a>
            <a href="helados.jsp">Helados</a>
            <a href="html/bebidas.jsp">Bebidas</a>
            <a href="">Crepes</a>
		
            <!-- ÍTEM DESPLEGABLE DE BOQUITAS -->
            <div class="dropdown">
                <a href="#" class="dropdown-toggle active">Boquitas <span class="arrow">∨</span></a>
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
            <a href="">
                <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
                <span id="cartCount">0</span>
            </a>
        </div>
    </header>

    <main>
        <!-- ENCABEZADO DE LA SECCIÓN -->
        <section class="custom-header">
            <div class="header-text">
                <h1>Mini Donas <br><span>Decoradas</span></h1>
                <p>
                    Esponjosas, coloridas y deliciosas. Elige tu cobertura favorita, combina los colores 
                    y personaliza los toppings para que combinen a la perfección con tu fiesta o evento.
                </p>
            </div>
        </section>

        <!-- GRID DEL CONFIGURADOR -->
        <div class="configurator-grid">
            
            <!-- PANEL DE VISTA PREVIA (IZQUIERDA) -->
            <div class="preview-panel">
                <img id="previewCake" src="imagenes/productos/mini-donas-base.png" alt="Mini Donas El Lado Dulce">
            </div>

            <!-- PANEL DE SELECCIÓN DE OPCIONES (CENTRO) -->
            <div class="options-panel">
                
                <!-- Categoría 1: Cantidad -->
                <div class="category">
                    <h2>1. Selecciona la cantidad</h2>
                    <div class="cards" id="cantidadContainer">
                        <div class="card selected" data-precio="12.00" data-value="12 unidades">
                            <div>
                                <strong>Caja de 12 unidades</strong>
                                <p>Perfectas para un pequeño detalle</p>
                            </div>
                            <span class="option-price">$12.00</span>
                        </div>
                        <div class="card" data-precio="22.00" data-value="24 unidades">
                            <div>
                                <strong>Caja de 24 unidades</strong>
                                <p>La opción favorita para compartir</p>
                            </div>
                            <span class="option-price">$22.00</span>
                        </div>
                        <div class="card" data-precio="42.00" data-value="50 unidades">
                            <div>
                                <strong>Bandeja de 50 unidades</strong>
                                <p>Ideal para tu mesa de dulces completa</p>
                            </div>
                            <span class="option-price">$42.00</span>
                        </div>
                    </div>
                </div>

                <!-- Categoría 2: Cobertura Principal -->
                <div class="category">
                    <h2>2. Cobertura base</h2>
                    <div class="cards" id="coberturaContainer">
                        <div class="card selected" data-value="Chocolate Clásico">
                            <strong>Chocolate con Leche Clásico</strong>
                        </div>
                        <div class="card" data-value="Glaseado Rosa">
                            <strong>Glaseado Rosa Tradicional</strong>
                        </div>
                        <div class="card" data-value="Chocolate Blanco">
                            <strong>Chocolate Blanco Cremoso</strong>
                        </div>
                    </div>
                </div>

                <!-- Categoría 3: Toppings / Decoración -->
                <div class="category">
                    <h2>3. Decoración / Topping</h2>
                    <div class="cards" id="toppingContainer">
                        <div class="card selected" data-value="Chispitas de colores">
                            <strong>Chispitas de Colores (Sprinkles)</strong>
                        </div>
                        <div class="card" data-value="Galleta Oreo Triturada">
                            <strong>Galleta Oreo Triturada (+ $1.50)</strong>
                        </div>
                        <div class="card" data-value="Líneas de Caramelo">
                            <strong>Hilos de Caramelo Salado</strong>
                        </div>
                    </div>
                </div>

            </div>

            <!-- PANEL DE RESUMEN DE COMPRA (DERECHA) -->
            <div class="summary-panel">
                <h2>Resumen de Boquitas</h2>
                
                <div class="summary-item">
                    <span>Producto:</span>
                    <strong>Mini Donas</strong>
                </div>
                <div class="summary-item">
                    <span>Cantidad:</span>
                    <strong id="resumenCantidad">12 unidades</strong>
                </div>
                <div class="summary-item">
                    <span>Cobertura:</span>
                    <strong id="resumenCobertura">Chocolate Clásico</strong>
                </div>
                <div class="summary-item">
                    <span>Topping:</span>
                    <strong id="resumenTopping">Chispitas de colores</strong>
                </div>

                <hr style="border: 0; border-top: 1px solid #eee; margin: 15px 0;">

                <div class="summary-price">
                    <span>Total:</span>
                    <span id="totalPrice" style="color: #ff4f8b;">$12.00</span>
                </div>

                <button class="btn btn-primary" id="btnAgregarCarrito">+ Agregar al pedido</button>
            </div>

        </div>
    </main>

    <!-- FOOTER IDÉNTICO -->
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

    <!-- SCRIPT DE INTERACTIVIDAD -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            
            // Función genérica para controlar la selección de tarjetas
            function configurarGrupo(containerId, resumenId, onChangeCallback) {
                const container = document.getElementById(containerId);
                const cards = container.querySelectorAll('.card');
                
                cards.forEach(card => {
                    card.addEventListener('click', function() {
                        cards.forEach(c => c.classList.remove('selected'));
                        this.classList.add('selected');
                        
                        const valor = this.getAttribute('data-value');
                        document.getElementById(resumenId).innerText = valor;
                        
                        if(onChangeCallback) onChangeCallback(this);
                    });
                });
            }

            // Configurar Cantidad
            configurarGrupo('cantidadContainer', 'resumenCantidad', function() {
                calcularPrecioTotal();
            });

            // Configurar Cobertura
            configurarGrupo('coberturaContainer', 'resumenCobertura');

            // Configurar Topping
            configurarGrupo('toppingContainer', 'resumenTopping', function() {
                calcularPrecioTotal();
            });

            // Función para calcular precio con adicionales
            function calcularPrecioTotal() {
                const cantSeleccionada = document.querySelector('#cantidadContainer .card.selected');
                const toppingSeleccionado = document.querySelector('#toppingContainer .card.selected');
                
                let precioBase = parseFloat(cantSeleccionada.getAttribute('data-precio'));
                
                // Si eligen Oreo sumamos el extra por ingrediente premium
                if(toppingSeleccionado.getAttribute('data-value') === "Galleta Oreo Triturada") {
                    precioBase += 1.50;
                }
                
                document.getElementById('totalPrice').innerText = "$" + precioBase.toFixed(2);
            }

            // Simulación de agregar al carrito
            const btnCarrito = document.getElementById('btnAgregarCarrito');
            const cartCount = document.getElementById('cartCount');
            
            btnCarrito.addEventListener('click', function() {
                let count = parseInt(cartCount.innerText);
                cartCount.innerText = count + 1;
                
                btnCarrito.innerText = "¡Agregado!";
                btnCarrito.style.backgroundColor = "#25D366";
                
                setTimeout(() => {
                    btnCarrito.innerText = "+ Agregar al pedido";
                    btnCarrito.style.backgroundColor = "#ff4f8b";
                }, 2000);
            });
        });
    </script>
</body>
</html>