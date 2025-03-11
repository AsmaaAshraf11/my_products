// features/cart/data/data_source/cart_local_data_source.dart
import 'package:myproducts/features/cart/data/models/cart_model.dart';
import 'package:myproducts/features/home/domain/entities/Products_Entity.dart';
import 'package:sqflite/sqflite.dart';

abstract class CartLocalDataSource {
    Future<void> fetchAddCart(ProductsEntity product,int quant);

Future<List<CartModel>> fetchMyCart();
  Future<void> DeletCartCart({required int id});
  Future<void> fetchUpdateCart(int id, int newQuantity);
  }

 class CartLocaleDataSourceImpl extends CartLocalDataSource {

   static Database? _database;
  List<CartModel> products =[];

 Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }
  Future<Database> initDb() async {
    var db = await openDatabase('carts.db', version: 1, onCreate: _onCreate,);
    return db;
  }

  _onCreate(Database _database, int version) async {
    await _database
        .execute(
            'CREATE TABLE carts(id INTEGER PRIMARY KEY AUTOINCREMENT ,productId INTEGER NOT NULL,title TEXT NOT NULL,price REAL NOT NULL,quantity INTEGER NOT NULL,thumbnail TEXT)')
        .then((value) {
      print(' table created');
    });
  }
  @override
  Future <void>fetchAddCart(ProductsEntity product,int quant)async {
    final Database db = await initDb();
    await db.insert(
  'carts',
  {
    'productId': product.productId,
    'title': product.titleProduct,
    'price': product.price,
    'quantity': quant,
    'thumbnail': product.image,
  },
  conflictAlgorithm: ConflictAlgorithm.replace,
)
                
            .then((value) {
          print('  add');
        }).catchError((erorr) {
          print(' error when  add${erorr.toString()}');
        });
      }

          @override
          Future<int> DeletCartCart({required int id}) async{
         final db = await database;
  
          return await db.delete(
            'carts',
           where: 'productId = ?',
          whereArgs: [id],
          ).then((value) {
         return value; 
        }).catchError((erorr) {
          print(' error when  add${erorr.toString()}');
        });      
              }

  
  @override
  Future<List<CartModel>> fetchMyCart()async {
    // TODO: implement fetchMyCart
final db = await database;
     List<CartModel> catr =[];
    final List<Map<String, dynamic>> data = await db.query('carts');
    for (var element in data) {
        catr.add(CartModel.fromJson(element));
      }
    print('cart${catr.length}');
        return catr;  
          }


          Future<void> fetchUpdateCart(int id, int newQuantity) async {
  final Database db = await initDb();

  await db.update(
    'carts',
    {'quantity': newQuantity}, 
    where: 'productId = ?', 
    whereArgs: [id],
  ).then((value) {
   // print(' Quantity updated for productId: $id');
  }).catchError((error) {
    print(' Error updating quantity: ${error.toString()}');
  });
}

        


 
 }
