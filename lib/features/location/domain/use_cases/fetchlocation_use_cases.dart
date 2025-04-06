// features/location/domain/use_cases/fetchlocation_use_cases.dart
import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/location/data/models/location._model.dart';
import 'package:myproducts/features/location/domain/repos/location_repo.dart';

class FetchLocationUseCases {
  final LocationRepo locationRepo;

  FetchLocationUseCases(this.locationRepo);

  Future<void> call(String address, LatLng latLngt) {
    return locationRepo.addLocation(address, latLngt);
  }

  Future<Either<Failure, List<LocationModel>>> NoParam() {
    return locationRepo.getLocation();
  }

  Future<void> Call(int id) {
    return locationRepo.deleteLocation(id);
  }
}

abstract class UseCase<Type, Param> {
  Future<void> call(Param param);
}

class NoParam {}
