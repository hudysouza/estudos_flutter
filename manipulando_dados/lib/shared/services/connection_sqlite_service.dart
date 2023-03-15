import 'package:manipulando_dados/shared/dao/sql.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart' as p;

class ConnectionSQLiteService {
  ConnectionSQLiteService._();

  static ConnectionSQLiteService? _instance;

  static ConnectionSQLiteService get instance {
    _instance ??= ConnectionSQLiteService._();

    return _instance!;
  }

  static const _databaseName = 'contatos.db';
  static const _databaseVersion = 1;
  Database? _db;

  Database get db => _db!;

  Future<Database> openDatabase() async {
    sqfliteFfiInit();
    String databasePath = await databaseFactoryFfi.getDatabasesPath();
    String path = p.join(databasePath, _databaseName);

    _db ??= await databaseFactoryFfi.openDatabase(
      path,
      options: OpenDatabaseOptions(
        onCreate: _onCreate,
        version: _databaseVersion,
      ),
    );

    print(_db!.path);

    return _db!;
  }

  void _onCreate(Database db, int version) {
    db.transaction((reference) async {
      reference.execute(ConnectionSQL.createDatabase);
    });
  }
}
