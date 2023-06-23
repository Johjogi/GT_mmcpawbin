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

    .main-card {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: calc(100vh - 100px);
    }

    .card-title {
    font-size: 36px;
    text-align: center;
    margin-bottom: 20px;
    }

    .form-container {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    width: 600px;
    height: 200px;
    display: flex;
    justify-content: space-between;
    padding: 20px;
    }

    .form-image {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    background-image: url("../images/login_fondo.jpg");
    background-size: cover;
    background-position: center;
    }

    .form-info {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    margin-left: 20px;
    }

    .form-info h2 {
    font-size: 24px;
    margin-bottom: 10px;
    }

    .form-info label {
    font-size: 14px;
    color: #999;
    }

    .form-info button {
    background-color: #ffc107;
    color: #fff;
    padding: 10px 30px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
    text-decoration: none;
    text-transform: uppercase;
    transition: all 0.3s ease-in-out;
    border: none;
    }

    .form-info button:hover {
    background-color: #333;
    color: #ffc107;
    cursor: pointer;
    }
    .card {
    border: 1px solid #ccc;
    border-radius: 10px;
    padding: 10px;
    width: 100%;
    background-color: #fff;
    box-shadow: 0px 0px 5px #ccc;

    }

    .card h2 {
    font-size: 24px;
    margin: 0;
    padding: 0;
    }

    .card label {
    font-size: 16px;
    display: block;
    margin-bottom: 10px;
    }

    .card button {
    background-color: #ffc107;
    border: none;
    color: white;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    }
    #contenedor {
         
            max-width: 400px;
            margin: 0 auto;
            border: 2px solid black;
            background-color: rgba(white);       
            align-items: center;   
            border-radius: 10px;  
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
	<section class="form-section">
		<h2>Mis formularios</h2>
            {% for formulario in formularios %}
            <div id = "contenedor">
                <div class="card">
                    <h2>Formulario:  {{formulario.formularioID}}</h2>
                    <label>Fecha de respuesta: {{formulario.fecha}}</label>
                    <button onclick="window.location.href='/resultadoReciente?formularioID={{formulario.formularioID}}&usuarioID={{usuarioID}}'">Ver detalles</button>
                </div>
            </div>
            <br>
            {% endfor %}
	</section>
</body>