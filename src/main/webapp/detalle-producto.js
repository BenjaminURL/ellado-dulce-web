const form = document.getElementById("orderForm");
const btnRestar = document.getElementById("btnRestar");
const btnSumar = document.getElementById("btnSumar");
const cantidadTexto = document.getElementById("cantidad");
const subtotalPrice = document.getElementById("subtotalPrice");
const toppingCheckboxes = document.querySelectorAll(".topping-checkbox");

let cantidad = 1;
const precioBase = parseFloat(form.dataset.basePrice);

btnRestar.disabled = true;

function calcularToppings() {
    let totalToppings = 0;

    toppingCheckboxes.forEach(function (topping) {
        if (topping.checked) {
            totalToppings += parseFloat(topping.dataset.price);
        }
    });

    return totalToppings;
}

function actualizarPrecio() {
    const totalToppings = calcularToppings();
    const subtotal = (precioBase + totalToppings) * cantidad;

    subtotalPrice.textContent = "$" + subtotal.toFixed(2);
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

toppingCheckboxes.forEach(function (topping) {
    topping.addEventListener("change", function () {
        actualizarPrecio();
    });
});

actualizarPrecio();