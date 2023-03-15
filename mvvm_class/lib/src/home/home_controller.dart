import 'package:mvvm_class/src/home/pessoa_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeController {
  double _peso = 0;
  double _altura = 0;
  final _resultado = RxNotifier<String>('');

  setPeso(String value) => _peso = double.tryParse(value) ?? 0;
  setAltura(String value) => _altura = double.tryParse(value) ?? 0;

  String get resultado => _resultado.value;

  calculaIMC() {
    final pessoa = PessoaModel(peso: _peso, altura: _altura);
    final imcValue = pessoa.calculaImc();
    final imcText = imcValue.toStringAsFixed(2);

    if (imcValue < 18) {
      _resultado.value = 'O IMC é $imcText. Abaixo do valor desejado.';
    } else if (imcValue > 18 && imcValue < 24) {
      _resultado.value = 'O IMC é $imcText. Dentro do valor desejado.';
    } else {
      _resultado.value = 'O IMC é $imcText. Acima do valor desejado.';
    }
  }
}
