import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String contactTable = 'contactTable';
final String idColumn = 'idColumn';
final String nameColumn = 'nameColumn';
final String emailColumn = 'emailColumn';
final String phoneColumn = 'phoneColumn';
final String imgColumn = 'imgColumn';

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();
  factory ContactHelper() => _instance;

  ContactHelper.internal();
  Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      return _db = await initDb();
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'contacts.db');

    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          'CREATE TABLE  $contactTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT,$emailColumn TEXT,$phoneColumn TEXT,$imgColumn TEXT )');
    });
  }
}

//  id name email phone img

class Contact {
  int id;
  String name;
  String email;
  String phone;
  String img;

  Contact.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }
  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Contact(id: $id,name: $name, email: $email, phone: $phone, img: $img)';
  }
}
