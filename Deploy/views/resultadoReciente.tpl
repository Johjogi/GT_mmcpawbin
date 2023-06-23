<!DOCTYPE html>
<html>
<head>
	<title>Resultados de promedios</title>
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
        .padre {
            display: flex;
            justify-content: center;
        }
        .hijo1 {
            flex-basis: 50%; /* Adjust the percentage value according to your needs */
            border: 0px solid red;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            vertical-align: middle;
            padding: 30px;
        }

        .hijo2 {
            flex-basis: 50%; /* Adjust the percentage value according to your needs */
            
            padding: 30px;
        }
        .contenedor{
            border: 3px solid #2c3e50;
            padding: 20px;
            border-radius: 15px;
            text-align: justify;
        }
  
    </style>
    <script src="/js/chart.js"></script>
	<style>
		canvas {

            border: 1px solid #ccc;
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
	<h1>Resultados del cuestionario</h1>
    <br>
    <h2> Promedio y resultados: </h2>
    <div class = "padre"> 
        <div class = "hijo1">
            <div class="contenedor">
                <br>
                <p> Resultado: {{mensajePromedio}}  </p>
                <br>
                <br>
                <br>
            </div>
        </div>
        <div class = "hijo2">
            <canvas id="myChart"></canvas>
            <script>
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {{ chart_data | tojson }},
                options: {
                    scales: {
                    y: {
                        min: 0,
                        max: 4
                    }
                    }
                }
            });
            </script>
        </div>
        
    </div>
    
    {% for categoria in promediosDominio|groupby('categoria') %}
    <div class="padre">
        <div class = "hijo1">
  
        <canvas id="{{ categoria.grouper }}"></canvas>
        <script>
            var ctx = document.getElementById("{{ categoria.grouper }}").getContext("2d");
            var canvas = document.getElementById("{{ categoria.grouper }}");
            canvas.width = canvas.parentNode.clientWidth;
            canvas.height = canvas.parentNode.clientHeight;
            ctx.font = "29px Arial";
            var data = {
                labels: [
                    {% for promedio in categoria.list %}
                        "{{ promedio.dominio }}",
                    {% endfor %}
                ],
               datasets: [
                    
                    {
                        label: "Valor esperado para siguiente iteración",
                        data: [
                            {% for promedio in categoria.list %}
                               {{ 4 if promedio.promedioValor == 4 else promedio.promedioValor + 1 }},
                            {% endfor %}
                        ],
                        backgroundColor: "rgba(255, 99, 132, 0)",
                        borderColor: "rgba(44, 52, 80, 1)",
                        pointBackgroundColor: "rgba(44, 62, 80, 1)",
                        pointBorderColor: "#fff",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "rgba(255, 99, 132, 1)",
                    },
                    {
                        label: "Promedio por dominio ",
                        data: [
                            {% for promedio in categoria.list %}
                                {{ promedio.promedioValor }},
                            {% endfor %}
                        ],
                        backgroundColor: "rgba(179,181,198,0.2)",
                        borderColor: "rgba(179,181,198,1)",
                        pointBackgroundColor: "rgba(179,181,198,1)",
                        pointBorderColor: "#fff",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "rgba(179,181,198,1)",
                    },
                    {
                        label: "",
                        data: [4, 4, 4, 4],
                        backgroundColor: "rgba(255, 99, 132, 0)",
                        borderColor: "rgba(255, 99, 132, 0)",
                        pointBackgroundColor: "rgba(179,181,198,1)",
                        pointBorderColor: "#fff",
                        pointHoverBackgroundColor: "#fff",
                        pointHoverBorderColor: "rgba(179,181,198,1)",
                    }
                ]
            };
           var options = {
                scales: {
                    r: {
                        suggestedMin: 0
                    }
                },
                elements: {
                    line: {
                        angleLines: true
                    }
                },
                ticks: { beginAtZero: true },
                lineWidth: 30
            };


            var myRadarChart = new Chart(ctx, {
                type: 'radar',
                data: data,
                options: options
            });
        </script>
        </div>
        <div class = "hijo2">
            <div class = "contenedor">
                <p> Promedios por dominios:</p>
                <br>
                {% for promedio in categoria.list %}
                    {{ promedio.dominio }}: {{ promedio.promedioValor }}
                    <br>
                    <p> ¿Cómo mejorar?</p>
                    {{promedio.recomendacion}}
                    <br>
                    <br>
                {% endfor %}
            </div>
        </div>
    </div>
    <br>
{% endfor %}




    
</body>
</html>