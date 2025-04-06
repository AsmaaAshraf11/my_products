// features/location/data/models/location._model.dart
import 'package:latlong2/latlong.dart';

class LocationModel {
  final int id;
  final String address;

  final LatLng latLng;

  LocationModel({
    required this.address,
    required this.id,
    required this.latLng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json['id'],
        latLng: LatLng(json['latitude'], json['longitude']),
        address: json['address'],
      );
}
