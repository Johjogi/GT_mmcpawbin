<!DOCTYPE html>
<html>
<head>
	<title>Inicio</title>
    <link rel="shortcut icon" href="/image/UPC_logo_transparente_1.ico" type="image/x-icon">

	<style>
		* {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
    }

    header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        background-color: #2c3e50;
        color: #fff;
        padding: 20px;
    }

    nav ul {
        display: flex;
        list-style: none;
    }

    nav ul li {
        margin-right: 20px;
    }

    nav ul li a {
        color: #fff;
        text-decoration: none;
        font-size: 16px;
        font-weight: bold;
        text-transform: uppercase;
        transition: all 0.3s ease-in-out;
    }

    nav ul li a:hover {
        color: #ffc107;
    }

    .main-image {
        background-image: url("/imagenes/login_fondo.jpg");
        background-size: cover;
        background-position: center;
        height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        
    }

    .cta-button {
        background-color: #ffc107;
        color: #fff;
        padding: 10px 30px;
        font-size: 20px;
        font-weight: bold;
        border-radius: 5px;
        text-decoration: none;
        text-transform: uppercase;
        transition: all 0.3s ease-in-out;
        margin-top: 20px;
    }

    .cta-button:hover {
        background-color: #333;
        color: #ffc107;
    }

    .message {
        display: flex;
        align-items: center;
        justify-content: center;
        height: calc(100vh - 100px);
        opacity: 0.7;
    }

    .message-text {
        text-align: center;
        font-size: 24px;
        line-height: 1.5;
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: rgba(255, 255, 255, 0.8);
    }
	</style>
</head>
<body>
	<header>
		<h1>MMCPCAWBIN</h1>
		<nav>
			<ul>
				<li><a href="/inicio?usuarioID={{usuarioID}}">Inicio</a></li>
				<li><a href="/cuestionario?usuarioID={{usuarioID}}">Cuestionario</a></li>
				<li><a href="/misFormularios?usuarioID={{usuarioID}}">Historial</a></li>
				<li><a href="/acercaDe?usuarioID={{usuarioID}}">Acerca de</a></li>
                <li><a href="/cerrarSesion">Cerrar sesión</a></li>
			</ul>
		</nav>
	</header>
	<section class="main-image">
		<div class="message">
			<p class="message-text">Bienvenido {{nombreUsuario}} a nuestra aplicacion web basada en un Modelo de Madurez en Ciberseguridad, una herramienta para evaluar y mejorar el nivel de madurez en ciberseguridad de la aplicacion web de tu organizacion.</p>
        </div>
		<a href="/cuestionario?usuarioID={{usuarioID}}" class="cta-button">Ir al cuestionario</a>
	</section>
</body>