const form = document.getElementById("orderForm");
const btnRestar = document.getElementById("btnRestar");
const btnSumar = document.getElementById("btnSumar");
const cantidadTexto = document.getElementById("cantidad");
const subtotalPrice = document.getElementById("subtotalPrice");
const toppingCheckboxes = document.querySelectorAll(".topping-checkbox");
const btnAgregarCarrito = document.getElementById("btnAgregarCarrito");

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

function agregarProductoAlCarrito() {
    const saborSeleccionado = document.querySelector('input[name="sabor"]:checked');
    const toppings = obtenerToppingsSeleccionados();

    const precioUnitario = precioBase + calcularToppings();

    const producto = {
        nombre: "Ice Cream Rolls",
        categoria: "Helados",
        precio: precioUnitario,
        cantidad: cantidad,
        imagen: "https://images.unsplash.com/photo-1563805042-7684c019e1cb?q=80&w=500&auto=format&fit=crop",
        sabor: saborSeleccionado ? saborSeleccionado.value : "No seleccionado",
        toppings: toppings.length > 0 ? toppings.join(", ") : "Sin toppings"
    };

    producto.clave = crearClaveProducto(producto);

    let carrito = JSON.parse(localStorage.getItem("carrito")) || [];

    const productoExistente = carrito.find(function (item) {
        const claveItem = item.clave || crearClaveProducto(item);
        return claveItem === producto.clave;
    });

    if (productoExistente) {
        productoExistente.cantidad += producto.cantidad;
    } else {
        carrito.push(producto);
    }

    localStorage.setItem("carrito", JSON.stringify(carrito));

    alert("Producto agregado al carrito");

    window.location.href = "pantalla-de-carrito.jsp";
}

if (btnAgregarCarrito) {
    btnAgregarCarrito.addEventListener("click", function () {
        agregarProductoAlCarrito();
    });
}

actualizarPrecio();