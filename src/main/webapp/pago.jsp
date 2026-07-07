<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Locale" %>

<%!
    public double convertirDecimal(String valor, double defecto) {
        try {
            if (valor == null || valor.trim().equals("")) {
                return defecto;
            }

            return Double.parseDouble(valor);
        } catch (Exception e) {
            return defecto;
        }
    }

    public int convertirEntero(String valor, int defecto) {
        try {
            if (valor == null || valor.trim().equals("")) {
                return defecto;
            }

            return Integer.parseInt(valor);
        } catch (Exception e) {
            return defecto;
        }
    }

    public String textoSeguro(String valor) {
        if (valor == null) {
            return "";
        }

        return valor;
    }
%>

<%
    request.setCharacterEncoding("UTF-8");

    if (session.getAttribute("idCliente") == null) {
        response.sendRedirect("mi-cuenta.jsp");
        return;
    }

    String tipoPago = request.getParameter("tipoPago");

    if (tipoPago == null || tipoPago.trim().equals("")) {
        tipoPago = "pedido";
    }

    String accionConfirmacion = "confirmarPedido.jsp";
    String tituloResumen = "Resumen del pedido";
    String textoBoton = "Confirmar pedido";
    String enlaceVolver = "pantalla-de-carrito.jsp";
    String textoVolver = "Volver al carrito";

    if ("actividad".equalsIgnoreCase(tipoPago)) {
        accionConfirmacion = "comprar-actividad.jsp";
        tituloResumen = "Resumen de actividad";
        textoBoton = "Confirmar pago de actividad";
        enlaceVolver = "actividades.jsp";
        textoVolver = "Volver a actividades";
    } else if ("reserva".equalsIgnoreCase(tipoPago)) {
        accionConfirmacion = "confirmar-reserva.jsp";
        tituloResumen = "Resumen de reserva";
        textoBoton = "Confirmar pago de reserva";
        enlaceVolver = "reservas.jsp";
        textoVolver = "Volver a reservas";
    }

    String[] nombres = request.getParameterValues("nombreProducto");
    String[] categorias = request.getParameterValues("categoriaProducto");
    String[] precios = request.getParameterValues("precioProducto");
    String[] cantidades = request.getParameterValues("cantidadProducto");
    String[] sabores = request.getParameterValues("saborProducto");
    String[] toppings = request.getParameterValues("toppingsProducto");
    String[] notas = request.getParameterValues("notasProducto");

    String usarPuntos = request.getParameter("usarPuntos");

    if (usarPuntos == null || usarPuntos.trim().equals("")) {
        usarPuntos = "no";
    }

    String idActividad = request.getParameter("idActividad");
    String nombreActividad = request.getParameter("nombreActividad");
    String precioActividad = request.getParameter("precioActividad");

    String idTipoReserva = request.getParameter("idTipoReserva");
    String nombreTipo = request.getParameter("nombreTipo");
    String precioBase = request.getParameter("precioBase");
    String horasBase = request.getParameter("horasBase");
    String nombrePrincipal = request.getParameter("nombrePrincipal");
    String decoracionDescripcion = request.getParameter("decoracionDescripcion");
    String fechaReserva = request.getParameter("fechaReserva");
    String horaReserva = request.getParameter("horaReserva");

    double subtotalCalculado = 0.00;

    if ("pedido".equalsIgnoreCase(tipoPago)) {
        if (nombres == null || precios == null || cantidades == null || nombres.length == 0) {
            response.sendRedirect("pantalla-de-carrito.jsp");
            return;
        }

        for (int i = 0; i < nombres.length; i++) {
            double precioProducto = convertirDecimal(precios[i], 0.00);
            int cantidadProducto = convertirEntero(cantidades[i], 1);

            subtotalCalculado += precioProducto * cantidadProducto;
        }

    } else if ("actividad".equalsIgnoreCase(tipoPago)) {
        if (idActividad == null || idActividad.trim().equals("") ||
            precioActividad == null || precioActividad.trim().equals("")) {

            response.sendRedirect("actividades.jsp");
            return;
        }

        subtotalCalculado = convertirDecimal(precioActividad, 0.00);

    } else if ("reserva".equalsIgnoreCase(tipoPago)) {
        if (idTipoReserva == null || idTipoReserva.trim().equals("") ||
            precioBase == null || precioBase.trim().equals("") ||
            fechaReserva == null || fechaReserva.trim().equals("") ||
            horaReserva == null || horaReserva.trim().equals("")) {

            response.sendRedirect("reservas.jsp");
            return;
        }

        subtotalCalculado = convertirDecimal(precioBase, 0.00);
    }

    double itbmsCalculado = subtotalCalculado * 0.07;
    double totalCalculado = subtotalCalculado + itbmsCalculado;

    String subtotal = String.format(Locale.US, "%.2f", subtotalCalculado);
    String itbms = String.format(Locale.US, "%.2f", itbmsCalculado);
    String total = String.format(Locale.US, "%.2f", totalCalculado);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Pago | Ellado Dulce</title>

    <link rel="stylesheet" href="layout.css">
    <link rel="stylesheet" href="pago.css">
</head>
<body>

<header class="navbar">
    <div class="logo">
        <img src="imagenes/logo2019.png" class="logo-img" alt="Logo Ellado Dulce">
        <span>Ellado <strong>Dulce</strong></span>
    </div>

    <nav class="menu">
        <a href="index.jsp">Inicio</a>

        <div class="dropdown">
            <a href="" class="dropdown-toggle">Boquitas <span class="arrow">∨</span></a>
            <div class="dropdown-menu">
                <a href="boquitas-dulces.jsp">Boquitas Dulces</a>
                <a href="boquitas-saladas.jsp">Boquitas Saladas</a>
            </div>
        </div>

        <a href="Pasteles.jsp">Pasteles</a>
        <a href="reservas.jsp">Reservas</a>
        <a href="actividades.jsp">Actividades</a>
        <a href="Nosotros.jsp">Nosotros</a>
        <a href="mi-cuenta.jsp">Mi cuenta</a>
    </nav>

    <div class="cart">
        <a href="pantalla-de-carrito.jsp">
            <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
        </a>
    </div>
</header>

<main class="payment-page">

    <h1>Procesar <span>pago</span></h1>

    <section class="payment-grid">

        <form action="<%= accionConfirmacion %>" method="post" class="payment-card">

            <h2>Pago con tarjeta</h2>

            <p class="payment-note">
                Este pago es simulado para registrar la compra en el sistema.
            </p>

            <div class="form-group">
                <label for="nombreTarjeta">Nombre en la tarjeta</label>
                <input type="text" id="nombreTarjeta" placeholder="Ej: Benjamin Romero" required>
            </div>

            <div class="form-group">
                <label for="numeroTarjeta">Número de tarjeta</label>
                <input type="text" id="numeroTarjeta" placeholder="1234 5678 9012 3456" maxlength="19" required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="fechaTarjeta">Fecha</label>
                    <input type="text" id="fechaTarjeta" placeholder="MM/AA" maxlength="5" required>
                </div>

                <div class="form-group">
                    <label for="cvv">CVV</label>
                    <input type="password" id="cvv" placeholder="123" maxlength="4" required>
                </div>
            </div>

            <input type="hidden" name="metodoPago" value="Tarjeta simulada">
            <input type="hidden" name="tipoPago" value="<%= tipoPago %>">

            <% if ("pedido".equalsIgnoreCase(tipoPago)) { %>

                <%
                    for (int i = 0; i < nombres.length; i++) {
                %>
                    <input type="hidden" name="nombreProducto" value="<%= textoSeguro(nombres[i]) %>">
                    <input type="hidden" name="categoriaProducto" value="<%= categorias != null && categorias.length > i ? textoSeguro(categorias[i]) : "" %>">
                    <input type="hidden" name="precioProducto" value="<%= textoSeguro(precios[i]) %>">
                    <input type="hidden" name="cantidadProducto" value="<%= textoSeguro(cantidades[i]) %>">
                    <input type="hidden" name="saborProducto" value="<%= sabores != null && sabores.length > i ? textoSeguro(sabores[i]) : "" %>">
                    <input type="hidden" name="toppingsProducto" value="<%= toppings != null && toppings.length > i ? textoSeguro(toppings[i]) : "" %>">
                    <input type="hidden" name="notasProducto" value="<%= notas != null && notas.length > i ? textoSeguro(notas[i]) : "" %>">
                <%
                    }
                %>

                <input type="hidden" name="usarPuntos" value="<%= usarPuntos %>">

            <% } else if ("actividad".equalsIgnoreCase(tipoPago)) { %>

                <input type="hidden" name="idActividad" value="<%= textoSeguro(idActividad) %>">

            <% } else if ("reserva".equalsIgnoreCase(tipoPago)) { %>

                <input type="hidden" name="idTipoReserva" value="<%= textoSeguro(idTipoReserva) %>">
                <input type="hidden" name="nombreTipo" value="<%= textoSeguro(nombreTipo) %>">
                <input type="hidden" name="precioBase" value="<%= textoSeguro(precioBase) %>">
                <input type="hidden" name="horasBase" value="<%= textoSeguro(horasBase) %>">
                <input type="hidden" name="nombrePrincipal" value="<%= textoSeguro(nombrePrincipal) %>">
                <input type="hidden" name="decoracionDescripcion" value="<%= textoSeguro(decoracionDescripcion) %>">
                <input type="hidden" name="fechaReserva" value="<%= textoSeguro(fechaReserva) %>">
                <input type="hidden" name="horaReserva" value="<%= textoSeguro(horaReserva) %>">

            <% } %>

            <input type="hidden" name="subtotal" value="<%= subtotal %>">
            <input type="hidden" name="itbms" value="<%= itbms %>">
            <input type="hidden" name="total" value="<%= total %>">

            <button type="submit" class="pay-btn">
                <%= textoBoton %>
            </button>

            <a href="<%= enlaceVolver %>" class="back-cart">
                <%= textoVolver %>
            </a>

        </form>

        <aside class="summary-card">

            <h2><%= tituloResumen %></h2>

            <div class="summary-products">

                <% if ("pedido".equalsIgnoreCase(tipoPago)) { %>

                    <%
                        for (int i = 0; i < nombres.length; i++) {
                            double precio = convertirDecimal(precios[i], 0.00);
                            int cantidad = convertirEntero(cantidades[i], 1);
                            double totalProducto = precio * cantidad;
                    %>
                        <div class="summary-product">
                            <div>
                                <strong><%= nombres[i] %></strong>
                                <span>Cantidad: <%= cantidad %></span>
                            </div>

                            <b>$<%= String.format(Locale.US, "%.2f", totalProducto) %></b>
                        </div>
                    <%
                        }
                    %>

                <% } else if ("actividad".equalsIgnoreCase(tipoPago)) { %>

                    <div class="summary-product">
                        <div>
                            <strong><%= textoSeguro(nombreActividad) %></strong>
                            <span>Cupo para actividad</span>
                        </div>

                        <b>$<%= subtotal %></b>
                    </div>

                <% } else if ("reserva".equalsIgnoreCase(tipoPago)) { %>

                    <div class="summary-product">
                        <div>
                            <strong><%= textoSeguro(nombreTipo) %></strong>
                            <span>Fecha: <%= textoSeguro(fechaReserva) %> | Hora: <%= textoSeguro(horaReserva) %></span>
                            <span>Nombre: <%= textoSeguro(nombrePrincipal) %></span>
                        </div>

                        <b>$<%= subtotal %></b>
                    </div>

                <% } %>

            </div>

            <div class="summary-line">
                <span>Subtotal</span>
                <strong>$<%= subtotal %></strong>
            </div>

            <div class="summary-line">
                <span>ITBMS (7%)</span>
                <strong>$<%= itbms %></strong>
            </div>

            <div class="summary-divider"></div>

            <div class="summary-line total-line">
                <span>Total</span>
                <strong>$<%= total %></strong>
            </div>

        </aside>

    </section>

</main>

<script>
    const numeroTarjeta = document.getElementById("numeroTarjeta");
    const fechaTarjeta = document.getElementById("fechaTarjeta");

    numeroTarjeta.addEventListener("input", function () {
        let valor = numeroTarjeta.value.replace(/\D/g, "").substring(0, 16);
        valor = valor.replace(/(.{4})/g, "$1 ").trim();
        numeroTarjeta.value = valor;
    });

    fechaTarjeta.addEventListener("input", function () {
        let valor = fechaTarjeta.value.replace(/\D/g, "").substring(0, 4);

        if (valor.length >= 3) {
            valor = valor.substring(0, 2) + "/" + valor.substring(2);
        }

        fechaTarjeta.value = valor;
    });
</script>

</body>
</html>