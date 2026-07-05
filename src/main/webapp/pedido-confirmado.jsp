<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    if (session.getAttribute("idCliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Pedido confirmado | Ellado Dulce</title>
    <link rel="stylesheet" href="inicio.css">
</head>
<body>

<main style="min-height: 600px; display: flex; align-items: center; justify-content: center; text-align: center; padding: 40px;">
    <div style="background: #ffffff; border-radius: 24px; padding: 46px; box-shadow: 0 14px 34px rgba(16, 25, 66, 0.08); max-width: 520px;">
        <h1 style="color:#101942;">Pedido realizado exitosamente</h1>

        <p style="color:#625f7d; margin-top: 12px;">
            Tu pago con tarjeta simulada fue procesado y tu pedido quedó registrado en el sistema.
        </p>

        <br>

        <a href="mi-cuenta.jsp" style="display:inline-block;background-color:#ff4f8b;color:white;padding:12px 24px;border-radius:999px;text-decoration:none;font-weight:800;">
            Ver mi cuenta
        </a>

        <a href="index.jsp" style="display:inline-block;margin-left:10px;color:#ff4f8b;font-weight:800;text-decoration:none;">
            Volver al inicio
        </a>
    </div>
</main>

<script>
    localStorage.removeItem("carrito");
</script>

</body>
</html>