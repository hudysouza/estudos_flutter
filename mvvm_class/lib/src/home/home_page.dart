import 'package:flutter/material.dart';
import 'package:mvvm_class/src/home/home_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcula IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            onChanged: controller.setAltura,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Altura',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            onChanged: controller.setPeso,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Peso',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: controller.calculaIMC,
            child: const Text('Calcular IMC'),
          ),
          const SizedBox(height: 10),
          RxBuilder(builder: (_) => Text(controller.resultado))
        ]),
      ),
    );
  }
}
