// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '../widgets/index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:map_polyline_draw/map_polyline_draw.dart';

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    Key? key,
    this.width,
    this.height,
    required this.initial,
    required this.desti,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng initial;
  final LatLng desti;

  @override
  _NewCustomWidgetState createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return MapPolyLineDraw(
      apiKey: "AIzaSyBssFwtKUm1SeYwXoX2mcHCqrGez2r6eP4",
      firstPoint:
          MapPoint(((widget.initial).latitude), ((widget.initial).longitude)),
      secondPoint:
          MapPoint(((widget.desti).latitude), ((widget.desti).longitude)),
      myLocationEnabled: true,
      markerOneOnTap: () {
        print("Marker One Tap");
      },
      markerTwoOnTap: () {
        print("Marker Two Tap");
      },
      // trafficEnable: true,
      markerOneInfoText: "Votre Position",
      markerTwoInfoText: "Position Client",
      showMarkerOne: true,
      showMarkerTwo: true,
      // firstPointMarkerIcon: 'assets/images/map.png',
      // secondPointMarkerIcon: 'assets/images/map.png',
      lineColor: Color.fromARGB(255, 60, 32, 135),
      lineWidth: 10,
      mapZoom: 14,
      firstMarkerIconWidth: 128,
      secondMarkerIconWidth: 128,
    );
  }
}