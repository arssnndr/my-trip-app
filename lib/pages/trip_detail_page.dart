import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../models/trip_model.dart';

class TripDetailPage extends StatelessWidget {
  final Trip trip;

  const TripDetailPage({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(trip.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            FullScreenImagePage(imageUrl: trip.photoUrl),
                  ),
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    trip.photoUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Icon(
                    Icons.zoom_in,
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                    size: 50,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              trip.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Harga: ${trip.price}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow[700], size: 20),
                SizedBox(width: 4),
                Text('${trip.rating}', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Ringkasan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(trip.summary, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Termasuk:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(trip.includes, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Tidak Termasuk:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(trip.excludes, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Syarat & Ketentuan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(trip.termsAndConditions, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Total Penumpang: ${trip.totalPax}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImagePage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PhotoView(
            imageProvider: AssetImage(imageUrl),
            backgroundDecoration: BoxDecoration(color: Colors.black),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
