document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("reservaDetalleForm");
    const btnComprarReserva = document.getElementById("btnComprarReserva");
    const whatsappReserva = document.getElementById("whatsappReserva");

    const nombrePrincipal = document.getElementById("nombrePrincipal");
    const decoracionDescripcion = document.getElementById("decoracionDescripcion");
    const fechaReserva = document.getElementById("fechaReserva");
    const horaReserva = document.getElementById("horaReserva");

    let fechasOcupadas = [];

    function usuarioEstaLogueado() {
    return typeof clienteLogueado !== "undefined" &&
           (clienteLogueado === true || clienteLogueado === "true");
}

    function obtenerFechaManana() {
        const hoy = new Date();
        hoy.setDate(hoy.getDate() + 1);

        const anio = hoy.getFullYear();
        const mes = String(hoy.getMonth() + 1).padStart(2, "0");
        const dia = String(hoy.getDate()).padStart(2, "0");

        return anio + "-" + mes + "-" + dia;
    }

    async function cargarFechasOcupadas() {
        try {
            const respuesta = await fetch("reservas-ocupadas.jsp");
            fechasOcupadas = await respuesta.json();
        } catch (error) {
            fechasOcupadas = [];
        }
    }

    function configurarFechaMinima() {
        const manana = obtenerFechaManana();

        fechaReserva.min = manana;
    }

    function validarFechaOcupada() {
        const fechaSeleccionada = fechaReserva.value;

        if (!fechaSeleccionada) {
            return true;
        }

        if (fechasOcupadas.includes(fechaSeleccionada)) {
            alert("Esa fecha ya está ocupada. Elige otro día.");
            fechaReserva.value = "";
            fechaReserva.focus();
            return false;
        }

        return true;
    }

    function validarFechaAnticipacion() {
        const manana = obtenerFechaManana();

        if (fechaReserva.value && fechaReserva.value < manana) {
            alert("La reserva debe hacerse con al menos un día de anticipación.");
            fechaReserva.value = "";
            fechaReserva.focus();
            return false;
        }

        return true;
    }

    function validarFormulario() {
        if (!nombrePrincipal.value.trim()) {
            alert("Completa el campo principal de la reserva.");
            nombrePrincipal.focus();
            return false;
        }

        if (!fechaReserva.value) {
            alert("Selecciona la fecha de la reserva.");
            fechaReserva.focus();
            return false;
        }

        if (!validarFechaAnticipacion()) {
            return false;
        }

        if (!validarFechaOcupada()) {
            return false;
        }

        if (!horaReserva.value) {
            alert("Selecciona la hora de la reserva.");
            horaReserva.focus();
            return false;
        }

        return true;
    }

    if (fechaReserva) {
        fechaReserva.addEventListener("change", function () {
            validarFechaAnticipacion();
            validarFechaOcupada();
        });
    }
if (btnComprarReserva) {
    btnComprarReserva.addEventListener("click", function () {

        if (!usuarioEstaLogueado()) {
            alert("Debes iniciar sesión para realizar una reserva.");
            window.location.href = "mi-cuenta.jsp";
            return;
        }

        if (validarFormulario()) {
            form.submit();
        }
    });
}
    if (form) {
        form.addEventListener("submit", function (event) {
            if (!validarFormulario()) {
                event.preventDefault();
            }
        });
    }

    function actualizarWhatsapp() {
        if (!whatsappReserva) {
            return;
        }

        const texto =
            "Hola, quiero información sobre la reserva " + nombreTipoReserva +
            ". Precio base: B/." + precioTipoReserva +
            " por " + horasTipoReserva + " horas.";

        whatsappReserva.href = "https://wa.me/5073158752?text=" + encodeURIComponent(texto);
    }

    async function iniciarPagina() {
        configurarFechaMinima();
        await cargarFechasOcupadas();
        actualizarWhatsapp();
    }

    iniciarPagina();
});