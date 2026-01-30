/*
 *
 *  Webkul Software.
 * @package Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html
 *  @link https://store.webkul.com/license.html
 *
 * /
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final String location;
  const MapView(this.location, {Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  double? latitude;
  double? longitude;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCoordinates(widget.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(latitude ?? 28.6296987, longitude ?? 77.3762753),
                    zoom: 13.0,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('Location'),
                      position: LatLng(latitude ?? 28.6296987, longitude ?? 77.3762753),
                    ),
                  },
                ),
                Positioned(
                    top: 25,
                    left: 5,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).cardColor,
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_sharp,
                              color: Theme.of(context).iconTheme.color,
                            )),
                      ),
                    ))
              ],
            ),
    );
  }

  ///FIND LAT AND LONG VIA LOCATION
  Future<void> getCoordinates(String locationName) async {
    setState(() {
      isLoading = true;
    });
    try {
      List<Location> locations = await locationFromAddress(locationName);
      if (locations.isNotEmpty) {
        setState(() {
          isLoading = false;
        });
        Location firstLocation = locations.first;
        double lat = firstLocation.latitude;
        double long = firstLocation.longitude;
        setState(() {
          latitude = lat;
          longitude = long;
        });
        if (kDebugMode) {
          print('Location: ${widget.location}');
          print('Latitude: $latitude');
          print('Longitude: $longitude');
        }
      } else {
        setState(() {
          isLoading = false;
        });
        print('No results found');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }
}
