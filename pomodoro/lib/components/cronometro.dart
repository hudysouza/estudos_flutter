import 'package:flutter/material.dart';
import 'package:pomodoro/components/cronometro_botao.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(builder: (_) {
      return Container(
        color: store.estaTrabalhando() ? Colors.red : Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.estaTrabalhando()
                  ? 'Hora de Trabalhar'
                  : 'Hora de Descansar',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (_) {
              return Text(
                '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 120,
                  color: Colors.white,
                ),
              );
            }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !store.iniciado
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CronometroBotao(
                          texto: 'Iniciar',
                          icone: Icons.play_arrow,
                          click: store.iniciar,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CronometroBotao(
                          texto: 'Parar',
                          icone: Icons.stop,
                          click: store.parar,
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CronometroBotao(
                    texto: 'Reiniciar',
                    icone: Icons.refresh,
                    click: store.reiniciar,
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
