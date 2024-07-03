import pymysql
from transformers import pipeline
from profanity import profanity
import nltk

# Descargar recursos necesarios para NLTK
nltk.download('punkt')

# Conectar a la base de datos
connection = pymysql.connect(
    host='localhost',
    user='root',  # Cambia esto
    password='',  # Cambia esto
    database='ComentariosDB'
)

# Especificar el modelo de análisis de sentimientos
model_name = "distilbert/distilbert-base-uncased-finetuned-sst-2-english"
sentiment_analyzer = pipeline('sentiment-analysis', model=model_name)

# Cargar palabras ofensivas manualmente si es necesario
offensive_words = set(["puta", "mierda", "idiota", "carajo", "estupido", "estúpido", "Crow"])  # Añade las palabras ofensivas aquí

def is_offensive(text):
    # Usar profanity para detectar si el texto es ofensivo
    if profanity.contains_profanity(text):
        return True
    
    # Dividir el texto en palabras y verificar cada una
    words = nltk.word_tokenize(text.lower())
    return any(word in offensive_words for word in words)

def analyze_and_filter_comment(usuario, comentario, estrellas):
    # Analizar sentimiento
    sentiment = sentiment_analyzer(comentario)[0]

    # Determinar si el comentario es ofensivo
    filtro_value = 1 if sentiment['label'] in ['POSITIVE', 'NEUTRAL'] else 0
    if is_offensive(comentario):
        filtro_value = 0

    # Insertar comentario en la base de datos
    with connection.cursor() as cursor:
        insert_query = "INSERT INTO Comentarios (usuario, comentario, estrellas, filtro) VALUES (%s, %s, %s, %s)"
        cursor.execute(insert_query, (usuario, comentario, estrellas, filtro_value))
    connection.commit()
    
    return filtro_value, sentiment

# Cerrar la conexión al final del módulo
def close_connection():
    if connection.open:
        connection.close()
