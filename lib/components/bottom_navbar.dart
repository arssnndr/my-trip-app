import 'package:flutter/material.dart';
import 'package:my_trip_app/pages/trip_list_page.dart';
import 'package:my_trip_app/pages/home_page.dart';
import 'package:my_trip_app/pages/account_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  static final List<Widget> _widgetOptions = <Widget>[
    TripListPage(),
    OrientationBuilder(
      builder: (context, orientation) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/under-construction.gif',
                width: orientation == Orientation.landscape ? 300 : null,
              ),
              const SizedBox(height: 10),
              const Text('"Whislist" Page is Under Construction...'),
            ],
          ),
        );
      },
    ),
    OrientationBuilder(
      builder: (context, orientation) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/under-construction.gif',
                width: orientation == Orientation.landscape ? 300 : null,
              ),
              const SizedBox(height: 10),
              const Text('"Your Orders" Page is Under Construction...'),
            ],
          ),
        );
      },
    ),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (Route<dynamic> route) => false,
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
      _pageController.jumpToPage(index);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children:
            _widgetOptions.map((Widget widget) {
              return Navigator(
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(builder: (context) => widget);
                },
              );
            }).toList(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Your Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey.shade700,
      ),
    );
  }
}
