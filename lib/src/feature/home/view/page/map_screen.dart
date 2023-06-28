import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final LatLng initialLocation;
  final bool isReadOnly;

  const MapScreen(
      {required this.initialLocation, this.isReadOnly = false, Key? key})
      : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

Future<BitmapDescriptor> createCustomIcon() async {
  final image = await BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(size: Size(48, 48)),
    'assets/images/pointer_restauran2.png',
  );
  return image;
}

class MapScreenState extends State<MapScreen> {
  LatLng? _pickedPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localização'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 58, 152, 185),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude,
            widget.initialLocation.longitude,
          ),
          zoom: 15,
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
