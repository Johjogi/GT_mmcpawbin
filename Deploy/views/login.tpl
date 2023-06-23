<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Ingresar</title>
    <link rel="shortcut icon" href="/image/UPC_logo_transparente_1.ico" type="image/x-icon">
     <style>
        

        h1 {
            text-align: center;
            font-size: 36px;
            margin-top: 100px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 50px;
        }

        label {
            font-size: 24px;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 300px;
            height: 40px;
            font-size: 24px;
            padding: 5px 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: none;
        }

        input[type="submit"] {
            width: 200px;
            height: 50px;
            font-size: 24px;
            color: #fff;
            background-color: #337ab7;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #286090;
        }

        p {
            font-size: 24px;
            color: red;
            text-align: center;
            margin-top: 20px;
        }
        body {
            background-image: url("/imagenes/login_fondo.jpg");
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            color: #333;
        }
        #contenedor {
            width: 80%;
            max-width: 400px;
            margin: 0 auto;
            border: 2px solid black;
            
            background-color: rgba(128, 128, 128, 0.7);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .cta-button:hover {
            background-color: #333;
            color: #ffc107;
            
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
            display: block;
            margin: 0 auto;
            width: 80%;
            max-width: 125px;
        }
    </style>
</head>
<body>
    <div id = "contenedor">

	<h1>Ingresar</h1>
	<form method="post" action="/login">
        
		<label for="username">Nombre de usuario:</label>
		<input type="text" id="username" name="username"><br>

		<label for="password">Contraseña:</label>
		<input type="password" id="password" name="password"><br>

		<input type="submit" value="Ingresar">

        
	</form>
    <br>
    
    <a href="/crearCuenta" class="cta-button">Registrame</a>
	{% if message %}
		<p style="color:red;">{{ message }}</p>
	{% endif %}
    <br>
    </div>
</body>
</html>