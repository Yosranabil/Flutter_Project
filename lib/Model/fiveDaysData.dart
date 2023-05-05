class FiveDaysData{
  String dateTime;
  int temp;

  FiveDaysData({required this.dateTime,required this.temp});

  factory FiveDaysData.fromJson(Map<String, dynamic> json) {
    return FiveDaysData(
      dateTime: json["dateTime"],
      temp: int.parse(json["temp"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "dateTime": this.dateTime,
      "temp": this.temp,
    };
  }

//
}