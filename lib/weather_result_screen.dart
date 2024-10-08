
import 'package:flutter/material.dart';
import 'weather_service.dart';
import 'weather_screen.dart';

class WeatherResultScreen extends StatefulWidget {
  final String city;
  WeatherResultScreen({required this.city});

  @override
  _WeatherResultScreenState createState() => _WeatherResultScreenState();
}

class _WeatherResultScreenState extends State<WeatherResultScreen> {
  late Future<Map<String, dynamic>> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = WeatherService().getWeather(widget.city);
  }


  String getBackgroundImage(String description) {
    if (description.contains("cloud")) {
      return 'assets/cloudy.jpg';
    } else if (description.contains("clear")) {
      return 'assets/clear.jpg';
    } else if (description.contains("sun")) {
      return 'assets/sunny.jpg';
    } else if (description.contains("rain")) {
      return 'assets/rainy2.jpg';
    } else {
      return 'assets/default.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white,)),
        backgroundColor: Colors.deepPurple[300],
        title: Text("Weather in ${widget.city}",style: TextStyle(color: Colors.white),),
      ),
      body: Stack(
        children: [
          FutureBuilder<Map<String, dynamic>>(
            future: weatherData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                final weather = snapshot.data!;
                final temperature = weather['main']['temp'];
                final description = weather['weather'][0]['description'];
                final iconCode = weather['weather'][0]['icon'];


                String backgroundImage = getBackgroundImage(description);

                return Stack(
                  children: [
                    // Background Image
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(backgroundImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      color: Colors.black.withOpacity(0.4),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "$temperature°C",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        Text(
                          description,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Image.network(
                          'https://openweathermap.org/img/wn/$iconCode@2x.png',
                          scale: 0.5,
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}


















































































































// import 'package:flutter/material.dart';
// import 'weather_service.dart';
//
// class WeatherResultScreen extends StatefulWidget {
//   final String city;
//   WeatherResultScreen({required this.city});
//
//   @override
//   _WeatherResultScreenState createState() => _WeatherResultScreenState();
// }
//
// class _WeatherResultScreenState extends State<WeatherResultScreen> {
//   late Future<Map<String, dynamic>> weatherData;
//
//   @override
//   void initState() {
//     super.initState();
//     weatherData = WeatherService().getWeather(widget.city);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Weather in ${widget.city}"),
//       ),
//       body: Stack(
//         children: [
//
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/sky.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//
//           Container(
//             color: Colors.black.withOpacity(0.4),
//           ),
//           // FutureBuilder for weather data
//           FutureBuilder<Map<String, dynamic>>(
//             future: weatherData,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text("Error: ${snapshot.error}"));
//               } else {
//                 final weather = snapshot.data!;
//                 final temperature = weather['main']['temp'];
//                 final description = weather['weather'][0]['description'];
//                 final iconCode = weather['weather'][0]['icon'];
//
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       "$temperature°C",
//                       style: TextStyle(fontSize: 40, color: Colors.white),
//                     ),
//                     Text(
//                       description,
//                       style: TextStyle(fontSize: 20, color: Colors.white),
//                     ),
//                     Image.network(
//                       'https://openweathermap.org/img/wn/$iconCode@2x.png',
//                       scale: 0.5,
//                     ),
//                   ],
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
