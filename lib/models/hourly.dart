class Hourly {
  final int dt;
  final double temperature;
  final double feelsLike;
  final double uvi;
  final double dewPoint;
  final String description;
  final double pressure;
  final double visibility;
  final double wind;
  final String icon;

  Hourly({required this.dt, required this.temperature, required this.feelsLike, required this.uvi, 
    required this.dewPoint, required this.description, required this.pressure, required this.visibility, required this.wind, required this.icon,});

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      dt: json['dt'].toInt(),
      temperature: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      uvi: json['uvi'].toDouble(),
      dewPoint: json['dew_point'].toDouble(),
      description: json['weather'][0]['description'],
      pressure: json['pressure'].toDouble(),
      visibility: json['visibility'].toDouble(),
      wind: json['wind_speed'].toDouble(),
      icon: json['weather'][0]['icon'],
    );
  }
}