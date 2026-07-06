<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%!
    public String limpiarJS(String texto) {
        if (texto == null) {
            return "";
        }

        return texto
            .replace("\\", "\\\\")
            .replace("\"", "\\\"")
            .replace("\r", " ")
            .replace("\n", " ")
            .replace("</script>", "<\\/script>");
    }
%>

<%
    if (session.getAttribute("idCliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String rolCliente = (String) session.getAttribute("rolCliente");

    if (rolCliente == null || !"ADMIN".equalsIgnoreCase(rolCliente)) {
        response.sendRedirect("mi-cuenta.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    StringBuilder registrosJS = new StringBuilder();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ellado_dulce_db",
            "root",
            ""
        );

        String sql =
            "SELECT * FROM ( " +

            "SELECT " +
            "p.pd_id_pedido AS id_registro, " +
            "'Pedido' AS tipo_registro, " +
            "CONCAT(c.c_p_nombre, ' ', c.c_p_apellido) AS cliente, " +
            "'' AS cedula, " +
            "c.c_p_telefono AS celular, " +
            "c.c_p_correo AS correo, " +
            "DATE_FORMAT(p.pf_fechapedido, '%d/%m/%Y %h:%i %p') AS fecha_texto, " +
            "p.pd_estado AS estado, " +
            "p.pf_fechapedido AS fecha_orden, " +
            "CONCAT('Producto: ', m.m_producto, ' | Cantidad: ', p.pd_cantidad, ' | Total: B/.', FORMAT(p.pd_total, 2)) AS detalle " +
            "FROM pedido p " +
            "INNER JOIN cliente c ON p.pd_c_id_cliente = c.c_id_cliente " +
            "INNER JOIN menu m ON p.pd_m_id_menu = m.m_id_menu " +

            "UNION ALL " +

            "SELECT " +
            "ac.ac_id_compra AS id_registro, " +
            "'Actividad' AS tipo_registro, " +
            "CONCAT(c.c_p_nombre, ' ', c.c_p_apellido) AS cliente, " +
            "'' AS cedula, " +
            "c.c_p_telefono AS celular, " +
            "c.c_p_correo AS correo, " +
            "DATE_FORMAT(CAST(CONCAT(a.a_fecha, ' ', a.a_hora) AS DATETIME), '%d/%m/%Y %h:%i %p') AS fecha_texto, " +
            "ac.ac_estado AS estado, " +
            "CAST(CONCAT(a.a_fecha, ' ', a.a_hora) AS DATETIME) AS fecha_orden, " +
            "CONCAT('Actividad: ', a.a_nombre, ' | Confirmación: ', ac.ac_numero_confirmacion) AS detalle " +
            "FROM actividad_compra ac " +
            "INNER JOIN actividad a ON ac.ac_id_actividad = a.a_id_actividad " +
            "INNER JOIN cliente c ON ac.ac_id_cliente = c.c_id_cliente " +

            "UNION ALL " +

            "SELECT " +
            "r.r_id_reserva AS id_registro, " +
            "'Reserva' AS tipo_registro, " +
            "CONCAT(c.c_p_nombre, ' ', c.c_p_apellido) AS cliente, " +
            "'' AS cedula, " +
            "c.c_p_telefono AS celular, " +
            "c.c_p_correo AS correo, " +
            "DATE_FORMAT(CAST(CONCAT(r.r_fecha, ' ', r.r_hora) AS DATETIME), '%d/%m/%Y %h:%i %p') AS fecha_texto, " +
            "r.r_estado AS estado, " +
            "CAST(CONCAT(r.r_fecha, ' ', r.r_hora) AS DATETIME) AS fecha_orden, " +
            "CONCAT('Tipo de reserva: ', tr.tr_nombre, ' | Total estimado: B/.', FORMAT(r.r_total_estimado, 2)) AS detalle " +
            "FROM reserva r " +
            "INNER JOIN tipo_reserva tr ON r.r_tr_id_tipo = tr.tr_id_tipo " +
            "INNER JOIN cliente c ON r.r_c_id_cliente = c.c_id_cliente " +

            ") registros " +
            "ORDER BY fecha_orden DESC";

        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        boolean primero = true;

        while (rs.next()) {
            if (!primero) {
                registrosJS.append(",");
            }

            registrosJS.append("{");
            registrosJS.append("\"id\":").append(rs.getInt("id_registro")).append(",");
            registrosJS.append("\"tipo\":\"").append(limpiarJS(rs.getString("tipo_registro"))).append("\",");
            registrosJS.append("\"cliente\":\"").append(limpiarJS(rs.getString("cliente"))).append("\",");
            registrosJS.append("\"cedula\":\"").append(limpiarJS(rs.getString("cedula"))).append("\",");
            registrosJS.append("\"celular\":\"").append(limpiarJS(rs.getString("celular"))).append("\",");
            registrosJS.append("\"correo\":\"").append(limpiarJS(rs.getString("correo"))).append("\",");
            registrosJS.append("\"fecha\":\"").append(limpiarJS(rs.getString("fecha_texto"))).append("\",");
            registrosJS.append("\"estado\":\"").append(limpiarJS(rs.getString("estado"))).append("\",");
            registrosJS.append("\"detalle\":\"").append(limpiarJS(rs.getString("detalle"))).append("\"");
            registrosJS.append("}");

            primero = false;
        }

    } catch (Exception e) {
        out.println("<h2>Error al cargar registros del administrador</h2>");
        out.println("<pre>");
        e.printStackTrace(new java.io.PrintWriter(out));
        out.println("</pre>");
        return;

    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de administración | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="admin.css">
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
        <a href="#">Crepes</a>
        <a href="Boquitas.jsp">Boquitas</a>
        <a href="Pasteles.jsp">Pasteles</a>
        <a href="reservas.jsp">Reservas</a>
        <a href="actividades.jsp">Actividades</a>
        <a href="nosotros.jsp">Nosotros</a>
        <a href="mi-cuenta.jsp">Mi cuenta</a>
        <a href="logout.jsp">Cerrar sesión</a>
    </nav>

    <div class="cart">
        <a href="pantalla-de-carrito.jsp">
            <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
        </a>
    </div>
</header>

<main class="admin-page">

    <section class="admin-header">
        <div class="admin-title">
            <div>
                <h1>Panel de administración</h1>
                <p>Gestiona pedidos, actividades y reservas del local desde un solo lugar.</p>
            </div>
        </div>
    </section>

    <section class="filter-card">
        <h2>Buscar cliente</h2>

        <div class="filter-row">
            <div class="field-group small-field">
                <label for="buscarPor">Buscar por</label>
                <select id="buscarPor">
                    <option value="todos">Todos</option>
                    <option value="cedula">Cédula</option>
                    <option value="nombre">Nombre y apellido</option>
                    <option value="celular">Celular</option>
                    <option value="correo">Correo</option>
                </select>
            </div>

            <div class="field-group search-field">
                <label for="busquedaCliente">Buscar</label>
                <input type="text" id="busquedaCliente" placeholder="Escribe el término de búsqueda">
            </div>

            <button type="button" class="search-btn" id="btnBuscar">
                Buscar
            </button>
        </div>
    </section>

    <section class="filter-card second-filter">
        <div class="filter-row">
            <div class="field-group small-field">
                <label for="buscarRegistro">Buscar registro</label>
                <select id="buscarRegistro">
                    <option value="todo">Todo</option>
                    <option value="actividad">Actividad</option>
                    <option value="pedido">Pedido</option>
                    <option value="reserva">Reserva</option>
                </select>
            </div>

            <div class="field-group small-field">
                <label for="estadoRegistro">Estado</label>
                <select id="estadoRegistro">
                    <option value="todo">Todo</option>
                    <option value="pendiente">Pendiente</option>
                    <option value="en proceso">En proceso</option>
                    <option value="listo">Listo</option>
                    <option value="entregado">Entregado</option>
                    <option value="confirmada">Confirmada</option>
                    <option value="cancelada">Cancelada</option>
                    <option value="realizada">Realizada</option>
                </select>
            </div>

            <div class="field-group date-field">
                <label for="rangoFechas">Rango de fechas</label>
                <input type="text" id="rangoFechas" value="" placeholder="Filtro visual opcional">
            </div>

            <button type="button" class="clear-btn" id="btnLimpiar">
                ↻ Limpiar filtros
            </button>
        </div>
    </section>

    <section class="records-card">
        <div class="records-header">
            <h2>Registros encontrados <span id="contadorRegistros">(0)</span></h2>
        </div>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Tipo de registro</th>
                        <th>Cliente</th>
                        <th>Cédula</th>
                        <th>Celular</th>
                        <th>Correo</th>
                        <th>Fecha</th>
                        <th>Estado</th>
                        <th>Acción</th>
                    </tr>
                </thead>

                <tbody id="tablaRegistros">
                    <!-- Los registros se cargan con JavaScript -->
                </tbody>
            </table>
        </div>

        <div class="table-footer">
            <p id="textoCantidad">Mostrando registros</p>

            <div class="pagination">
                <button type="button" id="btnPaginaAnterior" disabled>‹</button>
                <button type="button" class="active-page" id="paginaActual">1</button>
                <button type="button" id="btnPaginaSiguiente" disabled>›</button>
            </div>
        </div>
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
        <p>Martes a Domingo<br>1:00 p.m. - 9:00 p.m.</p>
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
        © 2026 Ellado Dulce. Todos los derechos reservados.
    </div>
</footer>

<script>
    const registrosAdmin = [<%= registrosJS.toString() %>];
</script>

<script src="admin.js?v=2"></script>

</body>
</html>