import 'package:flutter/material.dart';
import 'package:my_trip_app/components/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(child: Text('')),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
