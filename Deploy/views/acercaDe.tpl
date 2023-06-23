<!DOCTYPE html>
<html>
<head>
	<title>Acerca de</title>
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

    <style>
    <style>
        .imagen {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .imagen img {
            width: 100%;
            height: 350px;
            opacity: 0.45;
        }

        .texto-imagen {
            position: absolute;
            top: 25%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .texto-imagen h1 {
            margin: 0;
            font-size: 36px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .padre {
            display: flex;
            justify-content: center;
            border: solid 3px black:
        }
        .hijo1 {
            flex-basis: 50%; /* Adjust the percentage value according to your needs */
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: justify;
            vertical-align: middle;
            padding: 30px;
        }

        .hijo2 {
            flex-basis: 50%; /* Adjust the percentage value according to your needs */
            weight: 100%;
            padding: 30px;
            text-align: justify;

        }
        #imagenAcerca{
            height: 100%;
            width: 100%;
        }
        
        .imagenFondo{
            background-image: url("/imagenes/acerca_de.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            height: 400px;

        }
        .textoImagen{
            background-color: #2c3e50;
            border: 3px solid #2c3e50;
            border-radius: 15px;
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 20%;
            height: 10%;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 19px;
            color: #ffffff;
            opacity: 0.80;
        }
        .Contenedor{
            border: 3px solid #2c3e50;
            padding: 20px;
            border-radius: 15px;   
        }

</style>
   

    

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
	<div class="imagenFondo">
        <br>
       <div class = "textoImagen">
            ACERCA DE
        </div>
    </div>
    
    <div class="contenido">

        <div class = "padre">
            <div class = "hijo1">
                <div class = "Contenedor">
                    <h4> FINALIDAD DE LA APLICACION </h4><br>
                    <p> 
                        La aplicación web que presentamos tiene como finalidad principal brindar un enfoque integral para la prevención de ciberataques en aplicaciones web, basado en los estándares reconocidos internacionalmente como la norma ISO 27032 y el CSF de NIST. 
                        Nuestro objetivo es proporcionar a los usuarios de cualquier organizacion una herramienta confiable y efectiva que les permita evaluar y mejorar la madurez en ciberseguridad de sus aplicaciones web. Sabemos que los ciberataques son una amenaza creciente en el mundo digital, y es fundamental contar con una sólida defensa para proteger los datos y la privacidad de los usuarios. 
                        Con nuestra aplicación, las organizaciones podrán realizar evaluaciones exhaustivas de sus aplicaciones web, identificar posibles vulnerabilidades y riesgos de seguridad, y obtener recomendaciones claras y prácticas para fortalecer sus defensas.   
                        Nos enorgullece ofrecer una solución que combine la experiencia en ciberseguridad y los estándares reconocidos internacionalmente, brindando a nuestros usuarios una herramienta confiable y actualizada para mantener sus aplicaciones web seguras en un entorno cada vez más desafiante. Para ello, se puede encontrar un formulario de 36 preguntas, cada 3 preguntas representan un dominio lo que da 12 dominios en total. Dichos dominios estan divididos en 4 categorias, 3 basadas en el CSF de NIST: Identificar, Proteger y Detectar, y la ultima construida a partir de la norma ISO 27032: Prevenir. 
                        Estamos comprometidos con la protección de los datos y la confidencialidad de nuestros usuarios, y trabajamos continuamente para mejorar y adaptar nuestro modelo a las nuevas amenazas y desafíos de seguridad. Esperamos que nuestra aplicación web sea una herramienta valiosa para aquellos que buscan fortalecer su postura de seguridad y proteger sus aplicaciones web contra ciberataques. 

                    </p>
                </div>
            </div>
            <div class = "hijo2" id = "imagen1">
                <img src="/imagenes/imagen1.jpg" alt="My Image"  id = "imagenAcerca">
            </div>
        </div>

        <div class = "padre">
            <div class = "hijo2">
                <img src="/imagenes/imagen4.jpg" alt="My Image"  id = "imagenAcerca">
            </div>
            <div class = "hijo1">
                <div class = "Contenedor">
                    <h4> EL EQUIPO DE DESARROLLO </h4> <br>
                    <p> 
                        Somos un equipo de desarrollo apasionado formado por dos estudiantes de Ingeniería de Sistemas de Información, Ethan Sebastian Arenas Rodriguez y Juan Jose Palomino Villasante. Nos unimos con el propósito de crear una solución innovadora que aborde la creciente amenaza de ciberataques en aplicaciones web. 
                        Nuestra formación académica en ingeniería de sistemas de información nos ha proporcionado una sólida base de conocimientos en programación, seguridad informática y estándares de la industria. Además, hemos invertido tiempo y esfuerzo en especializarnos en ciberseguridad y en comprender las mejores prácticas recomendadas por organismos internacionales como ISO y NIST. 
                        Nos apasiona la seguridad en línea y estamos comprometidos con la protección de los datos y la privacidad de los usuarios. Hemos canalizado nuestro entusiasmo y conocimientos técnicos en el desarrollo de esta aplicación web basada en un Modelo de Madurez en Ciberseguridad para prevenir ciberataques en aplicaciones web. 
                        A través de un trabajo colaborativo y en equipo, hemos combinado nuestras habilidades complementarias para crear una solución efectiva y fácil de usar. Hemos diseñado una interfaz intuitiva y amigable que permite a los usuarios evaluar rápidamente la seguridad de sus aplicaciones web y tomar medidas para fortalecer sus defensas. 
                        Nuestro objetivo principal es brindar una herramienta confiable y actualizada que empodere a las organizaciones para proteger sus aplicaciones web de los ciberataques. Estamos comprometidos con la excelencia y la mejora continua, por lo que siempre estamos atentos a los comentarios y sugerencias de nuestros usuarios para seguir mejorando y adaptando nuestra aplicación a sus necesidades. 
                        Agradecemos profundamente el apoyo y la confianza de todos nuestros usuarios, y esperamos seguir siendo una opción confiable y valiosa en la protección de aplicaciones web contra amenazas cibernéticas. 
 
                    </p>
                </div>
            </div>
        </div>

        <div class = "padre">
            <div class = "hijo1">
                <div class = "Contenedor">
                    <h4> TECNOLOGIAS UTILIZADAS </h4> <br>
                    <p> 
                        Nuestra aplicación web se ha desarrollado utilizando una combinación de tecnologías modernas y sólidas. En el backend, hemos utilizado el framework Bottle de Python, una herramienta eficiente y flexible que nos ha permitido construir una aplicación robusta y escalable. 
                        El framework Bottle nos ha proporcionado un entorno de desarrollo ágil y potente para implementar la lógica del servidor, manejar las rutas y las solicitudes HTTP, y gestionar la seguridad de la aplicación. Su estructura ligera y su sintaxis sencilla han facilitado la integración con bases de datos para un rendimiento óptimo. 
                        En cuanto al frontend, hemos utilizado un enfoque basado en estándares web ampliamente reconocidos. Hemos utilizado HTML, CSS y JavaScript para crear una interfaz de usuario atractiva y responsiva. HTML nos ha permitido estructurar y organizar el contenido de manera semántica, mientras que CSS ha sido utilizado para el diseño y la presentación visual de la aplicación. JavaScript nos ha permitido agregar interactividad y funcionalidad dinámica a través de bibliotecas. 
                        Nuestro enfoque en el desarrollo de la aplicación web ha sido utilizar tecnologías bien establecidas y probadas para garantizar la estabilidad, la seguridad y la escalabilidad de nuestra solución. Continuamos investigando y actualizándonos constantemente sobre las últimas tendencias y mejores prácticas en el desarrollo web para asegurarnos de que nuestra aplicación se mantenga al día con los estándares y requisitos cambiantes. 
                        Estamos orgullosos del resultado final y confiamos en que las tecnologías que hemos utilizado proporcionan una base sólida y confiable para nuestra aplicación web, brindando a los usuarios una experiencia fluida y segura en su uso. 

                    </p>
                </div>
            </div>
            <div class = "hijo2">
                <img src="/imagenes/imagen3.jpg" alt="My Image" id = "imagenAcerca">
            </div>
        </div>

        <div class = "padre">
            <div class = "hijo2">
                <img src="/imagenes/imagen2.jpg" alt="My Image"  id = "imagenAcerca">
            </div>
            <div class = "hijo1">
                <div class = "Contenedor">
                    <h4> POLITICAS DE PRIVACIDAD Y SEGURIDAD </h4>
                    <p> 
                        En nuestra aplicación web, la privacidad y seguridad de los datos de nuestros usuarios son de máxima importancia. Nos comprometemos a tratar los datos con el debido cuidado y a implementar medidas de seguridad rigurosas para proteger la información confidencial.
                    </p>
                </div>
            </div>
        </div>

      

    </div>
</div>
</body>