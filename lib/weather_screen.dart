import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'weather_result_screen.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true, /// Allows background to extend behind AppBar
      body: Stack(
        children: [

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sky3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Lottie.asset(
                  'assets/sun2.json',
                  width: 250,
                  height: 250,
                  fit: BoxFit.fill,
                ),

                SizedBox(height: 20),


                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter city name",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.deepPurple.withOpacity(0.2),
                  ),
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  onChanged: (value) {
                    setState(() {
                      city = value;
                    });
                  },
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (city.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WeatherResultScreen(city: city),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Get Weather",
                    style: TextStyle(color: Colors.purple[600]),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
