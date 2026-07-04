document.addEventListener("DOMContentLoaded", function () {
    const registros = [
        {
            id: 1,
            tipo: "Pedido",
            cliente: "María Alejandra González",
            cedula: "8-987-654",
            celular: "+507 6543 2100",
            correo: "maria@example.com",
            fecha: "14/05/2025 10:30 a.m.",
            estado: "Entregado"
        },
        {
            id: 2,
            tipo: "Actividad",
            cliente: "María Isabel Torres",
            cedula: "8-765-432",
            celular: "+507 6123 4567",
            correo: "maria.torres@gmail.com",
            fecha: "14/05/2025 10:00 a.m.",
            estado: "Confirmado"
        },
        {
            id: 3,
            tipo: "Reserva",
            cliente: "Carlos y Laura Sánchez",
            cedula: "8-654-321",
            celular: "+507 6678 9123",
            correo: "carlos.sanchez@mail.com",
            fecha: "14/05/2025 03:00 p.m.",
            estado: "Confirmado"
        },
        {
            id: 4,
            tipo: "Pedido",
            cliente: "Luis Carlos Ramírez",
            cedula: "8-543-210",
            celular: "+507 6890 1234",
            correo: "luis.ramirez@gmail.com",
            fecha: "13/05/2025 09:15 a.m.",
            estado: "Pendiente"
        },
        {
            id: 5,
            tipo: "Actividad",
            cliente: "Daniela Morales",
            cedula: "8-432-109",
            celular: "+507 6555 7788",
            correo: "daniela.morales@mail.com",
            fecha: "13/05/2025 02:00 p.m.",
            estado: "Confirmado"
        },
        {
            id: 6,
            tipo: "Reserva",
            cliente: "Miguel Herrera",
            cedula: "8-321-098",
            celular: "+507 6789 5432",
            correo: "miguel.herrera@mail.com",
            fecha: "12/05/2025 04:00 p.m.",
            estado: "Confirmado"
        },
        {
            id: 7,
            tipo: "Pedido",
            cliente: "Sofía Martínez",
            cedula: "8-210-987",
            celular: "+507 6321 9876",
            correo: "sofia.m@correo.com",
            fecha: "12/05/2025 11:00 a.m.",
            estado: "En proceso"
        },
        {
            id: 8,
            tipo: "Actividad",
            cliente: "Andrés Castillo",
            cedula: "8-109-876",
            celular: "+507 6987 5544",
            correo: "andres.c@mail.com",
            fecha: "11/05/2025 03:30 p.m.",
            estado: "Pendiente"
        },
        {
            id: 9,
            tipo: "Pedido",
            cliente: "Valeria Núñez",
            cedula: "8-098-765",
            celular: "+507 6114 2233",
            correo: "valeria.nunez@gmail.com",
            fecha: "11/05/2025 06:10 p.m.",
            estado: "Listo"
        }
    ];

    const buscarPor = document.getElementById("buscarPor");
    const busquedaCliente = document.getElementById("busquedaCliente");
    const buscarRegistro = document.getElementById("buscarRegistro");
    const estadoRegistro = document.getElementById("estadoRegistro");
    const btnBuscar = document.getElementById("btnBuscar");
    const btnLimpiar = document.getElementById("btnLimpiar");

    const tablaRegistros = document.getElementById("tablaRegistros");
    const contadorRegistros = document.getElementById("contadorRegistros");
    const textoCantidad = document.getElementById("textoCantidad");

    const btnPaginaAnterior = document.getElementById("btnPaginaAnterior");
    const btnPaginaSiguiente = document.getElementById("btnPaginaSiguiente");
    const paginaActualTexto = document.getElementById("paginaActual");
    
    let paginaActual = 1;
    const registrosPorPagina = 9;
    let listaActual = [];


    function normalizarTexto(texto) {
        return texto.toString().trim().toLowerCase();
    }

    function claseTipo(tipo) {
        const tipoNormalizado = normalizarTexto(tipo);

        if (tipoNormalizado === "pedido") {
            return "type-pedido";
        }

        if (tipoNormalizado === "actividad") {
            return "type-actividad";
        }

        if (tipoNormalizado === "reserva") {
            return "type-reserva";
        }

        return "";
    }

    function iconoTipo(tipo) {
        const tipoNormalizado = normalizarTexto(tipo);

        if (tipoNormalizado === "pedido") {
            return "🛍";
        }

        if (tipoNormalizado === "actividad") {
            return "👥";
        }

        if (tipoNormalizado === "reserva") {
            return "📅";
        }

        return "•";
    }

    function claseEstado(estado) {
        const estadoNormalizado = normalizarTexto(estado).replace(" ", "-");

        if (estadoNormalizado === "en-proceso") {
            return "status-en-proceso";
        }

        if (estadoNormalizado === "pendiente") {
            return "status-pendiente";
        }

        if (estadoNormalizado === "listo") {
            return "status-listo";
        }

        if (estadoNormalizado === "entregado") {
            return "status-entregado";
        }

        if (estadoNormalizado === "confirmado") {
            return "status-confirmado";
        }

        return "status-pendiente";
    }

    function obtenerValorBusqueda(registro, filtro) {
        if (filtro === "cedula") {
            return registro.cedula;
        }

        if (filtro === "nombre") {
            return registro.cliente;
        }

        if (filtro === "celular") {
            return registro.celular;
        }

        if (filtro === "correo") {
            return registro.correo;
        }

        return registro.cliente + " " + registro.cedula + " " + registro.celular + " " + registro.correo;
    }

    function filtrarRegistros() {
        const filtroCliente = buscarPor.value;
        const textoBusqueda = normalizarTexto(busquedaCliente.value);
        const filtroRegistro = buscarRegistro.value;
        const filtroEstado = estadoRegistro.value;

        return registros.filter(function (registro) {
            const textoBase = normalizarTexto(obtenerValorBusqueda(registro, filtroCliente));
            const coincideCliente = textoBusqueda === "" || textoBase.includes(textoBusqueda);

            const coincideTipo =
                filtroRegistro === "todo" ||
                normalizarTexto(registro.tipo) === filtroRegistro;

            const coincideEstado =
                filtroEstado === "todo" ||
                normalizarTexto(registro.estado) === filtroEstado;

            return coincideCliente && coincideTipo && coincideEstado;
        });
    }

    function crearCeldaEstado(registro) {
        const badge = `
            <span class="status-badge ${claseEstado(registro.estado)}">
                ${registro.estado}
            </span>
        `;

        if (registro.tipo !== "Pedido") {
            return badge;
        }

        return `
            <div class="pedido-status">
                ${badge}

                <select class="status-select" data-id="${registro.id}">
                    <option value="Pendiente" ${registro.estado === "Pendiente" ? "selected" : ""}>Pendiente</option>
                    <option value="En proceso" ${registro.estado === "En proceso" ? "selected" : ""}>En proceso</option>
                    <option value="Listo" ${registro.estado === "Listo" ? "selected" : ""}>Listo</option>
                    <option value="Entregado" ${registro.estado === "Entregado" ? "selected" : ""}>Entregado</option>
                </select>
            </div>
        `;
    }

    function mostrarRegistros(lista) {
    tablaRegistros.innerHTML = "";
    listaActual = lista;

    contadorRegistros.textContent = "(" + lista.length + ")";

    if (lista.length === 0) {
        tablaRegistros.innerHTML = `
            <tr>
                <td colspan="8">
                    <div class="sin-informacion">
                        <strong>Sin información</strong>
                        <p>Este cliente no tiene pedidos, actividades ni reservas registradas.</p>
                    </div>
                </td>
            </tr>
        `;

        textoCantidad.textContent = "No hay registros para mostrar";
        paginaActualTexto.textContent = "1";
        btnPaginaAnterior.disabled = true;
        btnPaginaSiguiente.disabled = true;

        return;
    }

    const totalPaginas = Math.ceil(lista.length / registrosPorPagina);

    if (paginaActual > totalPaginas) {
        paginaActual = totalPaginas;
    }

    const inicio = (paginaActual - 1) * registrosPorPagina;
    const fin = inicio + registrosPorPagina;
    const registrosPagina = lista.slice(inicio, fin);

    registrosPagina.forEach(function (registro) {
        const fila = document.createElement("tr");

        fila.innerHTML = `
            <td>
                <span class="type-pill ${claseTipo(registro.tipo)}">
                    ${iconoTipo(registro.tipo)} ${registro.tipo}
                </span>
            </td>

            <td>${registro.cliente}</td>
            <td>${registro.cedula}</td>
            <td>${registro.celular}</td>
            <td>${registro.correo}</td>
            <td>${registro.fecha}</td>

            <td>
                ${crearCeldaEstado(registro)}
            </td>

            <td>
                <a href="#" class="action-btn">Ver detalle</a>
            </td>
        `;

        tablaRegistros.appendChild(fila);
    });

    const registroInicio = inicio + 1;
    const registroFin = Math.min(fin, lista.length);

    textoCantidad.textContent = "Mostrando " + registroInicio + " a " + registroFin + " de " + lista.length + " registros";
    paginaActualTexto.textContent = paginaActual;

    btnPaginaAnterior.disabled = paginaActual === 1;
    btnPaginaSiguiente.disabled = paginaActual === totalPaginas;

    activarCambioEstadoPedidos();
}

    function activarCambioEstadoPedidos() {
        const selectsEstado = document.querySelectorAll(".status-select");

        selectsEstado.forEach(function (select) {
            select.addEventListener("change", function () {
                const idRegistro = Number(select.dataset.id);
                const nuevoEstado = select.value;

                const registro = registros.find(function (item) {
                    return item.id === idRegistro;
                });

                if (registro && registro.tipo === "Pedido") {
                    registro.estado = nuevoEstado;
                    aplicarFiltros();
                }
            });
        });
    }

    function aplicarFiltros() {
    paginaActual = 1;
    const listaFiltrada = filtrarRegistros();
    mostrarRegistros(listaFiltrada);
}

    btnBuscar.addEventListener("click", function () {
        aplicarFiltros();
    });

    busquedaCliente.addEventListener("input", function () {
        aplicarFiltros();
    });

    buscarPor.addEventListener("change", function () {
        aplicarFiltros();
    });

    buscarRegistro.addEventListener("change", function () {
        aplicarFiltros();
    });

    estadoRegistro.addEventListener("change", function () {
        aplicarFiltros();
    });

    btnLimpiar.addEventListener("click", function () {
    buscarPor.value = "todos";
    busquedaCliente.value = "";
    buscarRegistro.value = "todo";
    estadoRegistro.value = "todo";
    paginaActual = 1;
    mostrarRegistros([]);
});

btnPaginaAnterior.addEventListener("click", function () {
    if (paginaActual > 1) {
        paginaActual--;
        mostrarRegistros(listaActual);
    }
});

btnPaginaSiguiente.addEventListener("click", function () {
    const totalPaginas = Math.ceil(listaActual.length / registrosPorPagina);

    if (paginaActual < totalPaginas) {
        paginaActual++;
        mostrarRegistros(listaActual);
    }
});

mostrarRegistros([]);
});