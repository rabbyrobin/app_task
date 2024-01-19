from flask import Flask, jsonify
import platform
from datetime import datetime
import requests

app = Flask(__name__)

# Function to get weather data for Dhaka from a 3rd party API
def get_weather():
    # Replace 'YOUR_API_KEY' with your actual OpenWeatherMap API key
    api_key = '422ee145656b75293039f390314917f4'
    city = 'Dhaka'
    base_url = f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}'

    try:
        response = requests.get(base_url)
        data = response.json()
        weather_description = data['weather'][0]['description']
        temperature = data['main']['temp']
        return {
            'city': city,
            'weather_description': weather_description,
            'temperature': temperature
        }
    except Exception as e:
        return {'error': f'Error fetching weather data: {str(e)}'}

# Endpoint to return combined information including weather data
@app.route('/api/task')
def get_combined_info():
    hostname = platform.node()
    current_datetime = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    api_version = "1.0"  # Change this to your API version
    weather_data = get_weather()

    response_data = {
        'hostname': hostname,
        'datetime': current_datetime,
        'version': api_version,
        'weather': {
            'Dhaka': weather_data
        }
    }

    return jsonify(response_data)

# Endpoint for health check
@app.route('/health')
def health_check():
    return jsonify({'status': 'OK'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
