import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng InitialPointer = LatLng(-15.83421, -47.91331);

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<StatefulWidget> createState() => _MapsPageState();
}

class _MapsPageState extends State<Maps> {
  late GoogleMapController mapController;
  Map<String, Marker> _markers = {};

  void initState() {
    super.initState();
    loadMarkersFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: InitialPointer,
          zoom: 15,
        ),
        onMapCreated: (controller) {
          mapController = controller;
          _markers.forEach((_, marker) {
            addMarker(marker.markerId.value, marker.position,
                "title" /*marker.infoWindow*/); //posição inicial...
          });
        },
        markers: _markers.values.toSet(),
      ),
    );
  }

  addMarker(String markerId, LatLng localization, String title) {
    var marker = Marker(
      markerId: MarkerId(markerId),
      position: localization,
      infoWindow: InfoWindow(title: title),
    );

    _markers[markerId] = marker;
    setState(() {});
  }

  Future<void> loadMarkersFromJson() async {
    final jsonString = await rootBundle.loadString('assets/restaurantes.json');
    final data = jsonDecode(jsonString) as List<dynamic>;

    data.forEach((item) {
      final latitude = item['latitude'] as double?;
    });
  }
}
