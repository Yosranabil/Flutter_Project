class weather{

  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var gust;
  var uv;
  var pressure;
  var pricipe;
  var last_update;
  var feels_like;
  var hours;

  weather({
    required this.cityName,
    required this.icon,
    required this.condition,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.wind_dir,
    required this.gust,
    required this.uv,
    required this.pressure,
    required this.pricipe,
    required this.last_update,
    required this.feels_like,
    required this.hours,
  });

  weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    wind_dir = json['current']['wind_dir'];
    gust = json['current']['gust_kph'];
    uv = json['current']['uv'];
    pressure = json['current']['pressure_mb'];
    pricipe=  json['current']['precip_mm'];
    last_update = json['current']['last_updated'];
    feels_like = json['current']['feelslike_c'];
    hours = json['forecast']['forecastday'][0]['hour'];
  }
//
}