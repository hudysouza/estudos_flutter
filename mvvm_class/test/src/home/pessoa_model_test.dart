import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_class/src/home/pessoa_model.dart';

void main() {
  testWidgets('calculaImc deve retornar ', (tester) async {
    final pessoa = PessoaModel(altura: 1.84, peso: 70);
    expect(pessoa.calculaImc().round(), 21);
  });
}
