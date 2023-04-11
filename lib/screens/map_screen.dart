import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../config.dart';
import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  const MapScreen({
    Key? key,
    this.initialLocation =
        const PlaceLocation(latitude: 23.0917, longitude: 72.5975),
    this.isSelecting = false,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? markedLocation;

  @override
  void initState() {
    markedLocation = LatLng(
        widget.initialLocation.latitude, widget.initialLocation.longitude);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.isSelecting
            ? const Text("Choose Location")
            : const Text("Picture Location"),
        actions: [
          if (widget.isSelecting)
            IconButton(
                onPressed:
                    (markedLocation == null || widget.isSelecting == false)
                        ? null
                        : () {
                            Navigator.pop(context, markedLocation as LatLng);
                          },
                icon: const Icon(Icons.check))
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(widget.initialLocation.latitude,
              widget.initialLocation.longitude),
          zoom: 15,
          onTap: !widget.isSelecting
              ? null
              : (tapPosition, markedData) {
                  setState(() {
                    markedLocation = markedData;
                  });
                },
        ),
        nonRotatedChildren: [
          AttributionWidget(attributionBuilder: (_) {
            return Container(
                margin: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: const Text(
                  "Powered by GeoApify",
                  style: TextStyle(
                      color: Colors.yellow, backgroundColor: Colors.black54),
                ));
          }),
        ],
        children: [
          TileLayer(
            urlTemplate:
                'https://maps.geoapify.com/v1/tile/dark-matter-yellow-roads/{z}/{x}/{y}.png?apiKey=$API_KEY',
            userAgentPackageName: 'com.example.app',
          ),
          // if (widget.isSelecting)
          MarkerLayer(
            markers: [
              Marker(
                point: markedLocation!,
                width: 50,
                height: 50,
                builder: (context) => const Icon(
                  Icons.location_on,
                  color: Colors.redAccent,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
