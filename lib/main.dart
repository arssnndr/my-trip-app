import 'package:flutter/material.dart';
import 'pages/trip_list_page.dart';

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
      home: TripListPage(),
    );
  }
}
