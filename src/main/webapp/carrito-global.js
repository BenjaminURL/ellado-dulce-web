function agregarAlCarrito(nombre, categoria, precio, imagen) {
    const carrito = JSON.parse(localStorage.getItem("carrito")) || [];

    const productoExistente = carrito.find(function (producto) {
        return producto.nombre === nombre;
    });

    if (productoExistente) {
        productoExistente.cantidad += 1;
    } else {
        carrito.push({
            nombre: nombre,
            categoria: categoria,
            precio: Number(precio),
            imagen: imagen,
            cantidad: 1
        });
    }

    localStorage.setItem("carrito", JSON.stringify(carrito));

    alert("Producto agregado al carrito");
    actualizarContadorCarrito();
}

function actualizarContadorCarrito() {
    const carrito = JSON.parse(localStorage.getItem("carrito")) || [];
    const contador = document.querySelector(".cart-count");

    let cantidadTotal = 0;

    carrito.forEach(function (producto) {
        cantidadTotal += Number(producto.cantidad) || 0;
    });

    if (contador) {
        contador.textContent = cantidadTotal;
    }
}

document.addEventListener("DOMContentLoaded", function () {
    actualizarContadorCarrito();
});