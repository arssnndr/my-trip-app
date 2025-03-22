import 'package:flutter/material.dart';
import 'package:my_trip_app/components/bottom_navbar.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Page')),
      body: Center(child: Text('This is the List Page')),
      bottomNavigationBar: BottomNavBar(), // Add BottomNavBar
    );
  }
}
