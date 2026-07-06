const cartItems = document.getElementById("cartItems");
const emptyCartMessage = document.getElementById("emptyCartMessage");
const clearCartBtn = document.getElementById("clearCartBtn");
const checkoutBtn = document.getElementById("checkoutBtn");

const subtotalAmount = document.getElementById("subtotalAmount");
const itbmsAmount = document.getElementById("itbmsAmount");
const totalAmount = document.getElementById("totalAmount");

const usarPuntosCheck = document.getElementById("usarPuntosCheck");
const pointsDiscountLine = document.getElementById("pointsDiscountLine");
const pointsDiscountAmount = document.getElementById("pointsDiscountAmount");

const ITBMS = 0.07;

function obtenerClaveCarrito() {
    if (typeof idClienteActual === "undefined" || !idClienteActual) {
        return "carrito";
    }

    return "carrito_cliente_" + idClienteActual;
}

function cargarCarrito() {
    const claveCarrito = obtenerClaveCarrito();
    return JSON.parse(localStorage.getItem(claveCarrito)) || [];
}

function guardarCarrito(carrito) {
    const claveCarrito = obtenerClaveCarrito();
    localStorage.setItem(claveCarrito, JSON.stringify(carrito));
}

function formatoDinero(valor) {
    return "$" + Number(valor).toFixed(2);
}

function normalizarNumero(valor, defecto) {
    const numero = Number(valor);

    if (isNaN(numero)) {
        return defecto;
    }

    return numero;
}

function calcularSubtotal(carrito) {
    let subtotal = 0;

    carrito.forEach(function (producto) {
        const precio = normalizarNumero(producto.precio, 0);
        const cantidad = normalizarNumero(producto.cantidad, 1);

        subtotal += precio * cantidad;
    });

    return subtotal;
}

function calcularDescuentoPuntos(subtotal) {
    if (!usarPuntosCheck || !usarPuntosCheck.checked) {
        return 0;
    }

    const puntos = typeof puntosClienteActual !== "undefined" ? Number(puntosClienteActual) : 0;
    const descuentoDisponible = puntos / 10;

    if (descuentoDisponible > subtotal) {
        return subtotal;
    }

    return descuentoDisponible;
}

function actualizarResumen() {
    const carrito = cargarCarrito();

    const subtotal = calcularSubtotal(carrito);
    const itbms = subtotal * ITBMS;
    const descuentoPuntos = calcularDescuentoPuntos(subtotal);
    const total = subtotal + itbms - descuentoPuntos;

    subtotalAmount.textContent = formatoDinero(subtotal);
    itbmsAmount.textContent = formatoDinero(itbms);
    pointsDiscountAmount.textContent = "-" + formatoDinero(descuentoPuntos);
    totalAmount.textContent = formatoDinero(total < 0 ? 0 : total);

    if (descuentoPuntos > 0) {
        pointsDiscountLine.classList.remove("hidden");
    } else {
        pointsDiscountLine.classList.add("hidden");
    }

    checkoutBtn.disabled = carrito.length === 0;

    if (carrito.length === 0) {
        checkoutBtn.classList.add("disabled-checkout");
    } else {
        checkoutBtn.classList.remove("disabled-checkout");
    }
}

function renderizarCarrito() {
    const carrito = cargarCarrito();

    cartItems.innerHTML = "";

    if (carrito.length === 0) {
        emptyCartMessage.classList.remove("hidden");
        actualizarResumen();
        return;
    }

    emptyCartMessage.classList.add("hidden");

    carrito.forEach(function (producto, index) {
        const nombre = producto.nombre || "Producto";
        const precio = normalizarNumero(producto.precio, 0);
        const cantidad = normalizarNumero(producto.cantidad, 1);
        const imagen = producto.imagen || "imagenes/logo2019.png";
        const sabor = producto.sabor || "";
        const toppings = producto.toppings || "";
        const notas = producto.notas || "";

        const totalProducto = precio * cantidad;

        const item = document.createElement("article");
        item.className = "cart-item";

        item.innerHTML = `
            <div class="item-img-placeholder">
                <img src="${imagen}" alt="${nombre}">
            </div>

            <div class="item-details">
                <h3>${nombre}</h3>

                ${sabor && sabor !== "No seleccionado" ? `<p class="item-meta">Sabor: ${sabor}</p>` : ""}
                ${toppings && toppings !== "Sin toppings" ? `<p class="item-meta">Toppings: ${toppings}</p>` : ""}
                ${notas ? `<p class="item-meta">Notas: ${notas}</p>` : ""}

                <p class="item-unit-price">${formatoDinero(precio)}</p>
            </div>

            <div class="item-quantity">
                <button type="button" class="qty-btn btn-restar" data-index="${index}">-</button>
                <input type="text" value="${cantidad}" readonly>
                <button type="button" class="qty-btn btn-sumar" data-index="${index}">+</button>
            </div>

            <strong class="item-total">${formatoDinero(totalProducto)}</strong>

            <button type="button" class="item-remove" data-index="${index}">×</button>
        `;

        cartItems.appendChild(item);
    });

    actualizarResumen();
}

function sumarCantidad(index) {
    const carrito = cargarCarrito();

    carrito[index].cantidad = normalizarNumero(carrito[index].cantidad, 1) + 1;

    guardarCarrito(carrito);
    renderizarCarrito();
}

function restarCantidad(index) {
    const carrito = cargarCarrito();

    const cantidadActual = normalizarNumero(carrito[index].cantidad, 1);

    if (cantidadActual > 1) {
        carrito[index].cantidad = cantidadActual - 1;
    }

    guardarCarrito(carrito);
    renderizarCarrito();
}

function eliminarProducto(index) {
    const carrito = cargarCarrito();

    carrito.splice(index, 1);

    guardarCarrito(carrito);
    renderizarCarrito();
}

function vaciarCarrito() {
    const claveCarrito = obtenerClaveCarrito();

    localStorage.removeItem(claveCarrito);
    renderizarCarrito();
}

function agregarCampo(form, nombre, valor) {
    const input = document.createElement("input");
    input.type = "hidden";
    input.name = nombre;
    input.value = valor;
    form.appendChild(input);
}

function enviarPedidoAPago() {
    const carrito = cargarCarrito();

    if (carrito.length === 0) {
        alert("Tu carrito está vacío.");
        return;
    }

    const form = document.createElement("form");
    form.method = "post";
    form.action = "confirmarPedido.jsp";

    carrito.forEach(function (producto) {
        agregarCampo(form, "nombreProducto", producto.nombre || "Producto");
        agregarCampo(form, "precioProducto", normalizarNumero(producto.precio, 0));
        agregarCampo(form, "cantidadProducto", normalizarNumero(producto.cantidad, 1));
        agregarCampo(form, "saborProducto", producto.sabor || "");
        agregarCampo(form, "toppingsProducto", producto.toppings || "");
        agregarCampo(form, "notasProducto", producto.notas || "");
    });

    agregarCampo(form, "metodoPago", "Tarjeta simulada");

    agregarCampo(
        form,
        "usarPuntos",
        usarPuntosCheck && usarPuntosCheck.checked ? "si" : "no"
    );

    document.body.appendChild(form);
    form.submit();
}

cartItems.addEventListener("click", function (event) {
    const boton = event.target;

    if (boton.classList.contains("btn-sumar")) {
        sumarCantidad(Number(boton.dataset.index));
    }

    if (boton.classList.contains("btn-restar")) {
        restarCantidad(Number(boton.dataset.index));
    }

    if (boton.classList.contains("item-remove")) {
        eliminarProducto(Number(boton.dataset.index));
    }
});

clearCartBtn.addEventListener("click", function () {
    vaciarCarrito();
});

checkoutBtn.addEventListener("click", function () {
    enviarPedidoAPago();
});

if (usarPuntosCheck) {
    usarPuntosCheck.addEventListener("change", function () {
        actualizarResumen();
    });
}

renderizarCarrito();