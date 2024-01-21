Weather Information API

Overview:

This Flask application serves as an API to provide combined information, including system details, current datetime, and weather data for Dhaka. The weather data is fetched from the OpenWeatherMap API.

Getting Started:
1. Clone the repository to your local machine.
| git clone https://github.com/rabbyrobin/app_task.git

2. Obtain an OpenWeatherMap API key (In this case I obtained from my account and putted the key in a different file). Sign up for an account on OpenWeatherMap.
Generate an API key from your account dashboard.

3. Create a config.py file in the project directory and put the key there not to expose it inside the code.
 | config.py
OPENWEATHERMAP_API_KEY = 'your_openweathermap_api_key'

4. Run the Flask application.
 | python app.py

5. Endpoints
a. /api/task
Method: GET
Description: Returns combined information, including system details, current datetime, and weather data for Dhaka.

Example Response:
{
  "hostname": "your-hostname",
  "datetime": "2024-01-21 12:34:56",
  "version": "1.0",
  "weather": {
    "Dhaka": {
      "city": "Dhaka",
      "weather_description": "Clear sky",
      "temperature": "In Kelvin"
    }
  }
}

2. /health
Method: GET
Description: Endpoint for health check.
Example Response:

{
  "status": "OK"
}

Notes:
The application fetches weather data for Dhaka from the OpenWeatherMap API. Make sure to replace 'your_openweathermap_api_key' in the config.py file with your actual API key.
The datetime is adjusted to GMT +6 for Dhaka.
The application runs on http://0.0.0.0:5000/ by default. It will let the app to obtain the system ip address.