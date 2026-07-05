<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("idCliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String nombreCliente = (String) session.getAttribute("nombreCliente");
    String apellidoCliente = (String) session.getAttribute("apellidoCliente");
    String usuarioCliente = (String) session.getAttribute("usuarioCliente");
    String correoCliente = (String) session.getAttribute("correoCliente");

    if (nombreCliente == null) nombreCliente = "";
    if (apellidoCliente == null) apellidoCliente = "";
    if (usuarioCliente == null) usuarioCliente = "";
    if (correoCliente == null) correoCliente = "";
%>

document.addEventListener("DOMContentLoaded", function () {
    const totalPoints = document.getElementById("totalPoints");
    const activitiesCard = document.getElementById("activitiesCard");
    const activitiesList = document.getElementById("activitiesList");

    const actividadesCompradas = JSON.parse(localStorage.getItem("misCupos")) || [];

    function limpiarPrecio(precioTexto) {
        if (!precioTexto) {
            return 0;
        }

        return Number(precioTexto.replace("$", "").trim()) || 0;
    }

    function calcularPuntos() {
        const puntosGuardados = Number(localStorage.getItem("totalPuntos"));

        if (!isNaN(puntosGuardados) && puntosGuardados > 0) {
            return puntosGuardados;
        }

        let puntos = 0;

        actividadesCompradas.forEach(function (actividad) {
            const precio = limpiarPrecio(actividad.subtotal);
            puntos += Math.round(precio * 10);
        });

        return puntos;
    }

    function obtenerEnlaceActividad(nombreActividad) {
        const nombre = nombreActividad.toLowerCase();

        if (nombre.includes("crochet")) {
            return "detalle-crochet.jsp";
        }

        if (nombre.includes("dibujo")) {
            return "detalle-dibujo.jsp";
        }

        if (nombre.includes("cupcakes")) {
            return "detalle-cupcakes.jsp";
        }

        if (nombre.includes("galletas")) {
            return "detalle-galletas.jsp";
        }

        if (nombre.includes("origami")) {
            return "detalle-origami.jsp";
        }

        return "actividades.jsp";
    }

    function mostrarPuntos() {
        if (totalPoints) {
            totalPoints.textContent = calcularPuntos();
        }
    }

    function mostrarActividades() {
        if (!activitiesList || !activitiesCard) {
            return;
        }

        activitiesList.innerHTML = "";

        if (actividadesCompradas.length === 0) {
            activitiesCard.classList.remove("hidden");

            activitiesList.innerHTML = `
                <div class="empty-activities">
                    <strong>No hay actividades aún.</strong>
                    <p>Cuando compres un cupo para una actividad, aparecerá aquí con su información.</p>
                    <a href="actividades.jsp">Ver actividades disponibles</a>
                </div>
            `;

            return;
        }

        activitiesCard.classList.remove("hidden");

        actividadesCompradas.forEach(function (actividad) {
            const row = document.createElement("div");
            row.classList.add("activity-row");

            const enlace = obtenerEnlaceActividad(actividad.actividad);

            row.innerHTML = `
                <div class="activity-name">
                    <strong>${actividad.actividad}</strong>
                    <small>${actividad.nivel || "Taller creativo"}</small>
                </div>

                <div class="activity-date">
                    <strong>${actividad.fecha || "Por definir"}</strong>
                    <small>${actividad.horario || "Horario pendiente"}</small>
                </div>

                <strong class="activity-price">${actividad.subtotal || "$0.00"}</strong>

                <a href="${enlace}" class="detail-btn">Ver detalles</a>
            `;

            activitiesList.appendChild(row);
        });
    }

    mostrarPuntos();
    mostrarActividades();
});