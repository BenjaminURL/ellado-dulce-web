document.addEventListener("DOMContentLoaded", function () {
    const userName = document.getElementById("userName");
    const profileName = document.getElementById("profileName");
    const profileEmail = document.getElementById("profileEmail");
    const profilePhone = document.getElementById("profilePhone");

    const totalPoints = document.getElementById("totalPoints");
    const activitiesCard = document.getElementById("activitiesCard");
    const activitiesList = document.getElementById("activitiesList");

    const perfilGuardado = JSON.parse(localStorage.getItem("perfilUsuario")) || {
        nombre: "María Alejandra",
        correo: "maria@ejemplo.com",
        telefono: "+507 6123-4567"
    };

    const actividadesCompradas = JSON.parse(localStorage.getItem("misCupos")) || [];

    function obtenerPrimerNombre(nombreCompleto) {
        return nombreCompleto.trim().split(" ")[0];
    }

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
            return "detalle-crochet.html";
        }

        if (nombre.includes("dibujo")) {
            return "detalle-dibujo.html";
        }

        if (nombre.includes("cupcakes")) {
            return "detalle-cupcakes.html";
        }

        if (nombre.includes("galletas")) {
            return "detalle-galletas.html";
        }

        if (nombre.includes("origami")) {
            return "detalle-origami.html";
        }

        return "actividades.html";
    }

    function mostrarDatosUsuario() {
        userName.textContent = obtenerPrimerNombre(perfilGuardado.nombre);
        profileName.textContent = perfilGuardado.nombre;
        profileEmail.textContent = perfilGuardado.correo;
        profilePhone.textContent = perfilGuardado.telefono;

        totalPoints.textContent = calcularPuntos();
    }

    function mostrarActividades() {
    activitiesList.innerHTML = "";

    if (actividadesCompradas.length === 0) {
        activitiesCard.classList.remove("hidden");

        activitiesList.innerHTML = `
            <div class="empty-activities">
                <strong>No hay actividades aún.</strong>
                <p>Cuando compres un cupo para una actividad, aparecerá aquí con su información.</p>
                <a href="actividades.html">Ver actividades disponibles</a>
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

    mostrarDatosUsuario();
    mostrarActividades();
});