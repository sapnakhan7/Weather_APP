class Weather{
  final String CityName;
  final double temperature;
  final String mainCondition;

  Weather ({
    required this.CityName,
    required this.temperature,
    required this.mainCondition,
});

  factory Weather.fromjson(Map<String, dynamic>json){
    return Weather(
        CityName: json['name'],
        temperature: json['main']['temp'].toDouble(),
        mainCondition: json['weather'][0]['main'],
    );
  }
}