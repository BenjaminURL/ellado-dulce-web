<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    if (session.getAttribute("idCliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int idCliente = (Integer) session.getAttribute("idCliente");

    int puntosCliente = 0;

Connection conPuntos = null;
PreparedStatement psPuntos = null;
ResultSet rsPuntos = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    conPuntos = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/ellado_dulce_db",
        "root",
        ""
    );

    String sqlPuntos = "SELECT c_puntos FROM cliente WHERE c_id_cliente = ?";

    psPuntos = conPuntos.prepareStatement(sqlPuntos);
    psPuntos.setInt(1, idCliente);

    rsPuntos = psPuntos.executeQuery();

    if (rsPuntos.next()) {
        puntosCliente = rsPuntos.getInt("c_puntos");
    }

} catch (Exception e) {
    puntosCliente = 0;

} finally {
    if (rsPuntos != null) rsPuntos.close();
    if (psPuntos != null) psPuntos.close();
    if (conPuntos != null) conPuntos.close();
}

    String nombreCliente = (String) session.getAttribute("nombreCliente");
    String apellidoCliente = (String) session.getAttribute("apellidoCliente");
    String usuarioCliente = (String) session.getAttribute("usuarioCliente");
    String correoCliente = (String) session.getAttribute("correoCliente");
    String telefonoCliente = (String) session.getAttribute("telefonoCliente");

    if (nombreCliente == null) nombreCliente = "";
    if (apellidoCliente == null) apellidoCliente = "";
    if (usuarioCliente == null) usuarioCliente = "";
    if (correoCliente == null) correoCliente = "";
    if (telefonoCliente == null || telefonoCliente.trim().equals("")) telefonoCliente = "No registrado";

    SimpleDateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat formatoHora = new SimpleDateFormat("hh:mm a");
    SimpleDateFormat formatoFechaHora = new SimpleDateFormat("dd/MM/yyyy hh:mm a");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi cuenta | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="layout.css">
    <link rel="stylesheet" href="mi-cuenta.css">
</head>
<body>

<header class="navbar">
    <div class="logo">
        <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="logo-img">
        <span>Ellado <strong>Dulce</strong></span>
    </div>

    <nav class="menu">
            <a href="index.jsp">Inicio</a>

            <div class="dropdown">
                <a href="" class="dropdown-toggle">Boquitas <span class="arrow">∨</span></a>
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
        <a href="pantalla-de-carrito.jsp">
            <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
        </a>
    </div>
</header>

<main class="account-page">

    <section class="account-grid">

        <div class="main-column">

            <section class="welcome-card">
                <div class="user-info">

                    <div>
                        <span>Bienvenida de vuelta</span>
                        <h1>Hola, <strong id="userName"><%= nombreCliente %></strong></h1>
                        <p>
                            Aquí puedes ver tus órdenes, reservas y actividades compradas.
                        </p>
                    </div>
                </div>

                <div class="points-box">
                    <span>PUNTOS</span>
                    <strong id="totalPoints"><%= puntosCliente %></strong>
                </div>
            </section>

            <section class="history-card">
                <div class="section-header">
                    <h2>Mi historial</h2>

                    <select id="historySelect" class="history-select">
                        <option value="actividades">Actividades</option>
                        <option value="ordenes">Órdenes</option>
                        <option value="reservas">Reservas</option>
                    </select>
                </div>

                <div class="history-section" id="actividadesSection">
                    <h3>Mis actividades</h3>

                    <div class="history-table">
                        <div class="table-head">
                            <span>Actividad</span>
                            <span>Fecha y hora</span>
                            <span>Confirmación</span>
                            <span>Estado</span>
                        </div>

<%
    Connection conAct = null;
    PreparedStatement psAct = null;
    ResultSet rsAct = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        conAct = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        String sqlAct =
            "SELECT a.a_nombre, a.a_fecha, a.a_hora, ac.ac_numero_confirmacion, ac.ac_estado " +
            "FROM actividad_compra ac " +
            "INNER JOIN actividad a ON ac.ac_id_actividad = a.a_id_actividad " +
            "WHERE ac.ac_id_cliente = ? " +
            "ORDER BY ac.ac_fecha_compra DESC";

        psAct = conAct.prepareStatement(sqlAct);
        psAct.setInt(1, idCliente);

        rsAct = psAct.executeQuery();

        boolean hayActividades = false;

        while (rsAct.next()) {
            hayActividades = true;

            String actividad = rsAct.getString("a_nombre");
            java.sql.Date fecha = rsAct.getDate("a_fecha");
            java.sql.Time hora = rsAct.getTime("a_hora");
            String confirmacion = rsAct.getString("ac_numero_confirmacion");
            String estado = rsAct.getString("ac_estado");

            String fechaHoraTexto = formatoFecha.format(fecha) + " " + formatoHora.format(hora);
%>

                        <div class="table-row">
                            <span><%= actividad %></span>
                            <span><%= fechaHoraTexto %></span>
                            <span><%= confirmacion %></span>
                            <span><%= estado %></span>
                        </div>

<%
        }

        if (!hayActividades) {
%>

                        <div class="empty-message">
                            No tienes actividades compradas todavía.
                        </div>

<%
        }

    } catch (Exception e) {
%>

                        <div class="empty-message">
                            Error al cargar tus actividades.
                        </div>

<%
        e.printStackTrace();

    } finally {
        if (rsAct != null) rsAct.close();
        if (psAct != null) psAct.close();
        if (conAct != null) conAct.close();
    }
%>

                    </div>
                </div>

                <div class="history-section hidden" id="ordenesSection">
                    <h3>Mis órdenes</h3>

                    <div class="history-table">
                        <div class="table-head">
                            <span>Producto</span>
                            <span>Cantidad</span>
                            <span>Total</span>
                            <span>Estado</span>
                        </div>

<%
    Connection conPed = null;
    PreparedStatement psPed = null;
    ResultSet rsPed = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        conPed = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        String sqlPed =
            "SELECT m.m_producto, p.pd_cantidad, p.pd_total, p.pd_estado, p.pf_fechapedido " +
            "FROM pedido p " +
            "INNER JOIN menu m ON p.pd_m_id_menu = m.m_id_menu " +
            "WHERE p.pd_c_id_cliente = ? " +
            "ORDER BY p.pf_fechapedido DESC";

        psPed = conPed.prepareStatement(sqlPed);
        psPed.setInt(1, idCliente);

        rsPed = psPed.executeQuery();

        boolean hayPedidos = false;

        while (rsPed.next()) {
            hayPedidos = true;

            String producto = rsPed.getString("m_producto");
            int cantidad = rsPed.getInt("pd_cantidad");
            double total = rsPed.getDouble("pd_total");
            String estado = rsPed.getString("pd_estado");

            String totalTexto = String.format(java.util.Locale.US, "%.2f", total);
%>

                        <div class="table-row">
                            <span><%= producto %></span>
                            <span><%= cantidad %></span>
                            <span>B/.<%= totalTexto %></span>
                            <span><%= estado %></span>
                        </div>

<%
        }

        if (!hayPedidos) {
%>

                        <div class="empty-message">
                            No tienes órdenes registradas todavía.
                        </div>

<%
        }

    } catch (Exception e) {
%>

                        <div class="empty-message">
                            Error al cargar tus órdenes.
                        </div>

<%
        e.printStackTrace();

    } finally {
        if (rsPed != null) rsPed.close();
        if (psPed != null) psPed.close();
        if (conPed != null) conPed.close();
    }
%>

                    </div>
                </div>

                <div class="history-section hidden" id="reservasSection">
                    <h3>Mis reservas</h3>

                    <div class="history-table">
                        <div class="table-head">
                            <span>Reserva</span>
                            <span>Fecha y hora</span>
                            <span>Total</span>
                            <span>Estado</span>
                        </div>

<%
    Connection conRes = null;
    PreparedStatement psRes = null;
    ResultSet rsRes = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        conRes = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        String sqlRes =
            "SELECT r.r_id_reserva, tr.tr_nombre, r.r_fecha, r.r_hora, r.r_total_estimado, r.r_estado " +
            "FROM reserva r " +
            "INNER JOIN tipo_reserva tr ON r.r_tr_id_tipo = tr.tr_id_tipo " +
            "WHERE r.r_c_id_cliente = ? " +
            "ORDER BY r.r_fecha_registro DESC";

        psRes = conRes.prepareStatement(sqlRes);
        psRes.setInt(1, idCliente);

        rsRes = psRes.executeQuery();

        boolean hayReservas = false;

        while (rsRes.next()) {
            hayReservas = true;

            int idReserva = rsRes.getInt("r_id_reserva");
            String tipoReserva = rsRes.getString("tr_nombre");
            java.sql.Date fecha = rsRes.getDate("r_fecha");
            java.sql.Time hora = rsRes.getTime("r_hora");
            double total = rsRes.getDouble("r_total_estimado");
            String estado = rsRes.getString("r_estado");

            String fechaHoraTexto = formatoFecha.format(fecha) + " " + formatoHora.format(hora);
            String totalTexto = String.format(java.util.Locale.US, "%.2f", total);
%>

                        <div class="table-row">
                            <span>RES-<%= idReserva %> | <%= tipoReserva %></span>
                            <span><%= fechaHoraTexto %></span>
                            <span>B/.<%= totalTexto %></span>
                            <span><%= estado %></span>
                        </div>

<%
        }

        if (!hayReservas) {
%>

                        <div class="empty-message">
                            No tienes reservas registradas todavía.
                        </div>

<%
        }

    } catch (Exception e) {
%>

                        <div class="empty-message">
                            Error al cargar tus reservas.
                        </div>

<%
        e.printStackTrace();

    } finally {
        if (rsRes != null) rsRes.close();
        if (psRes != null) psRes.close();
        if (conRes != null) conRes.close();
    }
%>

                    </div>
                </div>

                <div class="info-message">
                    <span>ⓘ</span>
                    <p>Usa el menú para cambiar entre tus actividades, órdenes y reservas.</p>
                </div>
            </section>

        </div>

        <aside class="side-column">

            <section class="personal-card">
                <a href="logout.jsp" class="logout-btn">Cerrar sesión</a>
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
        <a href="#">Cómo llegar &rarr;</a>
    </div>

    <div class="footer-col">
        <h3>Contacto</h3>
        <p>@elladodulce</p>
        <p>+507 312-2322</p>
    </div>

    <div class="copyright">
        © 2026 Ellado Dulce. Todos los derechos reservados.
    </div>
</footer>

<script>
    const historySelect = document.getElementById("historySelect");

    const actividadesSection = document.getElementById("actividadesSection");
    const ordenesSection = document.getElementById("ordenesSection");
    const reservasSection = document.getElementById("reservasSection");

    historySelect.addEventListener("change", function () {
        actividadesSection.classList.add("hidden");
        ordenesSection.classList.add("hidden");
        reservasSection.classList.add("hidden");

        if (historySelect.value === "actividades") {
            actividadesSection.classList.remove("hidden");
        }

        if (historySelect.value === "ordenes") {
            ordenesSection.classList.remove("hidden");
        }

        if (historySelect.value === "reservas") {
            reservasSection.classList.remove("hidden");
        }
    });
</script>

</body>
</html>