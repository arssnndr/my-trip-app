import 'package:flutter/material.dart';
import 'package:my_trip_app/pages/list_page.dart'; // Import ListPage

void main() {
  runApp(TripApp());
}

class TripApp extends StatelessWidget {
  const TripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Trip App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return ListPage(); // Set initial route to ListPage
            },
          );
        },
      ),
    );
  }
}
