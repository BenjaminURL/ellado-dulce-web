<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String idParam = request.getParameter("id");

    if (idParam == null || idParam.trim().equals("")) {
        response.sendRedirect("reservas.jsp");
        return;
    }

    int idTipo = 0;

    try {
        idTipo = Integer.parseInt(idParam);
    } catch (Exception e) {
        response.sendRedirect("reservas.jsp");
        return;
    }

    String nombreTipo = "";
    String descripcionTipo = "";
    double precioBase = 0.00;
    int horasBase = 2;

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        String sql =
            "SELECT tr_id_tipo, tr_nombre, tr_descripcion, tr_precio_base, tr_horas_base " +
            "FROM tipo_reserva " +
            "WHERE tr_id_tipo = ?";

        ps = con.prepareStatement(sql);
        ps.setInt(1, idTipo);

        rs = ps.executeQuery();

        if (rs.next()) {
            nombreTipo = rs.getString("tr_nombre");
            descripcionTipo = rs.getString("tr_descripcion");
            precioBase = rs.getDouble("tr_precio_base");
            horasBase = rs.getInt("tr_horas_base");
        } else {
            response.sendRedirect("reservas.jsp");
            return;
        }

    } catch (Exception e) {
        out.println("<h2>Error al cargar el tipo de reserva</h2>");
        out.println("<pre>");
        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");
        return;

    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }

    String precioTexto = String.format(java.util.Locale.US, "%.2f", precioBase);

    boolean esCorporativo = nombreTipo.toLowerCase().contains("corporativo");

    String tituloCampoPrincipal = esCorporativo ? "Nombre de la empresa" : "Nombre del cumpleañero";
    String placeholderPrincipal = esCorporativo ? "Ej: Tech Solutions S.A." : "Ej: Sofía";

    String tituloDecoracion = esCorporativo ? "Detalles de decoración corporativa" : "Tipo de decoración deseada";
    String placeholderDecoracion = esCorporativo
        ? "Logos, colores corporativos, pantallas, banner..."
        : "Ej: temática de princesa, colores rosado y dorado, globos, flores...";

    String imagenReserva = esCorporativo
        ? "imagenes/reservas/corporativo.png"
        : "imagenes/reservas/cumpleanos.png";
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= nombreTipo %> | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="detalle.reserva.css">
</head>
<body>

<header class="navbar">
    <div class="logo">
        <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="logo-img">
        <span>Ellado <strong>Dulce</strong></span>
    </div>

    <nav class="menu">
        <a href="index.jsp">Inicio</a>
        <a href="helados.jsp">Helados</a>
        <a href="html/bebidas.jsp">Bebidas</a>
        <a href="">Crepes</a>
        <a href="Boquitas.jsp">Boquitas</a>
        <a href="Pasteles.jsp">Pasteles</a>
        <a class="active" href="reservas.jsp">Reservas</a>
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

<main class="reserva-page">

    <a href="reservas.jsp" class="back-link">← Volver a Reservas</a>

    <section class="reserva-layout">

        <div class="left-area">

            <div class="product-image">
                <img src="<%= imagenReserva %>" alt="<%= nombreTipo %>">
            </div>

            <section class="form-card">
                <h2>Completa tu reserva</h2>

                <input type="hidden" name="idTipoReserva" value="<%= idTipo %>">
<input type="hidden" name="nombreTipo" value="<%= nombreTipo %>">
<input type="hidden" name="precioBase" value="<%= precioTexto %>">
<input type="hidden" name="horasBase" value="<%= horasBase %>">

                    <input type="hidden" name="tipoReserva" value="<%= idTipo %>">
                    <input type="hidden" name="nombreTipo" value="<%= nombreTipo %>">
                    <input type="hidden" name="precioBase" value="<%= precioTexto %>">
                    <input type="hidden" name="horasBase" value="<%= horasBase %>">

                    <div class="form-group">
                        <label for="nombrePrincipal"><%= tituloCampoPrincipal %></label>
                        <input 
                            type="text" 
                            id="nombrePrincipal" 
                            name="nombrePrincipal"
                            placeholder="<%= placeholderPrincipal %>"
                            required>
                    </div>

                    <div class="form-group">
                        <label for="decoracionDescripcion"><%= tituloDecoracion %></label>
                        <textarea 
                            id="decoracionDescripcion" 
                            name="decoracionDescripcion"
                            placeholder="<%= placeholderDecoracion %>"></textarea>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="fechaReserva">Fecha</label>
                            <input type="date" id="fechaReserva" name="fechaReserva" required>
                        </div>

                        <div class="form-group">
                            <label for="horaReserva">Hora</label>
                            <input type="time" id="horaReserva" name="horaReserva" required>
                        </div>
                    </div>
                </form>
            </section>

        </div>

        <aside class="package-card">
            <h1><%= nombreTipo %></h1>

            <div class="price">
                <strong>B/.<%= precioTexto %></strong>
                <span>/ <%= horasBase %> horas</span>
            </div>

            <p class="description">
                <%= descripcionTipo %>
            </p>

            <h3>Este paquete incluye:</h3>

            <ul class="include-list">
                <% if (esCorporativo) { %>
                    <li><span></span>Local del evento</li>
                    <li><span></span>Montaje formal del espacio</li>
                    <li><span></span>Mesa para refrigerio</li>
                    <li><span></span>Decoración corporativa estándar</li>
                    <li><span></span>Menú básico</li>
                    <li><span></span>Opción de agregar café o boquitas</li>
                <% } else { %>
                    <li><span></span>Local del evento por 2 horas</li>
                    <li><span></span>Decoración básica de cumpleaños</li>
                    <li><span></span>Mesa principal decorada</li>
                    <li><span></span>Espacio para pastel</li>
                    <li><span></span>Área para fotos</li>
                    <li><span></span>Atención básica durante el evento</li>
                <% } %>
            </ul>

            <button type="button" class="buy-btn" id="btnComprarReserva">
                Comprar
            </button>

            <a href="#" target="_blank" class="whatsapp-btn" id="whatsappReserva">
                Consultar por WhatsApp
            </a>
        </aside>

    </section>

</main>

<footer class="footer">
    <div class="footer-col">
        <div class="footer-logo">
            <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="footer-logo-img">
            <h3>Ellado <span>Dulce</span></h3>
        </div>
        <p>Tu lugar favorito para endulzar cada momento.</p>
    </div>

    <div class="footer-col">
        <h3>Horarios</h3>
        <p>Lunes<br>1:00 p.m. - 8:00 p.m.</p>
        <p>Martes a Domingos<br>1:00 p.m. - 9:00 p.m.</p>
    </div>

    <div class="footer-col">
        <h3>Ubicación</h3>
        <p>Brisas Mall, Av. Principal, San Miguelito, Provincia de Panamá.</p>
        <a href="#">Cómo llegar →</a>
    </div>

    <div class="footer-col">
        <h3>Contacto</h3>
        <p>@elladodulce</p>
        <p>+507 315-8752</p>
    </div>

    <div class="copyright">
        © 2025 Ellado Dulce. Todos los derechos reservados.
    </div>
</footer>

<script>
    const nombreTipoReserva = "<%= nombreTipo %>";
    const precioTipoReserva = "<%= precioTexto %>";
    const horasTipoReserva = "<%= horasBase %>";
</script>

<script src="detalle-reserva.js?v=1"></script>
</body>
</html>