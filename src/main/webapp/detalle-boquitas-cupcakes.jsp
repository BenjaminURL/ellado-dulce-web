<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mini Cupcakes | El Lado Dulce</title>

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
		
            <!-- ÍTEM DESPLEGABLE DE BOQUITAS (Marcado como active) -->
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
                <h1>Mini Cupcakes <br><span>Personalizados</span></h1>
                <p>
                    Perfectos para cumpleaños, mesas de dulces y eventos corporativos. 
                    Elige el sabor, la cantidad y personaliza los colores de la crema a tu gusto.
                </p>
            </div>
        </section>

        <!-- GRID DEL CONFIGURADOR / DETALLE DE PRODUCTO -->
        <div class="configurator-grid">
            
            <!-- PANEL DE VISTA PREVIA (IZQUIERDA) -->
            <div class="preview-panel">
                <img id="previewCake" src="imagenes/productos/mini-cupcakes-base.png" alt="Mini Cupcakes Decorados">
            </div>

            <!-- PANEL DE SELECCIÓN DE OPCIONES (CENTRO) -->
            <div class="options-panel">
                
                <!-- Categoría 1: Cantidad -->
                <div class="category">
                    <h2>1. Selecciona la cantidad</h2>
                    <div class="cards" id="cantidadContainer">
                        <div class="card selected" data-precio="15.00" data-value="12 unidades">
                            <div>
                                <strong>Caja de 12 unidades</strong>
                                <p>Ideal para compartir en familia</p>
                            </div>
                            <span class="option-price">$15.00</span>
                        </div>
                        <div class="card" data-precio="28.00" data-value="24 unidades">
                            <div>
                                <strong>Caja de 24 unidades</strong>
                                <p>Recomendado para reuniones</p>
                            </div>
                            <span class="option-price">$28.00</span>
                        </div>
                        <div class="card" data-precio="55.00" data-value="58 unidades">
                            <div>
                                <strong>Bandeja de 50 unidades</strong>
                                <p>Perfecto para eventos grandes</p>
                            </div>
                            <span class="option-price">$55.00</span>
                        </div>
                    </div>
                </div>

                <!-- Categoría 2: Masa / Sabor -->
                <div class="category">
                    <h2>2. Sabor del bizcocho</h2>
                    <div class="cards" id="saborContainer">
                        <div class="card selected" data-value="Vainilla Tradicional">
                            <strong>Vainilla Tradicional</strong>
                        </div>
                        <div class="card" data-value="Chocolate Intenso">
                            <strong>Chocolate Intenso</strong>
                        </div>
                        <div class="card" data-value="Red Velvet">
                            <strong>Red Velvet (+ $2.00)</strong>
                        </div>
                    </div>
                </div>

                <!-- Categoría 3: Cobertura -->
                <div class="category">
                    <h2>3. Tipo de Frosting</h2>
                    <div class="cards" id="frostingContainer">
                        <div class="card selected" data-value="Crema de Mantequilla">
                            <strong>Buttercream (Crema de Mantequilla)</strong>
                        </div>
                        <div class="card" data-value="Chantilly Ligero">
                            <strong>Chantilly Ligero</strong>
                        </div>
                        <div class="card" data-value="Crema de Queso">
                            <strong>Cream Cheese</strong>
                        </div>
                    </div>
                </div>

            </div>

            <!-- PANEL DE RESUMEN DE COMPRA (DERECHA) -->
            <div class="summary-panel">
                <h2>Resumen de Boquitas</h2>
                
                <div class="summary-item">
                    <span>Producto:</span>
                    <strong>Mini Cupcakes</strong>
                </div>
                <div class="summary-item">
                    <span>Cantidad:</span>
                    <strong id="resumenCantidad">12 unidades</strong>
                </div>
                <div class="summary-item">
                    <span>Masa:</span>
                    <strong id="resumenSabor">Vainilla Tradicional</strong>
                </div>
                <div class="summary-item">
                    <span>Frosting:</span>
                    <strong id="resumenFrosting">Crema de Mantequilla</strong>
                </div>

                <hr style="border: 0; border-top: 1px solid #eee; margin: 15px 0;">

                <div class="summary-price">
                    <span>Total:</span>
                    <span id="totalPrice" style="color: #ff4f8b;">$15.00</span>
                </div>

                <button class="btn btn-primary" id="btnAgregarCarrito">+ Agregar al pedido</button>
            </div>

        </div>
    </main>

    <!-- FOOTER IDENTICO -->
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

    <!-- LÓGICA DE COMPORTAMIENTO INTERACTIVO -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            
            // Función genérica para manejar la selección de tarjetas
            function configurarGrupo(containerId, resumenId, onChangeCallback) {
                const container = document.getElementById(containerId);
                const cards = container.querySelectorAll('.card');
                
                cards.forEach(card => {
                    card.addEventListener('click', function() {
                        // Desmarcar las otras del mismo grupo
                        cards.forEach(c => c.classList.remove('selected'));
                        // Marcar la actual
                        this.classList.add('selected');
                        
                        // Actualizar texto del resumen lateral
                        const valor = this.getAttribute('data-value');
                        document.getElementById(resumenId).innerText = valor;
                        
                        if(onChangeCallback) onChangeCallback(this);
                    });
                });
            }

            // Manejar Cantidades y Precios
            configurarGrupo('cantidadContainer', 'resumenCantidad', function(cardSeleccionada) {
                calcularPrecioTotal();
            });

            // Manejar Sabores
            configurarGrupo('saborContainer', 'resumenSabor', function(cardSeleccionada) {
                calcularPrecioTotal();
            });

            // Manejar Frosting
            configurarGrupo('frostingContainer', 'resumenFrosting');

            // Función para calcular el precio total combinando opciones
            function calcularPrecioTotal() {
                const cantSeleccionada = document.querySelector('#cantidadContainer .card.selected');
                const saborSeleccionado = document.querySelector('#saborContainer .card.selected');
                
                let precioBase = parseFloat(cantSeleccionada.getAttribute('data-precio'));
                
                // Si eligen Red Velvet sumamos un pequeño extra por el tipo de masa especial
                if(saborSeleccionado.getAttribute('data-value') === "Red Velvet") {
                    precioBase += 2.00;
                }
                
                document.getElementById('totalPrice').innerText = "$" + precioBase.toFixed(2);
            }

            // Simulación de agregar al carrito
            const btnCarrito = document.getElementById('btnAgregarCarrito');
            const cartCount = document.getElementById('cartCount');
            
            btnCarrito.addEventListener('click', function() {
                let count = parseInt(cartCount.innerText);
                cartCount.innerText = count + 1;
                
                // Animación simple de feedback
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