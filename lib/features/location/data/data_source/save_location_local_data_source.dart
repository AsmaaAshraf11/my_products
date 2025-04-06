// features/location/data/data_source/save_location_local_data_source.dart
import 'package:latlong2/latlong.dart';
import 'package:myproducts/features/location/data/models/location._model.dart';
import 'package:sqflite/sqflite.dart';

abstract class SaveLocationLocalDataSource {
  Future<void> addLocation(String address, LatLng latLng);
  Future getLocation();
  Future<int> deleteLocation(int id);
}

class SaveLocationLocalDataSourceImpl extends SaveLocationLocalDataSource {
  static Database? _database;
  List<LocationModel> location = [];

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    var db = await openDatabase(
      'locations.db',
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  _onCreate(Database database, int version) async {
    await database
        .execute(
            'CREATE TABLE location(id INTEGER PRIMARY KEY AUTOINCREMENT ,address TEXT NOT NULL,latitude REAL NOT NULL,longitude REAL NOT NULL)')
        .then((value) {
      print(' table created');
    });
  }

  @override
  Future<void> addLocation(String address, LatLng latLng) async {
    final Database db = await initDb();
    await db
        .insert(
      'location',
      {
        'address': address,
        'latitude': latLng.latitude,
        'longitude': latLng.longitude,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    )
        .then((value) {
      print(' insert table');
    }).catchError((erorr) {
      print(' error when insert table${erorr.toString()}');
    });
  }

  @override
  Future<List<LocationModel>> getLocation() async {
    final db = await database;
    List<LocationModel> location = [];
    final List<Map<String, dynamic>> data = await db.query('location');
    print(data.length);
    for (var element in data) {
      location.add(LocationModel.fromJson(element));
    }
    print('location${location.length}');
    return location;
  }

  @override
  Future<int> deleteLocation(int id) async {
    final db = await database;

    return await db.delete(
      'location',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
