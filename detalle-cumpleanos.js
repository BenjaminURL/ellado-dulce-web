document.addEventListener("DOMContentLoaded", function () {
    const cumpleanero = document.getElementById("cumpleanero");
    const decoracion = document.getElementById("decoracion");
    const invitados = document.getElementById("invitados");
    const fecha = document.getElementById("fecha");
    const hora = document.getElementById("hora");
    const whatsappCumpleanos = document.getElementById("whatsappCumpleanos");

    function actualizarWhatsapp() {
        const cumpleaneroTexto = cumpleanero.value.trim() || "Por definir";
        const decoracionTexto = decoracion.value.trim() || "Sin detalles adicionales";
        const invitadosTexto = invitados.value.trim() || "Por definir";
        const fechaTexto = fecha.value || "Por definir";
        const horaTexto = hora.value || "Por definir";

        const mensaje =
            "Hola, quiero reservar el paquete Cumpleaños Dulce.%0A" +
            "Precio: $75.00 por 2 horas%0A" +
            "Nombre del cumpleañero: " + encodeURIComponent(cumpleaneroTexto) + "%0A" +
            "Cantidad aproximada de invitados: " + encodeURIComponent(invitadosTexto) + "%0A" +
            "Fecha: " + encodeURIComponent(fechaTexto) + "%0A" +
            "Hora: " + encodeURIComponent(horaTexto) + "%0A" +
            "Decoración deseada: " + encodeURIComponent(decoracionTexto);

        whatsappCumpleanos.href = "https://wa.me/5071234567?text=" + mensaje;
    }

    cumpleanero.addEventListener("input", actualizarWhatsapp);
    decoracion.addEventListener("input", actualizarWhatsapp);
    invitados.addEventListener("input", actualizarWhatsapp);
    fecha.addEventListener("input", actualizarWhatsapp);
    hora.addEventListener("input", actualizarWhatsapp);

    actualizarWhatsapp();
});