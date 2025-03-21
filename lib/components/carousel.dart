import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_trip_app/pages/trip_detail_page.dart';
import '../data/trip_data.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final height = isLandscape ? 150.0 : 200.0;

    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        reverse: true,
        enlargeCenterPage: true,
      ),
      items:
          trips.map((trip) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TripDetailPage(trip: trip),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.blue[50]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            trip.photoUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              child: Text(
                                trip.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
    );
  }
}
