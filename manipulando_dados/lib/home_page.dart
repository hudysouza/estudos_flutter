import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<Database>(context);

    print(db.path);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Pessoas'),
      ),
      
    );
  }
}
