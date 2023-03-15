import 'package:flutter/material.dart';
import 'package:pomodoro/components/cronometro.dart';
import 'package:pomodoro/components/entrada_tempo.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: Cronometro()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EntradaTempo(
                    titulo: 'Trabalho',
                    valor: store.tempoTrabalho,
                    inc: store.estaDescansando()
                        ? store.incrementarTempoTrabalho
                        : null,
                    dec: store.estaDescansando()
                        ? store.decrementarTempoTrabalho
                        : null,
                  ),
                  EntradaTempo(
                    titulo: 'Descanso',
                    valor: store.tempoDescanso,
                    inc: store.estaTrabalhando()
                        ? store.incrementarTempoDescanso
                        : null,
                    dec: store.estaTrabalhando()
                        ? store.decrementarTempoDescanso
                        : null,
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
