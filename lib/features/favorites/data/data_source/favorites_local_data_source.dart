// features/favorites/data/data_source/favorites_local_data_source.dart
import 'package:myproducts/features/home/data/models/products/product.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:sqflite/sqflite.dart';

abstract class FavoritesLocalDataSource {
  
Future <void>addFavorite(ProductsEntity product);
Future getFavorites();
  Future<int> deleteFavorites(int id);

}
  class FavoritesLocalDataSourceImpl extends FavoritesLocalDataSource {
  
  
  static Database? _database;

 Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }
  Future<Database> initDb() async {
    var db = await openDatabase('FavoritesProducts.db', version: 2, onCreate: _onCreate,onUpgrade:_onUpgrade);
    return db;
  }

  _onCreate(Database _database, int version) async {
    await _database
        .execute(
            'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT ,idProduct INTEGER NOT NULL,titleProduct TEXT NOT NULL,price REAL NOT NULL,rating REAL NOT NULL,category TEXT,descriptionProduct TEXT,images TEXT)')
        .then((value) {
      print(' table created');
    });
  }
  @override
  Future <void>addFavorite(ProductsEntity product)async {
    final Database db = await initDb();
    await db.insert(
  'products',
  {
    'idProduct': product.productId,
    'titleProduct': product.titleProduct,
    'price': product.price,
    'rating': product.rating,
    'category': product.Category,
    'descriptionProduct': product.descriptionProduct,
    'images': product.image,
  },
  conflictAlgorithm: ConflictAlgorithm.replace,
)
                
            .then((value) {
          print(' insert1 table');
        }).catchError((erorr) {
          print(' error when insert table${erorr.toString()}');
        });
      }
      
     Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (1 < 2) {
      await db.execute("DROP TABLE IF EXISTS products");
    print(" Table 'products' deleted!");
          await _onCreate(db, 2); 

    }
  }
  
  @override
  Future <List<ProductsEntity>> getFavorites()async {
    final db = await database;
     List<ProductsEntity> products =[];
    final List<Map<String, dynamic>> data = await db.query('products');
    print(data.length);
    for (var element in data) {
     // print('element:$element');
        products.add(Product.fromJson(element));
      }
    print('product${products.length}');
        return products;  
  }
  
  @override
  Future<int> deleteFavorites(int id) async{
  final db = await database;
  
  return await db.delete(
    'products',
    where: 'id = ?',
    whereArgs: [id],
  );
        
  }
  
  }
