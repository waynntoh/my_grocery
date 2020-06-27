import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

class GoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      // final initialCoordinates = LatLng(4.85295, 100.728695);
      final destinationCoordinates = LatLng(4.8583615, 100.70704029999999);
      // final startingCoordinates = LatLng(4.8475473, 100.7503508);

      final mapOptions = MapOptions()
        ..zoom = 14.25
        ..center = destinationCoordinates
        ..zoomControl = false
        ..scaleControl = false
        ..mapTypeControl = false
        ..streetViewControl = false
        ..rotateControl = false
        ..fullscreenControl = false;

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      Marker(MarkerOptions()
        ..position = destinationCoordinates
        ..map = map
        ..title = 'Destination');

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}
