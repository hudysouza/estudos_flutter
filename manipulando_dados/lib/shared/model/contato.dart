class Contato {
  int? id;
  late String nome;
  late String contato;

  Contato({this.id, required this.nome, required this.contato});

  Contato.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    contato = map['contato'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['contato'] = contato;
    return data;
  }
}
