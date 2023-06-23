<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Crear cuenta</title>
    <link rel="shortcut icon" href="/image/UPC_logo_transparente_1.ico" type="image/x-icon">

     <style>
        body {
            background-image: url("/imagenes/login_fondo.jpg");
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            color: #333;
        }

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
        h7{
            text-align: center;
            justify-content: center;
            align-items: center;
        }
        .centrar{
            text-align: center;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <div id = "contenedor">
        <h1>Recuperar contraseña</h1>
        {% if message %}
            <p style="color:red;">{{ message }}</p>
        {% endif %}
        <form method="post" action="/recuperarPassword">
            <div class = "centrar">
                <h7> Ingrese su email. De estar registrado le llegará un correo con sus credenciales</h7>
            </div>
            <br>
            <label for="email">Email de usuario:</label>
            <input type="text" id="email" name="email"><br>


            <input type="submit" value="Recuperar">
            
        </form>
        <br>
        <br>
    </div>
	
</body>
</html>