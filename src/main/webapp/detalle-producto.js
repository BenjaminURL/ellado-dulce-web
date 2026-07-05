const form = document.getElementById("orderForm");

const nombreProducto = form.dataset.nombre;
const categoriaProducto = form.dataset.categoria;
const imagenProducto = form.dataset.imagen;
const saborBaseProducto = form.dataset.sabor || "";

const notasEspecificas = document.getElementById("notasEspecificas");
const btnRestar = document.getElementById("btnRestar");
const btnSumar = document.getElementById("btnSumar");
const cantidadTexto = document.getElementById("cantidad");
const subtotalPrice = document.getElementById("subtotalPrice");
const toppingCheckboxes = document.querySelectorAll(".topping-checkbox");
const btnAgregarCarrito = document.getElementById("btnAgregarCarrito");
const flavorRadios = document.querySelectorAll('input[name="sabor"]');

let cantidad = 1;
const precioBase = parseFloat(form.dataset.basePrice);

btnRestar.disabled = true;

flavorRadios.forEach(function (radio) {
    radio.addEventListener("change", function () {
        document.querySelectorAll(".flavor-card").forEach(function (card) {
            card.classList.remove("selected");
        });

        const tarjeta = radio.closest(".flavor-card");

        if (tarjeta) {
            tarjeta.classList.add("selected");
        }
    });
});

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

function obtenerToppingsSeleccionados() {
    let toppings = [];

    toppingCheckboxes.forEach(function (topping) {
        if (topping.checked) {
            toppings.push(topping.value);
        }
    });

    return toppings;
}

function normalizarTexto(texto) {
    return (texto || "").toString().trim().toLowerCase();
}

function crearClaveProducto(producto) {
    return [
        normalizarTexto(producto.nombre),
        normalizarTexto(producto.categoria),
        normalizarTexto(producto.sabor),
        normalizarTexto(producto.toppings)
    ].join("|");
}

function obtenerClaveCarrito() {
    if (typeof clienteLogueado === "undefined" || typeof idClienteActual === "undefined") {
        window.location.href = "login.jsp";
        return null;
    }

    if (!clienteLogueado || !idClienteActual) {
        window.location.href = "login.jsp";
        return null;
    }

    return "carrito_cliente_" + idClienteActual;
}

function agregarProductoAlCarrito() {
    const saborSeleccionado = document.querySelector('input[name="sabor"]:checked');
    const toppings = obtenerToppingsSeleccionados();

    const precioUnitario = precioBase + calcularToppings();

    const producto = {
        nombre: nombreProducto,
        categoria: categoriaProducto,
        precio: precioUnitario,
        cantidad: cantidad,
        imagen: imagenProducto,
        sabor: saborSeleccionado ? saborSeleccionado.value : saborBaseProducto,
        toppings: toppings.length > 0 ? toppings.join(", ") : "",
        notas: notasEspecificas ? notasEspecificas.value.trim() : ""
    };

    producto.clave = crearClaveProducto(producto);

    const claveCarrito = obtenerClaveCarrito();

    if (claveCarrito === null) {
        return;
    }

    let carrito = JSON.parse(localStorage.getItem(claveCarrito)) || [];

    const productoExistente = carrito.find(function (item) {
        const claveItem = item.clave || crearClaveProducto(item);
        return claveItem === producto.clave;
    });

    if (productoExistente) {
        productoExistente.cantidad += producto.cantidad;
    } else {
        carrito.push(producto);
    }

    localStorage.setItem(claveCarrito, JSON.stringify(carrito));

    alert("Producto agregado al carrito");

    window.location.href = "pantalla-de-carrito.jsp";
}

if (btnAgregarCarrito) {
    btnAgregarCarrito.addEventListener("click", function () {
        agregarProductoAlCarrito();
    });
}

actualizarPrecio();