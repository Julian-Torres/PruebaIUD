from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
from datetime import datetime

from config import config

app=Flask(__name__)

conexion=MySQL(app) 

@app.route("/dias",methods=['GET'])
def listar_dias():
    try:
        cursor=conexion.connection.cursor()
        sql="SELECT * FROM diasnolaborales"
        cursor.execute(sql)
        datos=cursor.fetchall()
        dias=[]
        for i in datos:
            dia={'nombre':i[0],'inicio':i[1],'final':i[2]}
            dias.append(dia)
        return jsonify({'dias':dias})
    except Exception as ex:
        return jsonify({'mensaje':"error"})

@app.route("/dias", methods=['POST'])
def registrar_dias():
    try:
        print (request.json)
        cursor=conexion.connection.cursor()
        sql="""INSERT INTO diasnolaborales (nombre, inicio, final) 
        VALUES ('{0}','{1}','{2}')""".format(request.json['nombre'], 
        request.json['inicio'], request.json['final'])
        cursor.execute(sql)
        conexion.connection.commit() #confirma accion 
        return jsonify({'mensaje':'Registrado'})
    except Exception as ex:
        return jsonify({'mensaje':ex})

@app.route("/dias/<nombre>", methods=['DELETE'])
def borrar_dias(nombre):
    try:
        cursor=conexion.connection.cursor()
        sql="DELETE FROM diasnolaborales WHERE nombre ='{0}'".format(nombre)
        cursor.execute(sql)
        conexion.connection.commit() #confirma accion  
        return jsonify({'mensaje':'Borrado'})
    except Exception as ex:
        return jsonify({'mensaje':ex})

@app.route("/dias/<nombre>", methods=['PUT'])
def actualizar_dias(nombre):
    try:
        print (request.json)
        cursor=conexion.connection.cursor()
        sql="""UPDATE diasnolaborales SET inicio='{0}', final='{1}' 
        WHERE nombre='{2}'""".format(request.json['inicio'], request.json['final'], nombre)
        cursor.execute(sql)
        conexion.connection.commit() #confirma accion 
        return jsonify({'mensaje':'Actualizado'})
    except Exception as ex:
        return jsonify({'mensaje':ex})

@app.route("/dias/contar", methods=['GET'])
def contar_dias():
    try:
        date_format = "%Y-%m-%d"
        print (request.json)
        cursor=conexion.connection.cursor()
        sql="SELECT * FROM diasnolaborales where nombre ='{0}'".format(request.json['nombre'])
        cursor.execute(sql)
        datos=cursor.fetchone()
        print(datetime.strptime(datos[2], date_format))
        print(datetime.strptime(datos[1], date_format))
        # # c = int(b - a)
        #In=int(datos[1])
        #Fn=int(datos[2])
        #c=In+Fn
        return jsonify(5)
    except Exception as ex:
        return jsonify({'mensaje':ex})

def pagina_no_encontrada(error):
    return"<h1>La pagina que buscas no se encuentra disponible...</h1>",404


if __name__=="__main__":
    app.config.from_object(config['development'])
    app.register_error_handler(404, pagina_no_encontrada)
    app.run()