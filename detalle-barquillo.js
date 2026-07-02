const form = document.getElementById("barquilloForm");
const btnRestar = document.getElementById("barquilloBtnRestar");
const btnSumar = document.getElementById("barquilloBtnSumar");
const cantidadTexto = document.getElementById("barquilloCantidad");
const subtotalTexto = document.getElementById("barquilloSubtotal");
const notas = document.getElementById("barquilloNotas");
const whatsapp = document.getElementById("barquilloWhatsapp");

let cantidad = 1;
const precioBase = parseFloat(form.dataset.basePrice);

btnRestar.disabled = true;

function actualizarPrecio() {
    const subtotal = precioBase * cantidad;

    subtotalTexto.textContent = "$" + subtotal.toFixed(2);

    actualizarWhatsapp();
}

function actualizarWhatsapp() {
    const subtotal = precioBase * cantidad;
    const notasTexto = notas.value.trim();

    let mensaje =
        "Hola, quiero pedir un Barquillo de Vainilla.%0A" +
        "Producto: Barquillo normal de vainilla%0A" +
        "Cantidad: " + cantidad + "%0A" +
        "Subtotal: $" + subtotal.toFixed(2);

    if (notasTexto !== "") {
        mensaje += "%0ANotas: " + encodeURIComponent(notasTexto);
    }

    whatsapp.href = "https://wa.me/5071234567?text=" + mensaje;
}

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