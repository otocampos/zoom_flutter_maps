import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static const double defaultLevelZoom = 15;
 late int zoomIn;
 late int zoomOut;

  Set<int> zoomListValues = {defaultLevelZoom.toInt()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(-22.908333, -43.196388),
        zoom: defaultLevelZoom,
      ),
      zoomGesturesEnabled: true,
      onCameraMove: (CameraPosition cameraPosition) {
        var cameraZoomValue = cameraPosition.zoom;


        zoomOut = zoomListValues
            .singleWhere((element) => element == cameraZoomValue.toInt(), orElse: () => -1);

        zoomListValues.add(cameraZoomValue.toInt());
        zoomIn = zoomListValues.singleWhere(
            (element) => element == cameraZoomValue.toInt() - 1,
            orElse: () => -1);

        if (zoomOut == -1) {
          print("zoom out");

          const snackBar = SnackBar(
            duration: Duration(milliseconds: 100),
            content: Text('zoom out'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (zoomIn > 0) {
          print("zoom in");

          const snackBar = SnackBar(
            content: Text('zoom in'),
            duration: Duration(milliseconds: 100),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          zoomListValues.remove(zoomIn);
        }

        //  print(cameraPosition.zoom.isLowerThan(7));
      },
      minMaxZoomPreference: const MinMaxZoomPreference(6, defaultLevelZoom),
      mapType: MapType.normal,
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
    ));
  }
}
