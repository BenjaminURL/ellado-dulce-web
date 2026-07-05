<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    if (session.getAttribute("idCliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String[] nombres = request.getParameterValues("nombreProducto");
    String[] categorias = request.getParameterValues("categoriaProducto");
    String[] precios = request.getParameterValues("precioProducto");
    String[] cantidades = request.getParameterValues("cantidadProducto");

    String subtotal = request.getParameter("subtotal");
    String itbms = request.getParameter("itbms");
    String total = request.getParameter("total");

    if (nombres == null || precios == null || cantidades == null || nombres.length == 0) {
        response.sendRedirect("pantalla-de-carrito.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Pago | Ellado Dulce</title>
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
        <a href="helados.jsp">Helados</a>
        <a href="html/bebidas.jsp">Bebidas</a>
        <a href="#">Crepes</a>
        <a href="Boquitas.jsp">Boquitas</a>
        <a href="Pasteles.jsp">Pasteles</a>
        <a href="reservas.jsp">Reservas</a>
        <a href="actividades.jsp">Actividades</a>
        <a href="nosotros.jsp">Nosotros</a>
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

        <form action="confirmarPedido.jsp" method="post" class="payment-card">

            <h2>Pago con tarjeta</h2>
            <p class="payment-note">
                Este pago es simulado para registrar tu pedido en el sistema.
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

            <%
                for (int i = 0; i < nombres.length; i++) {
            %>
                <input type="hidden" name="nombreProducto" value="<%= nombres[i] %>">
                <input type="hidden" name="categoriaProducto" value="<%= categorias != null && categorias.length > i ? categorias[i] : "" %>">
                <input type="hidden" name="precioProducto" value="<%= precios[i] %>">
                <input type="hidden" name="cantidadProducto" value="<%= cantidades[i] %>">
            <%
                }
            %>

            <input type="hidden" name="subtotal" value="<%= subtotal %>">
            <input type="hidden" name="itbms" value="<%= itbms %>">
            <input type="hidden" name="total" value="<%= total %>">

            <button type="submit" class="pay-btn">
                Confirmar pedido
            </button>

            <a href="pantalla-de-carrito.jsp" class="back-cart">
                Volver al carrito
            </a>

        </form>

        <aside class="summary-card">
            <h2>Resumen del pedido</h2>

            <div class="summary-products">
                <%
                    for (int i = 0; i < nombres.length; i++) {
                        double precio = Double.parseDouble(precios[i]);
                        int cantidad = Integer.parseInt(cantidades[i]);
                        double totalProducto = precio * cantidad;
                %>
                    <div class="summary-product">
                        <div>
                            <strong><%= nombres[i] %></strong>
                            <span>Cantidad: <%= cantidad %></span>
                        </div>
                        <b>$<%= String.format("%.2f", totalProducto) %></b>
                    </div>
                <%
                    }
                %>
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