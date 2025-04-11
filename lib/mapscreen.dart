import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MaterialApp(home: MapScreen()));
}

class Place {
  final String name;
  final LatLng location;
  final String description;
  final String imageUrl;
  final String openingHours;
  final List<String> gallery;

  Place({
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.openingHours,
    required this.gallery,
  });
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  LatLng? _currentLocation;
  String _locationStatus = "Waiting for location...";

  final List<Place> places = [
    Place(
      name: "Ciné 104",
      location: LatLng(48.8921813, 2.4090396),
      description:
          "Situé au cœur de Pantin, Ciné 104 est un cinéma d’art et d’essai réputé pour sa programmation éclectique, mêlant films d’auteur, classiques et avant-premières.",
      imageUrl: "assets/cine.png",
      openingHours: "11h00 - 22h45",
      gallery: [
        "assets/cine1.png",
        "assets/cine2.png",
        "assets/cine3.png",
        "assets/cine4.png",
      ],
    ),
    Place(
      name: "Philharmonie de Paris",
      location: LatLng(48.891566, 2.39407),
      description: "Située dans le parc de la Villette, la Philharmonie de Paris est un lieu culturel majeur entièrement tourné vers la musique. Avec son architecture contemporaine signée Jean Nouvel et sa grande salle de concert réputée pour son acoustique exceptionnelle, elle propose une programmation riche et ouverte, mêlant musique classique, jazz, musiques actuelles et du monde.\n\n"
    "Tout au long de l’année, la Philharmonie accueille aussi des expositions, des festivals, des conférences et des ateliers pour petits et grands. C’est un espace vivant, qui donne envie de découvrir la musique autrement, que l’on soit mélomane passionné ou simplement curieux.\n\n"
    "Un lieu où la culture musicale se vit pleinement, dans un esprit de transmission, d’expérimentation et de partage.",
      imageUrl: "assets/philharmonie.png",
      openingHours: "12h00 - 18h00",
      gallery: [
        "assets/philharmonie1.png",
        "assets/philharmonie2.png",
        "assets/philharmonie3.png",
      ],
    ),
    Place(
      name: "Cité Fertile",
      location: LatLng(48.90059, 2.39812),
      description: "​La Cité Fertile est un tiers-lieu écoresponsable dédié à la transition écologique et sociale, installé sur une ancienne gare de marchandises SNCF à Pantin.\n\n"
    "Sur un hectare, elle offre un espace de vie et d'expérimentation où se rencontrent citoyens, associations et entreprises engagés pour construire ensemble la ville durable de demain.\n\n"
    "Avec ses espaces végétalisés, son potager pédagogique et sa brasserie artisanale, la Cité Fertile propose une programmation riche : ateliers, conférences, festivals et événements conviviaux rythment la vie de ce lieu innovant.",
      imageUrl: "assets/cite.png",
      openingHours: "12h00 - 2h00",
      gallery: [
        "assets/cite1.png",
        "assets/cite2.png",
        "assets/cite3.png",
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      _getCurrentLocation();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    } else {
      setState(() {
        _locationStatus = "Location permission denied.";
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    if (await Permission.location.isGranted) {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _locationStatus = "Location services are disabled.";
        });
        return;
      }

      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        setState(() {
          _currentLocation = LatLng(position.latitude, position.longitude);
          _locationStatus = "Location: ${position.latitude}, ${position.longitude}";
        });
        _mapController.move(_currentLocation!, 18.2);
      } catch (e) {
        setState(() {
          _locationStatus = "Failed to get location: $e";
        });
      }
    }
  }

  void _recenterLocation() {
    if (_currentLocation != null) {
      _mapController.move(_currentLocation!, 18.2);
    }
  }

  void _zoomIn() {
    _mapController.move(_mapController.camera.center, _mapController.camera.zoom + 1);
  }

  void _zoomOut() {
    _mapController.move(_mapController.camera.center, _mapController.camera.zoom - 1);
  }

  void _showPlaceDetailsPage(Place place) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceDetailsPage(place: place),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(48.8584, 2.2945),
              initialZoom: 14.5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              if (_currentLocation != null)
                CurrentLocationLayer(
                  style: LocationMarkerStyle(
                    marker: const DefaultLocationMarker(),
                    markerSize: const Size(20, 20),
                  ),
                ),
              MarkerLayer(
                markers: places.map((place) {
                  return Marker(
                    point: place.location,
                    width: 35,
                    height: 35,
                    child: GestureDetector(
                      onTap: () => _showPlaceDetailsPage(place),
                      child: Icon(
                        Icons.location_on,
                        color: Color.fromRGBO(37, 52, 109, 1),
                        size: 35,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _recenterLocation,
              child: Icon(Icons.my_location),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _locationStatus,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomIn",
                  mini: true,
                  onPressed: _zoomIn,
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  mini: true,
                  onPressed: _zoomOut,
                  child: Icon(Icons.remove),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceDetailsPage extends StatelessWidget {
  final Place place;

  PlaceDetailsPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(place.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: IconButton(
                iconSize: 40,
                icon: Icon(Icons.arrow_circle_left_rounded, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.67,
              minChildSize: 0.67,
              maxChildSize: 0.95,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.grey),
                            SizedBox(width: 8),
                            Text(
                              place.openingHours,
                              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: place.description
                              .split('\n\n')
                              .map((paragraph) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0),
                                    child: Text(
                                      paragraph,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ))
                              .toList(),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: place.gallery.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 230,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(place.gallery[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
