document.addEventListener("DOMContentLoaded", function () {
    const precioBase = 3.95;
    const telefonoWhatsApp = "5076251592";
    const nombreProducto = "Frappe Mocca"

    let cantidad = 1;
    let cantidadCarrito = 0;

    const cantidadTexto = document.getElementById("cantidad");
    const btnRestar = document.getElementById("btn-restar");
    const btnSumar = document.getElementById("btn-sumar");
    const subtotalTexto = document.getElementById("subtotal");
    const notas = document.getElementById("notas");
    const btnCarrito = document.getElementById("btn-carrito");
    const btnWhatsApp = document.getElementById("btn-whatsapp");
    const contadorCarrito = document.getElementById("contador-carrito");

    /* SELECCIONAR OPCIONES */
    document.querySelectorAll(".opcion").forEach(function (boton) {
        boton.addEventListener("click", function () {
            const grupo = boton.closest(".opciones-grid");

            grupo.querySelectorAll(".opcion").forEach(function (opcion) {
                opcion.classList.remove("activa");
            });

            boton.classList.add("activa");
            actualizarSubtotal();
        });
    });

    /* EXTRAS */
    document.querySelectorAll(".extra input").forEach(function (extra) {
        extra.addEventListener("change", function () {
            actualizarSubtotal();
        });
    });

    /* SUMAR */
    btnSumar.addEventListener("click", function () {
        cantidad = cantidad + 1;
        actualizarSubtotal();
    });

    /* RESTAR */
    btnRestar.addEventListener("click", function () {
        if (cantidad > 1) {
            cantidad = cantidad - 1;
            actualizarSubtotal();
        }
    });

    /* NOTAS */
    notas.addEventListener("input", function () {
        actualizarSubtotal();
    });

    /* AGREGAR AL CARRITO */
    btnCarrito.addEventListener("click", function () {
        cantidadCarrito = cantidadCarrito + cantidad;
        contadorCarrito.textContent = cantidadCarrito;

        btnCarrito.textContent = "Agregado al carrito ✓";

        setTimeout(function () {
            btnCarrito.textContent = "Agregar al carrito";
        }, 1500);
    });

    /* WHATSAPP */
    btnWhatsApp.addEventListener("click", function (evento) {
        evento.preventDefault();

        const enlace = crearMensajeWhatsApp();
        window.open(enlace, "_blank");
    });

    function obtenerPrecioOpciones() {
        let totalOpciones = 0;

        document.querySelectorAll(".opcion.activa").forEach(function (opcion) {
            totalOpciones = totalOpciones + Number(opcion.dataset.precio);
        });

        return totalOpciones;
    }

    function obtenerPrecioExtras() {
        let totalExtras = 0;

        document.querySelectorAll(".extra input:checked").forEach(function (extra) {
            totalExtras = totalExtras + Number(extra.dataset.precio);
        });

        return totalExtras;
    }

    function actualizarSubtotal() {
        const totalUnitario = precioBase + obtenerPrecioOpciones() + obtenerPrecioExtras();
        const subtotal = totalUnitario * cantidad;

        cantidadTexto.textContent = cantidad;
        subtotalTexto.textContent = "$" + subtotal.toFixed(2);

        btnRestar.disabled = cantidad === 1;
    }

    function obtenerTextoOpciones() {
        const opciones = [];

        document.querySelectorAll(".opcion.activa").forEach(function (opcion) {
            const grupo = opcion.closest(".opciones-grid").dataset.grupo;
            opciones.push(grupo + ": " + opcion.dataset.valor);
        });

        if (opciones.length === 0) {
            return "Sin opciones seleccionadas";
        }

        return opciones.join("\n");
    }

    function obtenerTextoExtras() {
        const extras = [];

        document.querySelectorAll(".extra input:checked").forEach(function (extra) {
            extras.push(extra.value + " (+$" + Number(extra.dataset.precio).toFixed(2) + ")");
        });

        if (extras.length === 0) {
            return "Sin extras";
        }

        return extras.join("\n");
    }

    function crearMensajeWhatsApp() {
        const totalUnitario = precioBase + obtenerPrecioOpciones() + obtenerPrecioExtras();
        const subtotal = totalUnitario * cantidad;

        const textoNotas = notas.value.trim() === "" ? "Sin notas especiales" : notas.value.trim();

        const mensaje =
`Hola, quiero hacer un pedido en Ellado Dulce.

Producto: ${nombreProducto}
Precio base: $${precioBase.toFixed(2)}

Opciones:
${obtenerTextoOpciones()}

Extras:
${obtenerTextoExtras()}

Cantidad: ${cantidad}
Notas: ${textoNotas}

Subtotal: $${subtotal.toFixed(2)}`;

        return "https://wa.me/" + telefonoWhatsApp + "?text=" + encodeURIComponent(mensaje);
    }

    actualizarSubtotal();
});