import 'package:manipulando_dados/repository/contato_repository.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/model/contato.dart';
part 'contatos_vm.g.dart';

class ContatosViewModel extends _ContatosViewModelBase
    with _$ContatosViewModel {
  ContatosViewModel(super._repository);
}

abstract class _ContatosViewModelBase with Store {
  final ContatoRepository _repository;

  _ContatosViewModelBase(this._repository);

  static ObservableFuture<List<Contato>> emptyResponse =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Contato>> contatos = emptyResponse;

  @observable
  String? nome;

  @observable
  String? contato;

  @observable
  int? id;

  @observable
  bool loading = false;

  @action
  void setContatoModel(Contato? contato) {
    if (contato == null) {
      id = null;
      nome = '';
      this.contato = '';
    } else {
      id = contato.id;
      nome = contato.nome;
      this.contato = contato.contato;
    }
  }

  @action
  void setNome(String value) => nome = value;

  @action
  void setContato(String value) => contato = value;

  @action
  void getContatos() {
    contatos = _repository.getAll().asObservable();
  }

  @action
  Future save() async {
    try {
      loading = true;
      Contato value = Contato(nome: nome!, contato: contato!);
      if (id == null) {
        await _repository.add(value);
      } else {
        value.id = id;
        await _repository.update(value);
      }

      getContatos();
    } catch (e) {
      print(e);
    } finally {
      loading = false;
    }
  }

  @action
  Future delete(Contato contato) async {
    try {
      loading = true;

      await _repository.delete(contato.id!);

      getContatos();
    } catch (e) {
      print(e);
    } finally {
      loading = false;
    }
  }
}
