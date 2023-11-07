import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Карты"),
        backgroundColor: Colors.pink,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(43.2557, 76.9450), // Координаты Алматы
          zoom: 14.0,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('almaty'),
            position: LatLng(43.2557, 76.9450),
            infoWindow: InfoWindow(title: 'Алматы'),
          ),
        },
      ),
    );
  }
}