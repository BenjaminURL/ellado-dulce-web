<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión | Ellado Dulce</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="login.css">
</head>
<body>

<header class="navbar">
    <div class="logo">
        <img src="imagenes/logo2019.png" class="logo-img" alt="Logo El Lado Dulce">
        <span>El <strong>Lado Dulce</strong></span>
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
        <a class="active" href="login.jsp">Mi cuenta</a>
    </nav>

    <div class="cart">
        <a href="pantalla-de-carrito.jsp">
            <img src="imagenes/iconos/carrito.png" alt="Carrito de compras" class="cart-img">
        </a>
    </div>
</header>

<main class="login-page">
    <section class="login-card">

        <div class="login-icon">
            E
        </div>

        <h1>Iniciar sesión</h1>
        <p class="login-text">
            ¡Qué bueno verte de nuevo! Ingresa tus datos para continuar.
        </p>

        <form action="loginProceso.jsp" method="post" class="login-form">

    <div class="form-group">
        <label for="usuario">Usuario o correo</label>
        <div class="input-box">
            <span class="input-icon">○</span>
            <input type="text" id="usuario" name="usuario" placeholder="Ingresa tu usuario o correo" required>
        </div>
    </div>

    <div class="form-group">
        <label for="contrasena">Contraseña</label>
        <div class="input-box">
            <span class="input-icon">□</span>
            <input type="password" id="contrasena" name="contrasena" placeholder="Ingresa tu contraseña" required>
        </div>
    </div>

    <button type="submit" class="login-btn">
    Iniciar sesión
</button>

<div class="divider">
    <span>o</span>
</div>

<a href="registro.jsp" class="register-btn">
    Registrarse
</a>

</form>
    </section>
</main>

<footer class="footer">
    <div class="footer-col">
        <div class="footer-logo">
            <img src="imagenes/logo2019.png" alt="Logo Ellado Dulce" class="footer-logo-img">
            <h3>El <span>Lado Dulce</span></h3>
        </div>
        <p>Tu lugar favorito para endulzar cada momento.</p>
    </div>

    <div class="footer-col">
        <h3>Horarios</h3>
        <p>Lunes<br>10:00 a.m. - 8:00 p.m.</p>
        <p>Martes a Domingo<br>10:00 a.m. - 9:00 p.m.</p>
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
        © 2026 El Lado Dulce. Todos los derechos reservados.
    </div>
</footer>

</body>
</html>