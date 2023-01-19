import datetime
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    dateNow = datetime.date.today().strftime("%Y/%m/%d")
    return jsonify(date=dateNow, version="v1")

if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0', port='8080')
