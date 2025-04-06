// features/location/data/repos/location_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:myproducts/core/errors/failures.dart';
import 'package:myproducts/features/location/data/data_source/save_location_local_data_source.dart';
import 'package:myproducts/features/location/data/models/location._model.dart';
import 'package:myproducts/features/location/domain/repos/location_repo.dart';

class LocationRepoImpl implements LocationRepo {
  final SaveLocationLocalDataSourceImpl saveLocationLocalDataSourceImpl;

  LocationRepoImpl({required this.saveLocationLocalDataSourceImpl});

  @override
  Future<void> addLocation(String address, LatLng latLng) async {
    saveLocationLocalDataSourceImpl.addLocation(address, latLng);
  }

  @override
  Future<void> deleteLocation(int id) async {
    saveLocationLocalDataSourceImpl.deleteLocation(id);
  }

  @override
  Future<Either<Failure, List<LocationModel>>> getLocation() async {
    try {
      var data = await saveLocationLocalDataSourceImpl.getLocation();
      return right(data);
    } on Failure catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
