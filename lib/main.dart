import 'package:flutter/material.dart';
import 'package:my_trip_app/pages/trip_list_page.dart';
import 'package:my_trip_app/components/bottom_navbar.dart';

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
      home: Container(
        color: Colors.blue,
        child: SafeArea(
          child: Scaffold(
            body: Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (BuildContext context) {
                    return TripListPage();
                  },
                );
              },
            ),
            bottomNavigationBar: BottomNavBar(),
          ),
        ),
      ),
    );
  }
}
