// features/location/domain/repos/location_repo.dart

import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/location/data/models/location._model.dart';

abstract class LocationRepo {
  Future<void> addLocation(String address, LatLng latLng);
  Future<Either<Failure, List<LocationModel>>> getLocation();
  Future<void> deleteLocation(int id);
}
