import 'package:flutter/material.dart';
import 'package:my_trip_app/components/carousel.dart';
import 'trip_detail_page.dart';
import '../data/trip_data.dart';
import '../models/trip_model.dart';
import '../components/header.dart';

class TripListPage extends StatefulWidget {
  const TripListPage({super.key});

  @override
  TripListPageState createState() => TripListPageState();
}

class TripListPageState extends State<TripListPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Trip> _filteredTrips = trips;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterTrips);
  }

  void _filterTrips() {
    setState(() {
      _filteredTrips =
          trips
              .where(
                (trip) => trip.title.toLowerCase().contains(
                  _searchController.text.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        searchController: _searchController,
        onSearchChanged: (value) => _filterTrips(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Carousel(),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _filteredTrips.length,
              itemBuilder: (context, index) {
                final trip = _filteredTrips[index];
                return Card(
                  surfaceTintColor: const Color.fromARGB(255, 0, 21, 255),
                  color: Colors.blue[50],
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        trip.photoUrl,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(trip.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Harga: ${trip.price}'),
                        Row(
                          children: [
                            Text('Rate: ${trip.rating}'),
                            SizedBox(width: 4),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripDetailPage(trip: trip),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
