const form = document.getElementById("frozenYogurtForm");
const btnRestar = document.getElementById("frozenBtnRestar");
const btnSumar = document.getElementById("frozenBtnSumar");
const cantidadTexto = document.getElementById("frozenCantidad");
const subtotalTexto = document.getElementById("frozenSubtotal");
const toppings = document.querySelectorAll(".frozen-topping");
const notas = document.getElementById("frozenNotas");
const whatsapp = document.getElementById("frozenWhatsapp");

let cantidad = 1;
const precioBase = parseFloat(form.dataset.basePrice);

btnRestar.disabled = true;

function obtenerBaseSeleccionada() {
    return "Natural";
}

function calcularToppings() {
    let total = 0;

    toppings.forEach(function (topping) {
        if (topping.checked) {
            total += parseFloat(topping.dataset.price);
        }
    });

    return total;
}

function obtenerToppingsSeleccionados() {
    const seleccionados = [];

    toppings.forEach(function (topping) {
        if (topping.checked) {
            seleccionados.push(topping.value);
        }
    });

    return seleccionados;
}

function actualizarPrecio() {
    const totalToppings = calcularToppings();
    const subtotal = (precioBase + totalToppings) * cantidad;

    subtotalTexto.textContent = "$" + subtotal.toFixed(2);

    actualizarWhatsapp();
}

function actualizarWhatsapp() {
    const base = obtenerBaseSeleccionada();
    const toppingsSeleccionados = obtenerToppingsSeleccionados();
    const subtotal = (precioBase + calcularToppings()) * cantidad;
    const notasTexto = notas.value.trim();

    let textoToppings = "Sin frutas adicionales";

    if (toppingsSeleccionados.length > 0) {
        textoToppings = toppingsSeleccionados.join(", ");
    }

    let mensaje =
        "Hola, quiero pedir un Frozen Yogurt.%0A" +
        "Base: " + encodeURIComponent(base) + "%0A" +
        "Frutas: " + encodeURIComponent(textoToppings) + "%0A" +
        "Cantidad: " + cantidad + "%0A" +
        "Subtotal: $" + subtotal.toFixed(2);

    if (notasTexto !== "") {
        mensaje += "%0ANotas: " + encodeURIComponent(notasTexto);
    }

    whatsapp.href = "https://wa.me/5071234567?text=" + mensaje;
}

toppings.forEach(function (topping) {
    topping.addEventListener("change", function () {
        actualizarPrecio();
    });
});

btnSumar.addEventListener("click", function () {
    cantidad++;
    cantidadTexto.textContent = cantidad;

    if (cantidad > 1) {
        btnRestar.disabled = false;
    }

    actualizarPrecio();
});

btnRestar.addEventListener("click", function () {
    if (cantidad > 1) {
        cantidad--;
        cantidadTexto.textContent = cantidad;
    }

    if (cantidad === 1) {
        btnRestar.disabled = true;
    }

    actualizarPrecio();
});

notas.addEventListener("input", function () {
    actualizarWhatsapp();
});

actualizarPrecio();