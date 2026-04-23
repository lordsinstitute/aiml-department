from flask import Flask, render_template, request
import pandas as pd
import pickle
import re
import string
from nltk.tokenize import RegexpTokenizer
from nltk.stem import PorterStemmer, WordNetLemmatizer

app = Flask(__name__)

# Load model and vectorizer
model = pickle.load(open("model.bin", "rb"))
vectoriser = pickle.load(open("tdf_vectorizer", "rb"))

# ================= PREPROCESSING ================= #

def clean_stopwords(text):
    stopwordlist = [
        'a','about','above','after','again','all','am','an','and','any','are','as','at',
        'be','because','been','before','being','below','between','both','by','can','did',
        'do','does','doing','down','during','each','few','for','from','further','had',
        'has','have','having','he','her','here','hers','herself','him','himself','his',
        'how','i','if','in','into','is','it','its','itself','just','me','more','most',
        'my','myself','no','nor','not','now','of','on','once','only','or','other','our',
        'ours','ourselves','out','own','same','she','should','so','some','such','than',
        'that','the','their','theirs','them','themselves','then','there','these','they',
        'this','those','through','to','too','under','until','up','very','was','we',
        'were','what','when','where','which','while','who','whom','why','with','you',
        'your','yours','yourself','yourselves'
    ]
    STOPWORDS = set(stopwordlist)
    return " ".join([word for word in text.split() if word not in STOPWORDS])

def preprocess(text):
    text = text.lower()
    text = clean_stopwords(text)
    text = text.translate(str.maketrans('', '', string.punctuation))
    text = re.sub(r'(.)\1+', r'\1', text)
    text = re.sub(r"http\S+|www\S+", "", text)
    text = re.sub(r'\d+', '', text)

    tokenizer = RegexpTokenizer('\w+')
    tokens = tokenizer.tokenize(text)

    stemmer = PorterStemmer()
    lemmatizer = WordNetLemmatizer()

    tokens = [stemmer.stem(word) for word in tokens]
    tokens = [lemmatizer.lemmatize(word) for word in tokens]

    return " ".join(tokens)

# ================= ROUTES ================= #

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    tweet = request.form['tweet']

    processed = preprocess(tweet)
    vector = vectoriser.transform([processed])
    pred = model.predict(vector)[0]

    labels = {
        0: "Age",
        1: "Ethnicity",
        2: "Gender",
        3: "Not Cyberbullying",
        4: "Other Cyberbullying",
        5: "Religion"
    }

    prediction = labels[pred]

    # IMAGE SELECTION (Streamlit logic converted to Flask)
    image_map = {
        "Age": "age_cyberbullying.png",
        "Ethnicity": "ethnicity_cyberbullying.png",
        "Gender": "gender_cyberbullying.png",
        "Not Cyberbullying": "not_cyberbullying.png",
        "Other Cyberbullying": "other_cyberbullying.png",
        "Religion": "religion_cyberbullying.png"
    }

    image_file = image_map.get(prediction)

    return render_template(
        'result.html',
        tweet=tweet,
        prediction=prediction,
        image=image_file
    )


if __name__ == '__main__':
    app.run(debug=True)
