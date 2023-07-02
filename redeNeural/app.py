from flask import Flask
from flask import Flask, jsonify, request, make_response
from Main import RedeNeuralCalibrada
import json


app = Flask(__name__)
rede = RedeNeuralCalibrada()

@app.route('/', methods = ['POST', 'OPTIONS'])
def recomendacoes():
    if request.method == 'OPTIONS':
        response = make_response()
        response.headers.add('Access-Control-Allow-Origin', '*')
        response.headers.add('Access-Control-Allow-Headers', 'Content-Type')
        response.headers.add('Access-Control-Allow-Methods', 'POST')

        return response

    request_data = request.get_json()
    rede.calcula_recomendacoes(request_data)
    response = jsonify(request_data)
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type')
    return response

if __name__ == '__main__':
    app.run()