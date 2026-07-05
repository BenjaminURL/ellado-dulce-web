document.addEventListener("DOMContentLoaded", function () {
    const cartItems = document.getElementById("cartItems");

    const cartSubtotal = document.getElementById("cartSubtotal");
    const cartTax = document.getElementById("cartTax");
    const cartTotal = document.getElementById("cartTotal");
    const cartCount = document.querySelector(".cart-count");
    const checkoutBtn = document.getElementById("checkoutBtn");

    const carrito = JSON.parse(localStorage.getItem("carrito")) || [];

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
        const categoria = producto.categoria || "Sin categoría";
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
                <p class="item-meta">Categoría: ${categoria}</p>
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
    }
});

function guardarCarrito(carrito) {
    localStorage.setItem("carrito", JSON.stringify(carrito));
}

function sumarCantidad(index) {
    const carrito = JSON.parse(localStorage.getItem("carrito")) || [];

    carrito[index].cantidad++;

    guardarCarrito(carrito);
    location.reload();
}

function restarCantidad(index) {
    const carrito = JSON.parse(localStorage.getItem("carrito")) || [];

    if (carrito[index].cantidad > 1) {
        carrito[index].cantidad--;
    }

    guardarCarrito(carrito);
    location.reload();
}

function eliminarProducto(index) {
    const carrito = JSON.parse(localStorage.getItem("carrito")) || [];

    carrito.splice(index, 1);

    guardarCarrito(carrito);
    location.reload();
}