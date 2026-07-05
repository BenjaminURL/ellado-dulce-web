function obtenerClaveCarrito() {
    return "carrito_cliente_" + idClienteActual;
}

document.addEventListener("DOMContentLoaded", function () {
    const cartItems = document.getElementById("cartItems");

    const cartSubtotal = document.getElementById("cartSubtotal");
    const cartTax = document.getElementById("cartTax");
    const cartTotal = document.getElementById("cartTotal");
    const cartCount = document.querySelector(".cart-count");
    const checkoutBtn = document.getElementById("checkoutBtn");

    const carrito = JSON.parse(localStorage.getItem(obtenerClaveCarrito())) || [];

    if (carrito.length === 0) {
        cartItems.innerHTML = `
            <div class="empty-cart-inline">
                <h2>Sin productos</h2>
                <p>Aún no has agregado productos al carrito.</p>
                <a href="Boquitas.jsp">Ver productos</a>
            </div>
        `;

        cartSubtotal.textContent = "$0.00";
        cartTax.textContent = "$0.00";
        cartTotal.textContent = "$0.00";

        if (cartCount) {
            cartCount.textContent = "0";
        }

        if (checkoutBtn) {
            checkoutBtn.classList.add("disabled-checkout");
        }

        return;
    }

    cartItems.innerHTML = "";

    let subtotal = 0;
    let cantidadTotal = 0;

    carrito.forEach(function (producto, index) {
        const nombre = producto.nombre || "Producto";
        const precio = Number(producto.precio) || 0;
        const cantidad = Number(producto.cantidad) || 1;
        const imagen = producto.imagen || "";

        const totalProducto = precio * cantidad;

        subtotal += totalProducto;
        cantidadTotal += cantidad;

        const item = document.createElement("div");
        item.classList.add("cart-item");

        item.innerHTML = `
            <div class="item-img-placeholder">
                ${imagen ? `<img src="${imagen}" alt="${nombre}">` : ""}
            </div>

            <div class="item-details">
                <h3>${nombre}</h3>
                ${producto.sabor && producto.sabor !== "No seleccionado" ? `<p class="item-meta">Sabor: ${producto.sabor}</p>` : ""}
                ${producto.toppings && producto.toppings !== "Sin toppings" ? `<p class="item-meta">Toppings: ${producto.toppings}</p>` : ""}
                <span class="item-unit-price">$${precio.toFixed(2)}</span>
            </div>

            <div class="item-quantity">
                <button class="qty-btn" onclick="restarCantidad(${index})">-</button>
                <input type="number" value="${cantidad}" readonly>
                <button class="qty-btn" onclick="sumarCantidad(${index})">+</button>
            </div>

            <div class="item-total">$${totalProducto.toFixed(2)}</div>

            <button class="item-remove" onclick="eliminarProducto(${index})">×</button>
        `;

        cartItems.appendChild(item);
    });

    const itbms = subtotal * 0.07;
    const total = subtotal + itbms;

    cartSubtotal.textContent = "$" + subtotal.toFixed(2);
    cartTax.textContent = "$" + itbms.toFixed(2);
    cartTotal.textContent = "$" + total.toFixed(2);

    if (cartCount) {
        cartCount.textContent = cantidadTotal;
    }

    if (checkoutBtn) {
        checkoutBtn.classList.remove("disabled-checkout");

        checkoutBtn.addEventListener("click", function (event) {
            event.preventDefault();
            enviarPedidoAPago(carrito, subtotal, itbms, total);
        });
    }
});

function enviarPedidoAPago(carrito, subtotal, itbms, total) {
    if (!carrito || carrito.length === 0) {
        alert("El carrito está vacío.");
        return;
    }

    const form = document.createElement("form");
    form.method = "post";
    form.action = "pago.jsp";

    carrito.forEach(function (producto) {
        agregarCampo(form, "nombreProducto", producto.nombre || "Producto");
        agregarCampo(form, "categoriaProducto", producto.categoria || "Sin categoría");
        agregarCampo(form, "precioProducto", Number(producto.precio) || 0);
        agregarCampo(form, "cantidadProducto", Number(producto.cantidad) || 1);
        agregarCampo(form, "saborProducto", producto.sabor || "");
        agregarCampo(form, "toppingsProducto", producto.toppings || "");
        agregarCampo(form, "notasProducto", producto.notas || "");
    });

    agregarCampo(form, "subtotal", subtotal.toFixed(2));
    agregarCampo(form, "itbms", itbms.toFixed(2));
    agregarCampo(form, "total", total.toFixed(2));

    document.body.appendChild(form);
    form.submit();
}

function agregarCampo(form, nombre, valor) {
    const input = document.createElement("input");
    input.type = "hidden";
    input.name = nombre;
    input.value = valor;
    form.appendChild(input);
}

function guardarCarrito(carrito) {
    localStorage.setItem(obtenerClaveCarrito(), JSON.stringify(carrito));
}

function sumarCantidad(index) {
    const carrito = JSON.parse(localStorage.getItem(obtenerClaveCarrito())) || [];

    carrito[index].cantidad++;

    guardarCarrito(carrito);
    location.reload();
}

function restarCantidad(index) {
    const carrito = JSON.parse(localStorage.getItem(obtenerClaveCarrito())) || [];

    if (carrito[index].cantidad > 1) {
        carrito[index].cantidad--;
    }

    guardarCarrito(carrito);
    location.reload();
}

function eliminarProducto(index) {
    const carrito = JSON.parse(localStorage.getItem(obtenerClaveCarrito())) || [];

    carrito.splice(index, 1);

    guardarCarrito(carrito);
    location.reload();
}