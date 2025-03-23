// features/location/presentation/views/google_maps_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:myproducts/core/helper_functions/route_navigation.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_routers.dart';
import 'package:myproducts/features/location/presentation/manger/cubit/fetch_location_cubit.dart';
import 'package:myproducts/features/location/presentation/views/widgets/map_buttons.dart';
import 'package:location/location.dart' as loc;

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({super.key});

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

String locationTitle = " ";

class _GoogleMapsViewState extends State<GoogleMapsView> {
  final MapController _mapController = MapController();
   LatLng _currentPosition=const LatLng(30.033333,31.233334);
  loc.Location location = loc.Location();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentLocation();
    });
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    loc.LocationData locationData = await location.getLocation();

    setState(() {
      _currentPosition =
          LatLng(locationData.latitude!, locationData.longitude!);
      _mapController.move(_currentPosition!, 15.0);
      _getAddressFromLatLng(_currentPosition!);
    });
  }

  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          locationTitle =
              "${place.street}, ${place.locality}, ${place.country}";
        });
      }
    } catch (e) {
      print("Error fetching address: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : BlocBuilder<FetchLocationCubit, FetchLocationState>(
              builder: (context, state) {
                return Stack(children: [
                  FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      onMapReady: () {
                        _getAddressFromLatLng(_currentPosition!);
                      },
                      initialCenter: _currentPosition!,
                      initialZoom: 13.2,
                      onTap: (tapPosition, latLng) {
                        setState(() {
                          _currentPosition = latLng;
                          _getAddressFromLatLng(latLng);
                        });
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      const FlutterMapZoomButtons(
                        minZoom: 4,
                        maxZoom: 13,
                        mini: true,
                        padding: 10,
                        alignment: Alignment.bottomRight,
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _currentPosition!,
                            width: 150.w,
                            height: 65.h,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Text(
                                    locationTitle,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Icon(Icons.location_pin,
                                    color: Colors.red, size: 30),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: FloatingActionButton(
                        backgroundColor: LightAppColors.primary,
                        child: const Icon(Icons.check),
                        onPressed: () {
                           FetchLocationCubit. get(context).addLocation(locationTitle, _currentPosition);
                            pushAndRemoveRoute(
            context,
            Routes.layout,
          );
                        },
                      ),
                    ),
                  ),
                ]);
              },
            ),
    );
  }
}
