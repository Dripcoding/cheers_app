import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:cheers_app/BreweriesState.dart';

class BreweryDetailsPage extends StatelessWidget {
  static const routeName = '/brewery_details';

  const BreweryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final breweriesState = Provider.of<BreweriesState>(context);
    final brewery = breweriesState.activeBrewery;

    if (brewery == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Brewery Details')),
        body: const Center(child: Text("No active brewery selected.")),
      );
    }

    final latitude = double.tryParse(brewery.latitude) ?? 0.0;
    final longitude = double.tryParse(brewery.longitude) ?? 0.0;

    return Scaffold(
      appBar: AppBar(title: Text(brewery.name)),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(latitude, longitude),
                zoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                  tileProvider: NetworkTileProvider(),
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(latitude, longitude),
                      builder:
                          (context) => const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 40,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Location: ${brewery.city}, ${brewery.state}'),
          ),
          // ...existing code for additional brewery details...
        ],
      ),
    );
  }
}
