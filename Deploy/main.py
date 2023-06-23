from bottle import Bottle, request, jinja2_template, static_file, template, redirect

import json
import psycopg2
from datetime import datetime

import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart


app = Bottle()

@app.route('/')
def login():
    return jinja2_template('login.tpl', message='')

@app.route('/login', method= 'POST')
def comprobarLogin():
    nombreUsuario = request.forms.get('username')
    password = request.forms.get('password')

    # Conectar con base de datos
    conexion = psycopg2.connect(
        host="  ",
        database="  ",
        user=" ",
        password=" "
    )
    cursor = conexion.cursor()
    cursor.execute('''SELECT *
                      FROM usuario u
                    ''')
    for row in cursor:
        if nombreUsuario == row[1] and password == row[2]:
            usuarioID = row[0]
            return redirect('/inicio?usuarioID={}'.format(usuarioID))
    else:
        return jinja2_template('login.tpl', message='Contraseña o nombre de usuario incorectos')
    
@app.route('/inicio')
def index():
    usuarioID = request.query.get('usuarioID')
    conexion = psycopg2.connect(
        host="  ",
        database="  ",
        user=" ",
        password=" "
    )
    cursor = conexion.cursor()
    cursor.execute('''SELECT * 
                      FROM usuario u
                      WHERE u.usuarioID = %s''', (usuarioID,))
    for row in cursor:
        nombreUsuario = row[1]

    return template('index.tpl', usuarioID = usuarioID, nombreUsuario = nombreUsuario)


@app.route('/cerrarSesion')
def cerrarSesion():
    return jinja2_template('login.tpl', message='')

@app.route('/imagenes/<filename:path>')
def mostrarImagen(filename):
    return static_file(filename, root='./images', mimetype='image/jpg')

@app.route('/image/<filename:path>')
def mostrarImagenLogo(filename):
    return static_file(filename, root='./image', mimetype='image/x-icon')

@app.route('/js/chart.js')
def devolverJS():
    return static_file('chart.js', root='./js')

@app.route('/acercaDe')
def acercaDe():
    usuarioID = request.query.get('usuarioID')
    return template('acercaDe.tpl', usuarioID=usuarioID)

@app.route('/crearCuenta')
def crearCuenta():
    return jinja2_template('crearCuenta.tpl')

@app.route('/crearCuenta', method= 'POST')
def crearGuardarCuenta():
    print('Comenzar a crear usuario: ')
    nombreUsuario = request.forms.get('username')
    password = request.forms.get('password')
    organizacionUsuario = request.forms.get('organizacion')
    # Conectar con base de datos
    conexion = psycopg2.connect(
        host="  ",
        database="  ",
        user=" ",
        password=" "
    )
    cursor = conexion.cursor()
    # Validar que nombre de usuario existe
    cursor.execute('''SELECT *
                      FROM usuario u
                    ''')
    validacionExistencia = False                           
    for row in cursor:
        print(row[0], row[1], row[2])
        if nombreUsuario == row[1]:
            validacionExistencia = True
            # Usuario existe, se mandará mensaje de que nombre de usuario no disponible             
    if validacionExistencia == False:
        print('No existe ese usuario en la DB')
        # Obtener cantidad de formularios para asiganar ID
        cursor.execute("SELECT COUNT(*) FROM usuario")
        usuarioID = int(cursor.fetchone()[0]) + 1
        cursor.execute("INSERT INTO usuario (usuarioID, nombre, password, organizacion) VALUES (%s, %s, %s, %s)", 
                   (usuarioID, nombreUsuario, password, organizacionUsuario))
        conexion.commit()
        redirect('/')
    else:
        print('Nombre de usuario: ', nombreUsuario, 'ya existe')
        return jinja2_template('crearCuenta.tpl', message = 'Nombre de usuario no disponible')
    conexion.close()

@app.route('/recuperarPassword')
def recuperarPassword():
    return jinja2_template('recuperarPassword.tpl')

@app.route('/recuperarPassword', method= 'POST')
def recuperarPasswordPost():
    print('Comenzar a recuperar contraseña ')
    email = request.forms.get('email')
    print(email)
    smtp_server = 'smtp.gmail.com'
    smtp_port = 587  # For starttls
    smtp_username = 'MMCPCAWBIN@gmail.com'
    smtp_password = 'aleokoeoronhjnjr'
    message = MIMEMultipart()
    message['From'] = smtp_username
    receptor = email
    message['To'] = receptor
    message['Subject'] = 'Test email from Python'
    body = 'Hello, correo de prueba !'
    message.attach(MIMEText(body, 'plain'))
    smtp_session = smtplib.SMTP(smtp_server, smtp_port)
    smtp_session.starttls()
    smtp_session.login(smtp_username, smtp_password)
    smtp_session.sendmail(smtp_username, receptor, message.as_string())
    smtp_session.quit()

    print('Correo enviado : D')
    return jinja2_template('recuperarPassword.tpl')

@app.route('/cuestionario')
def cuestionario():
    usuarioID = request.query.get('usuarioID')
    print('Id de usuario obtenida de cuestioario.tpl', usuarioID)
    preguntas = []
    conexion = psycopg2.connect(
        host="  ",
        database="  ",
        user=" ",
        password=" "
    )
    cursor = conexion.cursor()
    cursor.execute('SELECT pregunta.preguntaID, pregunta.pregunta, respuesta.respuestaID, respuesta.respuesta FROM pregunta INNER JOIN respuesta ON pregunta.preguntaID=respuesta.preguntaID')
    
    pregunta_actual = None
    respuestas = []
    for row in cursor:
        pregunta_id = row[0]
        pregunta_name = row[1]
        respuesta_id = row[2]
        respuesta_name = row[3]
        if pregunta_name != pregunta_actual:
            if pregunta_actual is not None:
                preguntas.append({'preguntaID':pregunta_id_anterior, 'pregunta': pregunta_actual, 'respuestas': respuestas})
            respuestas = []
            pregunta_actual = pregunta_name
            pregunta_id_anterior = pregunta_id
        respuestas.append({'respuestaID': respuesta_id, 'respuesta': respuesta_name})
    preguntas.append({'preguntaID':pregunta_id_anterior, 'pregunta': pregunta_actual, 'respuestas': respuestas})

    print('Pregunta añadida con respuestas...')
    conexion.close()
    preguntas_json = json.dumps(preguntas, ensure_ascii=False)
    preguntas_dict = json.loads(preguntas_json)  
    print('\nPreguntas decodeadas json: ')
    return jinja2_template('cuestionario.tpl', preguntas=preguntas_dict, usuarioID = usuarioID, mensaje = '')

@app.route('/guardarFormulario', method=['POST'])
def guardarFormulario():
    conexion = psycopg2.connect(
        host="  ",
        database="  ",
        user=" ",
        password=" "
    )
    cursor = conexion.cursor()
    usuarioID = request.forms.get('usuarioID')
    print('Id de usuario obtenida de cuestioario.tpl', usuarioID)
    preguntas_json = request.forms.get('preguntas_json')
    preguntas_json = preguntas_json.replace("'", '"')
    preguntas_dict = json.loads(preguntas_json)
    selected_answers = [] 
    print('Cantidad de respuestas seleccionadas: ', len(preguntas_dict))
    for pregunta in preguntas_dict:
        pregunta_id = pregunta['preguntaID']
        pregunta_name = pregunta['pregunta']
        if request.forms.get(f"pregunta_{pregunta_id}") == None:
            respuesta_id = 0
        else:
            respuesta_id = int(request.forms.get(f"pregunta_{pregunta_id}"))
        selected_answers.append(f"{pregunta_id}, {respuesta_id}")
        
    presenciaCeros = False
    for respuesta in selected_answers:
        respuesta_id = int(respuesta.split(",")[1])
        if respuesta_id == 0:
            presenciaCeros = True
           
    print('Presencia ceros: ', presenciaCeros)
    mensaje = ''
    if presenciaCeros == True:
        print('Ceros detectados pibe')
        print('Respuestas seleccionadas:', selected_answers)
        mensaje = 'Estimado usuario, debe completar todas las respuestas.'
        conexion = psycopg2.connect(
            host="  ",
            database="  ",
            user=" ",
            password=" "
        )
        cursor = conexion.cursor()
        cursor.execute('SELECT pregunta.preguntaID, pregunta.pregunta, respuesta.respuestaID, respuesta.respuesta FROM pregunta INNER JOIN respuesta ON pregunta.preguntaID=respuesta.preguntaID')
        preguntas = []
        pregunta_actual = None
        respuestas = []
        for row in cursor:
            pregunta_id = row[0]
            pregunta_name = row[1]
            respuesta_id = row[2]
            respuesta_name = row[3]
            if pregunta_name != pregunta_actual:
                if pregunta_actual is not None:
                    preguntas.append({'preguntaID':pregunta_id_anterior, 'pregunta': pregunta_actual, 'respuestas': respuestas})
                respuestas = []
                pregunta_actual = pregunta_name
                pregunta_id_anterior = pregunta_id
            respuestas.append({'respuestaID': respuesta_id, 'respuesta': respuesta_name})
        preguntas.append({'preguntaID':pregunta_id_anterior, 'pregunta': pregunta_actual, 'respuestas': respuestas})

        print('Pregunta añadida con respuestas...')
        conexion.close()
        
        preguntas_json = json.dumps(preguntas, ensure_ascii=False)
        preguntas_dict = json.loads(preguntas_json)  
        return jinja2_template('cuestionario.tpl', preguntas = preguntas_dict, usuarioID = usuarioID, mensaje = mensaje)
    elif presenciaCeros == False:
        fechaActual = datetime.now()
        print(fechaActual)
        cursor.execute("SELECT COUNT(*) FROM formulario")
        nuevaIDFormulario = int(cursor.fetchone()[0]) + 1
        print('Cantidad de formularios en DB: ', str(nuevaIDFormulario - 1), ' nueva ID: ', nuevaIDFormulario)
        cursor.execute("INSERT INTO formulario (formularioID, fecha, usuarioID) VALUES (%s, %s, %s)", 
                    (nuevaIDFormulario, fechaActual, usuarioID))
        conexion.commit()
        print('No hay ceros seleccionados')
        print('Respuestas seleccionadas:', selected_answers)
        for answer in selected_answers:
            pregunta_id, respuesta_id = answer.split(', ')
            cursor.execute("SELECT COUNT(*) FROM relacion")
            nuevaIDRelacion = int(cursor.fetchone()[0]) + 1
            cursor.execute("INSERT INTO relacion (relacionID, respuestaID, formularioID) VALUES (%s, %s, %s)", (nuevaIDRelacion, respuesta_id, nuevaIDFormulario))
            conexion.commit()
        print('Data guardada con éxito : D')
        cursor.close()
        conexion.close()
        return redirect('/resultadoReciente?formularioID={}&usuarioID={}'.format(nuevaIDFormulario, usuarioID))

@app.route('/resultadoReciente')
def visualizarPromedioReciente():
    formularioID = request.query.get('formularioID')
    usuarioID = request.query.get('usuarioID')
    print('ID de formulario: ', formularioID)
    conexion = psycopg2.connect(
        host="  ",
        database="  ",
        user=" ",
        password=" "
    )
    cursor = conexion.cursor()
    cursor.execute('''SELECT c.categoriaID, c.categoria, d.dominioID, d.dominio,
                            AVG(r2.valor)::integer AS promedio_dominio, r3.valor, r3.recomendacion
                        FROM relacion r 
                        JOIN respuesta r2 ON r.respuestaID = r2.respuestaID 
                        JOIN pregunta p ON p.preguntaID = r2.preguntaID 
                        JOIN dominio d ON d.dominioID = p.dominioID 
                        JOIN categoria c ON c.categoriaID = d.categoriaID 
                        JOIN recomendacion r3 ON r3.dominioID = d.dominioID
                        WHERE r.formularioID = %s
                        GROUP BY d.dominioID, c.categoriaID, r3.recomendacion, r3.valor
                        HAVING AVG(r2.valor)::integer = r3.valor''', (formularioID,))
    promedioPorDominio = []
    for row in cursor:
        categoria_ID = row[0]
        categoria_texto = row[1]
        dominio_ID = row[2]
        dominio_texto = row[3]
        promedio_valor = row[4]
        recomendacion = ''
        if promedio_valor == 4:
            recomendacion = 'Sé constante, has alcanzado el máximo nivel de madurez para esta categoria. Sin embargo, es imperante mantenserse actualizados'
        else:
            recomendacion = row[6]
        promedioPorDominio.append({'categoriaID':categoria_ID, 'categoria' : categoria_texto, 'dominioID': dominio_ID, 'dominio': dominio_texto, 'promedioValor': promedio_valor, 'recomendacion' : recomendacion})
    promediosDominio_json = json.dumps(promedioPorDominio, ensure_ascii=False)
    print('\nPromedios json: ')
    promediosDominio_dict = json.loads(promediosDominio_json)  
    print('\nPromedios decodeadas json: ')
    promedioPorCategoria = []
    cursor.execute('''select c.categoriaID, c.categoria, avg(r2.valor) as promedio_categoria
                        from relacion r join respuesta r2 on r.respuestaID = r2.respuestaID 
                        join pregunta p on p.preguntaID = r2.preguntaID 
                        join dominio d on d.dominioID = p.dominioID 
                        join categoria c on c.categoriaID = d.categoriaID 
                        where r.formularioID = %s
                        GROUP BY c.categoriaID''', (formularioID,))
    for row in cursor:
        categoria_ID = row[0]
        categoria_texto = row[1]
        promedio_valor = str(int(row[2]))
        promedioPorCategoria.append({'categoriaID':categoria_ID, 'categoria' : categoria_texto, 'promedioValor': promedio_valor})
    labels = []
    data = []
    for item in promedioPorCategoria:
        labels.append(item['categoria'])
        data.append(item['promedioValor'])
    chart_data = {
        'labels': labels,
        'datasets': [{
            'label': 'Promedio por categoría',
            'data': data,
        }]
    }
    cursor.execute('''select f.formularioID, avg(r2.valor) as promedio_general
                        from formulario f 
                        join relacion r on r.formularioID  = f.formularioID 
                        join respuesta r2 on r2.respuestaID  = r.respuestaID 
                        where f.formularioID = %s
                        group by f.formularioID''', (formularioID,))
    for row in cursor:
        valorGeneral = int(row[1])
        madurezTexto = ''
        if valorGeneral == 1:
            madurezTexto = 'INICIAL.'
        elif valorGeneral == 2:
            madurezTexto = 'DEFINIDO.'
        elif valorGeneral == 3:
            madurezTexto = 'ESTABLECIDO.'
        elif valorGeneral == 4:
            madurezTexto = 'MEJORADO.'
        mensajePromedio = 'El resultado de la evaluación es: ' + str(valorGeneral) + '. esto corresponde al nivel ' + madurezTexto
    promediosCategoria_json = json.dumps(promedioPorCategoria, ensure_ascii=False)
    print('\nPromedios json: ')
    promediosCategoria_dict = json.loads(promediosCategoria_json)  
    print('\nPromedios decodeadas json: ')
    cursor.close()
    conexion.close()
    return jinja2_template('resultadoReciente.tpl', IDFormulario=formularioID, promediosDominio=promediosDominio_dict, usuarioID=usuarioID, chart_data=chart_data, mensajePromedio = mensajePromedio)

@app.route('/misFormularios')
def misFormularios():
    usuarioID = request.query.get('usuarioID')
    print('ID de usuario: ', usuarioID)
    conexion = psycopg2.connect(
        host="  ",
        database="  ",
        user=" ",
        password=" "
    )
    cursor = conexion.cursor()
    cursor.execute('''SELECT f.formularioID, f.fecha 
                        FROM formulario f 
                        WHERE f.usuarioID  = %s''', (usuarioID,))
    formularioUsuario = []
    formulario_ID = 1
    for row in cursor:
        fecha = str(row[1])
        formularioUsuario.append({'formularioID':formulario_ID, 'fecha': fecha})
        formulario_ID = formulario_ID + 1
    formulario_json = json.dumps(formularioUsuario, ensure_ascii=False)
    formularios_dict = json.loads(formulario_json)  
    print('\nFormnularios decodeadas json: ')
    print(formularios_dict)

    return jinja2_template('misFormularios.tpl', formularios=formularios_dict, usuarioID = usuarioID)


if __name__ == '__main__':
    app.run(host = 'localhost', port = 8080, debug = True)