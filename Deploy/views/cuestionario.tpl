<!DOCTYPE html>
<html>
  <head>
    <title>Cuestionario </title>
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
        #contenedor {
            width: 80%;
            max-width: 700px;
            margin: 0 auto;
            border: 2px solid black;
            background-color: rgba(white);      
            border-radius: 10px;      
            text-align: justify;
        }
        #contenedorPregunta {
            width: 100%;
            border-top-left-radius: 5px; 
            border-top-right-radius: 5px;   
            max-width: 100%;
            margin: 0 auto;
            border-bottom: 2px solid black;
            background-color: #2c3e50;
            color: white;       
        }

        #contenedorRespuesta{
            padding: 10px;
        }
        button[type="submit"] {
            display: block;
            margin: 0 auto;
            background-color: #ffc107;
            color: #fff;
            width: 120px;
            height: 50px;
            font-size: 25px;
            border: 2px solid white;
        }
        .menajeAlerta{
            display: flex;
            justify-content: center;
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
    <br>
    <h2>Bienvenido al cuestionario</h2>
    <p>Rellena todas las preguntas en base a las caracteristicas de tu aplicacion web</p>
    <br>
    <div class = "menajeAlerta">
        {% if mensaje %}
            <p style="color:red;">{{ mensaje }}</p>
            <br>
            <br>
        {% endif %}
    </div>
    
    <form action="/guardarFormulario?usuarioID={{usuarioID}}" method="post">
    <input type="hidden" name="preguntas_json" value="{{ preguntas | safe }}">
    {% for pregunta in preguntas %}
        <div id = "contenedor">
            <div id = "contenedorPregunta">
                <h3>Pregunta {{ pregunta.preguntaID }} : {{ pregunta.pregunta }}</h3>
                <br>
            </div>
            <div id = "contenedorRespuesta">
            {% for respuesta in pregunta.respuestas %}
            <label>
                <input type="radio" name="pregunta_{{ pregunta.preguntaID }}" value="{{ respuesta.respuestaID }}">
                {{ respuesta.respuesta }}
            </label>
            <br>
            <br>
            <br>
            {% endfor %}
            </div>
            <br>
        </div>
        <br>
    {% endfor %}
    <input type="hidden" name="usuarioID" value="{{usuarioID}}">
    <button type="submit">Enviar</button>
    <br>
    <br>
</form>
  </body>
</html>