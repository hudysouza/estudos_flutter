class PessoaModel {
  final double altura;
  final double peso;

  PessoaModel({required this.altura, required this.peso});

  double calculaImc() {
    return peso / (altura * altura);
  }
}
