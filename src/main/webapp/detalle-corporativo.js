document.addEventListener("DOMContentLoaded", function () {
    const empresa = document.getElementById("empresa");
    const detalles = document.getElementById("detalles");
    const fecha = document.getElementById("fecha");
    const hora = document.getElementById("hora");
    const whatsappCorporativo = document.getElementById("whatsappCorporativo");

    function actualizarWhatsapp() {
        const empresaTexto = empresa.value.trim() || "Por definir";
        const detallesTexto = detalles.value.trim() || "Sin detalles adicionales";
        const fechaTexto = fecha.value || "Por definir";
        const horaTexto = hora.value || "Por definir";

        const mensaje =
            "Hola, quiero reservar el paquete Evento Corporativo.%0A" +
            "Precio: $85.00 por 2 horas%0A" +
            "Empresa: " + encodeURIComponent(empresaTexto) + "%0A" +
            "Fecha: " + encodeURIComponent(fechaTexto) + "%0A" +
            "Hora: " + encodeURIComponent(horaTexto) + "%0A" +
            "Detalles de decoración: " + encodeURIComponent(detallesTexto);

        whatsappCorporativo.href = "https://wa.me/5071234567?text=" + mensaje;
    }

    empresa.addEventListener("input", actualizarWhatsapp);
    detalles.addEventListener("input", actualizarWhatsapp);
    fecha.addEventListener("input", actualizarWhatsapp);
    hora.addEventListener("input", actualizarWhatsapp);

    actualizarWhatsapp();
});