import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final LatLng initialLocation;
  final bool isReadOnly;

  const MapScreen(
      {required this.initialLocation, this.isReadOnly = false, Key? key})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 58, 152, 185),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 13,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('p1'),
            position: _pickedPosition ?? widget.initialLocation,
          )
        },
      ),
    );
  }
}
