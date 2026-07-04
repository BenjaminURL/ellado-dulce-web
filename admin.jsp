<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de administración | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="admin.css">
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
            <a href="Boquitas.jsp">Boquitas</a>
            <a href="Pasteles.jsp">Pasteles</a>
            <a href="reservas.jsp">Reservas</a>
            <a href="actividades.jsp">Actividades</a>
            <a href="nosotros.jsp">Nosotros</a>
            <a href="mi-cuenta.jsp">Mi cuenta</a>
        </nav>

        <div class="cart">
            <a href="#">
                <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
            </a>
        </div>
    </header>

    <main class="admin-page">

        <section class="admin-header">
            <div class="admin-title">

                <div>
                    <h1>Panel de administración</h1>
                    <p>Gestiona pedidos, actividades y reservas del local desde un solo lugar.</p>
                </div>
            </div>
        </section>

    

        <section class="filter-card">
            <h2>Buscar cliente</h2>

            <div class="filter-row">
                <div class="field-group small-field">
                    <label for="buscarPor">Buscar por</label>
                    <select id="buscarPor">
                        <option value="todos">Todos</option>
                        <option value="cedula">Cédula</option>
                        <option value="nombre">Nombre y apellido</option>
                        <option value="celular">Celular</option>
                        <option value="correo">Correo</option>
                    </select>
                </div>

                <div class="field-group search-field">
                    <label for="busquedaCliente">Buscar</label>
                    <input type="text" id="busquedaCliente" placeholder="Escribe el término de búsqueda">
                </div>

                <button type="button" class="search-btn" id="btnBuscar">
                    Buscar
                </button>
            </div>
        </section>

        <section class="filter-card second-filter">
            <div class="filter-row">
                <div class="field-group small-field">
                    <label for="buscarRegistro">Buscar registro</label>
                    <select id="buscarRegistro">
                        <option value="todo">Todo</option>
                        <option value="actividad">Actividad</option>
                        <option value="pedido">Pedido</option>
                        <option value="reserva">Reserva</option>
                    </select>
                </div>

                <div class="field-group small-field">
                    <label for="estadoRegistro">Estado</label>
                    <select id="estadoRegistro">
                        <option value="todo">Todo</option>
                        <option value="pendiente">Pendiente</option>
                        <option value="en proceso">En proceso</option>
                        <option value="listo">Listo</option>
                        <option value="entregado">Entregado</option>
                    </select>
                </div>

                <div class="field-group date-field">
                    <label for="rangoFechas">Rango de fechas</label>
                    <input type="text" id="rangoFechas" value="01/05/2025 - 14/05/2025">
                </div>

                <button type="button" class="clear-btn" id="btnLimpiar">
                    ↻ Limpiar filtros
                </button>
            </div>
        </section>

        <section class="records-card">
            <div class="records-header">
                <h2>Registros encontrados <span id="contadorRegistros">(0)</span></h2>
            </div>

            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>Tipo de registro</th>
                            <th>Cliente</th>
                            <th>Cédula</th>
                            <th>Celular</th>
                            <th>Correo</th>
                            <th>Fecha</th>
                            <th>Estado</th>
                            <th>Acción</th>
                        </tr>
                    </thead>

                    <tbody id="tablaRegistros">
                        <!-- Los registros se cargan con JavaScript -->
                    </tbody>
                </table>
            </div>

            <div class="table-footer">
                <p id="textoCantidad">Mostrando registros</p>

                <div class="pagination">
                    <button type="button" id="btnPaginaAnterior" disabled>‹</button>
                    <button type="button" class="active-page" id="paginaActual">1</button>
                    <button type="button" id="btnPaginaSiguiente" disabled>›</button>
</div>
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
            <p>+507 315-8752</p>
        </div>

        <div class="copyright">
            © 2025 Ellado Dulce. Todos los derechos reservados.
        </div>
    </footer>

    <script src="admin.js"></script>
</body>
</html>