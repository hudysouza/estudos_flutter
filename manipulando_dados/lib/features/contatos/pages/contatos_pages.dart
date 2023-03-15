import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:manipulando_dados/features/contatos/pages/contatos_vm.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sqflite/sqflite.dart';

import '../../../repository/contato_repository.dart';
import '../../../shared/model/contato.dart';

class ContatosPage extends StatelessWidget {
  const ContatosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Database db = Provider.of<Database>(context);
    final ContatoRepository repository = ContatoRepository(db);

    final viewModel = ContatosViewModel(repository);

    viewModel.getContatos();

    Contato getContato(int index) {
      return viewModel.contatos.value![index];
    }

    void showBottonSheetContato({Contato? contato}) {
      viewModel.setContatoModel(contato);

      showModalBottomSheet(
        context: context,
        builder: (_) {
          final GlobalKey<FormState> formKey = GlobalKey<FormState>();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: contato != null
                          ? TextEditingController(text: contato.nome)
                          : null,
                      onChanged: viewModel.setNome,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      validator: (value) =>
                          value == null || value == 'Valor "Nome" Obrigatório'
                              ? ''
                              : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: contato != null
                          ? TextEditingController(text: contato.contato)
                          : null,
                      onChanged: viewModel.setContato,
                      decoration: const InputDecoration(
                        labelText: 'Contato',
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      validator: (value) => value == null || value == ''
                          ? 'Valor "Contato" Obrigatório'
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        viewModel
                            .save()
                            .then((value) => Navigator.pop(context));
                      }
                    },
                    child: Text(contato == null ? 'Adicionar' : 'Salvar'),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: Observer(
        builder: (_) {
          if (viewModel.contatos.status == FutureStatus.pending ||
              viewModel.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (viewModel.contatos.status == FutureStatus.fulfilled) {
            return ListView.builder(
              itemCount: viewModel.contatos.value!.length,
              itemBuilder: (context, index) => Slidable(
                key: ValueKey(index),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (_) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Deletar'),
                            content: Text(
                                'Tem certeza de que deseja deletar ${getContato(index).nome}?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  viewModel.delete(getContato(index));
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Deletar'),
                              )
                            ],
                          ),
                        );
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      label: 'Deletar',
                      icon: Icons.delete,
                    ),
                    SlidableAction(
                      onPressed: (_) {
                        showBottonSheetContato(contato: getContato(index));
                      },
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      label: 'Editar',
                      icon: Icons.edit,
                    )
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(child: Text(getContato(index).nome[0])),
                  title: Text(getContato(index).nome),
                  subtitle: Text(getContato(index).contato),
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  Text(viewModel.contatos.error)
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showBottonSheetContato(),
      ),
    );
  }
}
