from flask import render_template, request, jsonify
from app import app
from models.sentiment_analysis import analyze_and_filter_comment
import pymysql

# Conectar a la base de datos
connection = pymysql.connect(
    host='localhost',
    user='root',  # Cambia esto
    password='',  # Cambia esto
    database='ComentariosDB'
)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit_comment', methods=['POST'])
def submit_comment():
    usuario = request.form['usuario']
    comentario = request.form['comentario']
    estrellas = int(request.form['estrellas'])

    filtro_value, sentiment = analyze_and_filter_comment(usuario, comentario, estrellas)
    message = ''
    if filtro_value == 0:
        message = 'Su mensaje es con intención de odio y no para aportar nada constructivo.'

    return jsonify({'status': 'success', 'sentiment': sentiment, 'message': message})

@app.route('/get_comments', methods=['GET'])
def get_comments():
    with connection.cursor() as cursor:
        select_query = "SELECT usuario, comentario, estrellas FROM Comentarios WHERE filtro = 1 ORDER BY id DESC"
        cursor.execute(select_query)
        result = cursor.fetchall()
        comments = [{'usuario': row[0], 'comentario': row[1], 'estrellas': row[2]} for row in result]
    return jsonify(comments)

@app.route('/comments')
def comments():
    return render_template('comments.html')

if __name__ == '__main__':
    app.run(debug=True)
