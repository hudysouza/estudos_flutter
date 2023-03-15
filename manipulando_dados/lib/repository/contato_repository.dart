import 'package:manipulando_dados/shared/model/contato.dart';
import 'package:sqflite/sqflite.dart';

class ContatoRepository {
  Database database;

  ContatoRepository(this.database);

  Future<List<Contato>> getAll() async {
    List<Map<String, dynamic>> contatosMap = await database.query('contatos');

    return contatosMap.map((map) => Contato.fromMap(map)).toList();
  }

  Future add(Contato contato) async {
    await database.insert('contatos', contato.toMap());
  }

  Future update(Contato contato) async {
    await database.update('contatos', contato.toMap(),
        where: 'id = ?', whereArgs: [contato.id]);
  }

  Future delete(int id) async {
    await database.delete('contatos', where: 'id = ?', whereArgs: [id]);
  }
}
