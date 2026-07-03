document.addEventListener("DOMContentLoaded", function () {
    const precioBase = 18;
    const nombreActividad = "Decoración de cupcakes";
    const telefonoWhatsApp = "5071234567";

    let cantidad = 1;
    let horarioSeleccionado = "Sábado 3:00 p.m.";
    let nivelSeleccionado = "Principiante";

    const scheduleOptions = document.querySelectorAll(".schedule-option");
    const levelOptions = document.querySelectorAll(".level-option");

    const btnRestar = document.getElementById("btnRestar");
    const btnSumar = document.getElementById("btnSumar");
    const cantidadTexto = document.getElementById("cantidad");
    const subtotalTexto = document.getElementById("subtotal");
    const notas = document.getElementById("notas");

    const comprarCupo = document.getElementById("comprarCupo");
    const whatsappBtn = document.getElementById("whatsappBtn");
    const confirmationBox = document.getElementById("confirmationBox");
    const confirmationNumber = document.getElementById("confirmationNumber");

    const thumbs = document.querySelectorAll(".thumb");

    btnRestar.disabled = true;

    function money(value) {
        return "$" + value.toFixed(2);
    }

    function calcularSubtotal() {
        return precioBase * cantidad;
    }

    function actualizarSubtotal() {
        cantidadTexto.textContent = cantidad;
        subtotalTexto.textContent = money(calcularSubtotal());

        if (cantidad === 1) {
            btnRestar.disabled = true;
        } else {
            btnRestar.disabled = false;
        }

        actualizarWhatsapp();
    }

    function generarNumeroConfirmacion() {
        const random = Math.floor(1000 + Math.random() * 9000);
        return "ED-CUP-" + random;
    }

    function guardarCupo(numeroConfirmacion) {
        const cuposGuardados = JSON.parse(localStorage.getItem("misCupos")) || [];

        const nuevoCupo = {
            confirmacion: numeroConfirmacion,
            actividad: nombreActividad,
            horario: horarioSeleccionado,
            nivel: nivelSeleccionado,
            cantidad: cantidad,
            subtotal: money(calcularSubtotal())
        };

        cuposGuardados.push(nuevoCupo);

        localStorage.setItem("misCupos", JSON.stringify(cuposGuardados));
    }

    function actualizarWhatsapp() {
        const notasTexto = notas.value.trim() || "Sin notas especiales";

        const mensaje =
            "Hola, quiero comprar cupo para una actividad en Ellado Dulce.%0A" +
            "Actividad: " + encodeURIComponent(nombreActividad) + "%0A" +
            "Horario: " + encodeURIComponent(horarioSeleccionado) + "%0A" +
            "Nivel: " + encodeURIComponent(nivelSeleccionado) + "%0A" +
            "Cantidad de cupos: " + cantidad + "%0A" +
            "Subtotal: " + encodeURIComponent(money(calcularSubtotal())) + "%0A" +
            "Notas: " + encodeURIComponent(notasTexto);

        whatsappBtn.href = "https://wa.me/" + telefonoWhatsApp + "?text=" + mensaje;
    }

    scheduleOptions.forEach(function (option) {
        option.addEventListener("click", function () {
            scheduleOptions.forEach(function (item) {
                item.classList.remove("selected");
            });

            option.classList.add("selected");
            horarioSeleccionado = option.dataset.horario;

            actualizarWhatsapp();
        });
    });

    levelOptions.forEach(function (option) {
        option.addEventListener("click", function () {
            levelOptions.forEach(function (item) {
                item.classList.remove("selected");
            });

            option.classList.add("selected");
            nivelSeleccionado = option.dataset.nivel;

            actualizarWhatsapp();
        });
    });

    btnSumar.addEventListener("click", function () {
        cantidad++;
        actualizarSubtotal();
    });

    btnRestar.addEventListener("click", function () {
        if (cantidad > 1) {
            cantidad--;
            actualizarSubtotal();
        }
    });

    notas.addEventListener("input", function () {
        actualizarWhatsapp();
    });

    comprarCupo.addEventListener("click", function () {
        const numero = generarNumeroConfirmacion();

        confirmationNumber.textContent = numero;
        confirmationBox.classList.remove("hidden");

        guardarCupo(numero);

        alert("Compra realizada. Tu número de confirmación es: " + numero);
    });

    thumbs.forEach(function (thumb) {
        thumb.addEventListener("click", function () {
            thumbs.forEach(function (item) {
                item.classList.remove("active");
            });

            thumb.classList.add("active");
        });
    });

    actualizarSubtotal();
});