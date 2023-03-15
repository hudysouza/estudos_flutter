import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 150.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta de Agua',
      value: 60.75,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Conta de Internet',
      value: 99.99,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: const Card(
                child: Text('Gráfico'),
              ),
            ),
            Column(
              children: transactions.map((tr) {
                return Card(
                  child: Text(tr.title),
                );
              }).toList(),
            ),
          ]),
    );
  }
}
