<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personalizar Reserva | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="personalizar-reserva.css">
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

    <main class="custom-page">

        <a href="reservas.jsp" class="back-link">← Reservas</a>

        <div class="page-title">
            <h1>Personalizar reserva</h1>
            <p>Crea una experiencia única y dulce para tu evento.</p>
        </div>

        <section class="custom-layout">

            <div class="form-area">

                <section class="form-card">
                    <div class="step-number">1</div>
                    <h2>Tipo de evento</h2>

                    <div class="choice-row">
                        <label class="event-choice selected" data-type="Cumpleaños Dulce" data-price="75">
                            <input type="radio" name="tipoEvento" value="Cumpleaños Dulce" checked>
                            <span></span>
                            <div>
                                <strong>Cumpleaños</strong>
                            </div>
                        </label>

                        <label class="event-choice" data-type="Evento Corporativo" data-price="85">
                            <input type="radio" name="tipoEvento" value="Evento Corporativo">
                            <span></span>
                            <div>
                                <strong>Evento Corporativo</strong>
                            </div>
                        </label>
                    </div>
                    <div class="birthday-name-box" id="birthdayNameBox">
                        <label for="birthdayName">Nombre del cumpleañero</label>
                        <input 
                        type="text" 
                        id="birthdayName" 
                        placeholder="Ej: Sofía, Mateo, Valentina..."
                        >
                    </div>
                </section>

                <section class="form-card">
                    <div class="step-number">2</div>
                    <h2>Fecha y horario</h2>

                    <div class="date-grid">
                        <div class="calendar-box">
                            <div class="calendar-header">
                                <button type="button" id="prevMonth">‹</button>
                                <strong id="calendarTitle">Julio 2026</strong>
                                <button type="button" id="nextMonth">›</button>
                            </div>
                            <div class="calendar-days" id="calendarDays">
        <!-- Los días se generan con JavaScript -->
        </div>
    </div>

                        <div class="time-fields">
                            <label>
                                Fecha del evento
                                <input type="date" id="eventDate">
                            </label>

                            <label>
                                Hora de inicio
                                <input type="time" id="startTime">
                            </label>

                            <label>
                                Cantidad de horas
                                <select id="eventHours">
                                    <option value="2">2 horas</option>
                                    <option value="3">3 horas (+$20)</option>
                                    <option value="4">4 horas (+$40)</option>
                                    <option value="5">5 horas (+$60)</option>
                                </select>
                            </label>
                        </div>
                    </div>
                </section>

                <section class="form-card">
                    <div class="step-number">3</div>
                    <h2>Decoración</h2>

                    <div class="yes-no-row">
                        <label>
                            <input type="radio" name="decoracion" value="no" checked>
                            <span>No deseo decoración especial</span>
                        </label>

                        <label>
                            <input type="radio" name="decoracion" value="si">
                            <span>Sí deseo decoración especial +$15.00</span>
                        </label>
                    </div>

                    <div class="conditional-box hidden" id="decoracionBox">
                        <textarea id="decoracionTexto" placeholder="Describe cómo quieres la decoración. Ej: colores rosado y dorado, temática de princesa, decoración corporativa con logo..."></textarea>
                    </div>
                </section>

                <section class="form-card">
                    <div class="step-number">4</div>
                    <h2>Pastel</h2>

                    <div class="yes-no-row">
                        <label>
                            <input type="radio" name="pastel" value="no" checked>
                            <span>No deseo pastel</span>
                        </label>

                        <label>
                            <input type="radio" name="pastel" value="si">
                            <span>Sí deseo pastel</span>
                        </label>
                    </div>

                    <div class="option-cards hidden" id="pastelBox">
                        <article class="select-card pastel-card" data-name="Pastel floral" data-price="25">
                            <div class="card-img placeholder"></div>
                            <h3>Pastel Floral</h3>
                            <p>+$25.00</p>
                        </article>

                        <article class="select-card pastel-card" data-name="Pastel cumpleaños" data-price="30">
                            <div class="card-img placeholder"></div>
                            <h3>Pastel Cumpleaños</h3>
                            <p>+$30.00</p>
                        </article>

                        <article class="select-card pastel-card" data-name="Pastel infantil" data-price="30">
                            <div class="card-img placeholder"></div>
                            <h3>Pastel Infantil</h3>
                            <p>+$30.00</p>
                        </article>

                        <article class="select-card pastel-card" data-name="Pastel minimalista" data-price="40">
                            <div class="card-img placeholder"></div>
                            <h3>Pastel Minimalista</h3>
                            <p>+$40.00</p>
                        </article>
                    </div>
                </section>

                <section class="form-card">
                    <div class="step-number">5</div>
                    <h2>Boquitas</h2>

                    <div class="yes-no-row">
                        <label>
                            <input type="radio" name="boquitas" value="no" checked>
                            <span>No deseo boquitas</span>
                        </label>

                        <label>
                            <input type="radio" name="boquitas" value="si">
                            <span>Sí deseo boquitas</span>
                        </label>
                    </div>

                    <div class="option-cards hidden" id="boquitasBox">
                        <article class="select-card boquita-card" data-name="Mini donas" data-price="24">
                            <div class="card-img placeholder"></div>
                            <h3>Mini Donas</h3>
                            <p>+$24.00</p>
                        </article>

                        <article class="select-card boquita-card" data-name="Mini cupcakes" data-price="25">
                            <div class="card-img placeholder"></div>
                            <h3>Mini Cupcakes</h3>
                            <p>+$25.00</p>
                        </article>

                        <article class="select-card boquita-card" data-name="Brownies" data-price="22">
                            <div class="card-img placeholder"></div>
                            <h3>Brownies</h3>
                            <p>+$22.00</p>
                        </article>

                        <article class="select-card boquita-card" data-name="Surtido dulce" data-price="35">
                            <div class="card-img placeholder"></div>
                            <h3>Surtido Dulce</h3>
                            <p>+$35.00</p>
                        </article>
                    </div>
                </section>

                <section class="form-card" id="activitiesSection">
                    <div class="step-number">6</div>
                    <h2>Actividades</h2>

                    <div class="yes-no-row">
                        <label>
                            <input type="radio" name="actividades" value="no" checked>
                            <span>No deseo actividades</span>
                        </label>

                        <label>
                            <input type="radio" name="actividades" value="si">
                            <span>Sí deseo actividades</span>
                        </label>
                    </div>

                    <div class="activity-list hidden" id="actividadesBox">
                        <label>
                            <input type="checkbox" class="activity-check" value="Origami" data-price="10">
                            <span>Origami</span>
                            <strong>+$10</strong>
                        </label>

                        <label>
                            <input type="checkbox" class="activity-check" value="Pintura" data-price="12">
                            <span>Pintura</span>
                            <strong>+$12</strong>
                        </label>

                        <label>
                            <input type="checkbox" class="activity-check" value="Decoración de galletas" data-price="15">
                            <span>Decoración de galletas</span>
                            <strong>+$15</strong>
                        </label>
                    </div>
                </section>

                <section class="form-card">
                    <div class="step-number">7</div>
                    <h2>Observaciones</h2>

                    <textarea id="observaciones" placeholder="Alergias, preferencias, cantidad de invitados, detalles especiales del evento..."></textarea>
                </section>

            </div>

            <aside class="summary-card">
                <h2>Resumen de reserva</h2>

                <div class="summary-info">
                    <p><span>Tipo:</span> <strong id="summaryType">Cumpleaños Dulce</strong></p>
                    <p id="birthdaySummaryLine"><span>Cumpleañero:</span> <strong id="summaryBirthdayName">Por definir</strong></p>
                    <p><span>Duración:</span> <strong id="summaryHours">2 horas</strong></p>
                    <p><span>Fecha:</span> <strong id="summaryDate">Por definir</strong></p>
                    <p><span>Hora:</span> <strong id="summaryTime">Por definir</strong></p>
                </div>

                <div class="summary-prices">
                    <p><span>Paquete base</span> <strong id="summaryBase">$75.00</strong></p>
                    <p id="extraHourLine" class="hidden"><span>Hora adicional</span> <strong id="summaryExtraHours">$0.00</strong></p>
                    <p id="decoracionLine" class="hidden"><span>Decoración especial</span> <strong>$15.00</strong></p>
                    <p id="pastelLine" class="hidden"><span id="summaryPastelName">Pastel</span> <strong id="summaryPastel">$0.00</strong></p>
                    <p id="boquitasLine" class="hidden"><span id="summaryBoquitasName">Boquitas</span> <strong id="summaryBoquitas">$0.00</strong></p>
                    <p id="activitiesLine" class="hidden"><span>Actividades</span> <strong id="summaryActivities">$0.00</strong></p>
                </div>

                <div class="total-box">
                    <span>Total estimado</span>
                    <strong id="summaryTotal">$75.00</strong>
                </div>

                <button type="button" class="confirm-btn">Confirmar reserva</button>

                <a href="#" target="_blank" id="whatsappReserva" class="whatsapp-btn">
                    Reservar por WhatsApp
                </a>

                <small>Precio provisional. La reserva se confirma por WhatsApp.</small>
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
            <p>+507 315-8752</p>
        </div>

        <div class="copyright">
            © 2025 Ellado Dulce. Todos los derechos reservados.
        </div>
    </footer>

    <script src="personalizar-reserva.js"></script>
</body>
</html>