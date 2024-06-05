from flask import Flask, render_template, request
import requests

app = Flask(__name__)

# Define la clave de API y la URL base para la API de Alpha Vantage
API_KEY = 'ZB89AWVGIRC5XMQL'
BASE_URL = 'https://www.alphavantage.co/query'

#Obtiene el precio actual de una acción
def get_price(symbol):
    params = {
        'function': 'TIME_SERIES_INTRADAY',
        'symbol': symbol, #especificar el simbolo de la acción que desea consultar
        'interval': '5min',
        'apikey': API_KEY
    }
    
    # Realiza la solicitud a la API
    response = requests.get(BASE_URL, params=params)
    data = response.json()
    
    #Extrae la información del precio de cierre de la accion
    try:
        last_refreshed = data['Meta Data']['3. Last Refreshed']
        stock_price = data['Time Series (5min)'][last_refreshed]['4. close']
        return float(stock_price)
    except KeyError:
        return "Error fetching data"
#controla la pagina principal
@app.route('/')
def index():
    return render_template('index.html')

#Obtiene los símbolos de las acciones del formulario
@app.route('/get_price', methods=['POST'])
def get_price_route():
    symbols_input = request.form.get('symbols')
    symbols = [symbol.strip() for symbol in symbols_input.split(',')]
    
    stock_prices = {symbol: get_price(symbol) for symbol in symbols}
    
    return render_template('index.html', stock_prices=stock_prices)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
