const form = document.getElementById("sundaeForm");
const btnRestar = document.getElementById("sundaeBtnRestar");
const btnSumar = document.getElementById("sundaeBtnSumar");
const cantidadTexto = document.getElementById("sundaeCantidad");
const subtotalTexto = document.getElementById("sundaeSubtotal");
const toppings = document.querySelectorAll(".sundae-topping");
const flavorCards = document.querySelectorAll(".flavor-card");
const notas = document.getElementById("sundaeNotas");
const whatsapp = document.getElementById("sundaeWhatsapp");

let cantidad = 1;
const precioBase = parseFloat(form.dataset.basePrice);

btnRestar.disabled = true;

function obtenerSaborSeleccionado() {
    const sabor = document.querySelector('input[name="sabor"]:checked');
    return sabor ? sabor.value : "Fresa";
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
    const sabor = obtenerSaborSeleccionado();
    const toppingsSeleccionados = obtenerToppingsSeleccionados();
    const subtotal = (precioBase + calcularToppings()) * cantidad;
    const notasTexto = notas.value.trim();

    let textoToppings = "Sin toppings adicionales";

    if (toppingsSeleccionados.length > 0) {
        textoToppings = toppingsSeleccionados.join(", ");
    }

    let mensaje =
        "Hola, quiero pedir un Sundae.%0A" +
        "Sabor: " + encodeURIComponent(sabor) + "%0A" +
        "Toppings: " + encodeURIComponent(textoToppings) + "%0A" +
        "Cantidad: " + cantidad + "%0A" +
        "Subtotal: $" + subtotal.toFixed(2);

    if (notasTexto !== "") {
        mensaje += "%0ANotas: " + encodeURIComponent(notasTexto);
    }

    whatsapp.href = "https://wa.me/5071234567?text=" + mensaje;
}

flavorCards.forEach(function (card) {
    card.addEventListener("click", function () {
        flavorCards.forEach(function (item) {
            item.classList.remove("selected");
        });

        card.classList.add("selected");

        const input = card.querySelector("input");
        input.checked = true;

        actualizarWhatsapp();
    });
});

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