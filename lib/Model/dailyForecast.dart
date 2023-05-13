
class DailyForecast {
  var date;
  var maxTemp;
  var minTemp;
  var condition;
  //var icon;
  var maxIcon;
  var minIcon;
  var rainChance;
  DailyForecast({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.maxIcon,
    required this.minIcon,
    required this.rainChance,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    var hours = json['hour'] as List<dynamic>;
    var nightHours = json['hour'] as List<dynamic>;
    return DailyForecast(
      date: json['date'],
      maxTemp: json['day']['maxtemp_c'].toDouble(),
      minTemp: json['day']['mintemp_c'].toDouble(),
      condition: json['day']['condition']['text'],
      maxIcon:hours[12]['condition']['icon'],
      minIcon:nightHours[0]['condition']['icon'],
      rainChance:json['day']['daily_chance_of_rain'],
    );
  }
}