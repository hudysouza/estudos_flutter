// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contatos_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContatosViewModel on _ContatosViewModelBase, Store {
  late final _$contatosAtom =
      Atom(name: '_ContatosViewModelBase.contatos', context: context);

  @override
  ObservableFuture<List<Contato>> get contatos {
    _$contatosAtom.reportRead();
    return super.contatos;
  }

  @override
  set contatos(ObservableFuture<List<Contato>> value) {
    _$contatosAtom.reportWrite(value, super.contatos, () {
      super.contatos = value;
    });
  }

  late final _$nomeAtom =
      Atom(name: '_ContatosViewModelBase.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$contatoAtom =
      Atom(name: '_ContatosViewModelBase.contato', context: context);

  @override
  String? get contato {
    _$contatoAtom.reportRead();
    return super.contato;
  }

  @override
  set contato(String? value) {
    _$contatoAtom.reportWrite(value, super.contato, () {
      super.contato = value;
    });
  }

  late final _$idAtom =
      Atom(name: '_ContatosViewModelBase.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_ContatosViewModelBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('_ContatosViewModelBase.save', context: context);

  @override
  Future<dynamic> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_ContatosViewModelBase.delete', context: context);

  @override
  Future<dynamic> delete(Contato contato) {
    return _$deleteAsyncAction.run(() => super.delete(contato));
  }

  late final _$_ContatosViewModelBaseActionController =
      ActionController(name: '_ContatosViewModelBase', context: context);

  @override
  void setContatoModel(Contato? contato) {
    final _$actionInfo = _$_ContatosViewModelBaseActionController.startAction(
        name: '_ContatosViewModelBase.setContatoModel');
    try {
      return super.setContatoModel(contato);
    } finally {
      _$_ContatosViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String value) {
    final _$actionInfo = _$_ContatosViewModelBaseActionController.startAction(
        name: '_ContatosViewModelBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_ContatosViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContato(String value) {
    final _$actionInfo = _$_ContatosViewModelBaseActionController.startAction(
        name: '_ContatosViewModelBase.setContato');
    try {
      return super.setContato(value);
    } finally {
      _$_ContatosViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getContatos() {
    final _$actionInfo = _$_ContatosViewModelBaseActionController.startAction(
        name: '_ContatosViewModelBase.getContatos');
    try {
      return super.getContatos();
    } finally {
      _$_ContatosViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contatos: ${contatos},
nome: ${nome},
contato: ${contato},
id: ${id},
loading: ${loading}
    ''';
  }
}
