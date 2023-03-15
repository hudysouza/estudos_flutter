import 'package:flutter/material.dart';
import 'package:manipulando_dados/features/contatos/pages/contatos_pages.dart';
import 'package:manipulando_dados/features/contatos/pages/contatos_vm.dart';
// import 'package:manipulando_dados/home_page.dart';
import 'package:manipulando_dados/repository/contato_repository.dart';
import 'package:manipulando_dados/shared/services/connection_sqlite_service.dart';
import 'package:provider/provider.dart';

import 'package:sqflite/sqflite.dart';

void main() async {
  await ConnectionSQLiteService.instance.openDatabase();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Database>(create: (_) => ConnectionSQLiteService.instance.db),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ContatosPage(),
      ),
    );
  }
}
