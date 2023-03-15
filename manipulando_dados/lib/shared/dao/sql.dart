class ConnectionSQL {
  static const createDatabase = '''
  CREATE TABLE contatos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    contato TEXT
  );
  ''';

  static String selecionarTodosOsContatos() {
    return 'select * from contatos';
  }

  static String adicionarContato() {
    return '''
      insert into contatos (nome, contato)
      values ('', '');
    ''';
  }
}
