import 'dart:convert';

import 'package:http/http.dart' as http;

double calcularDesconto(double valor, double desconto, bool percentual) {
  if(valor <= 0) {
    throw ArgumentError("Valor do produto não pode ser zero");
  }
  if (desconto <= 0) {
    throw ArgumentError("O valor do desconto não pode ser zero");
  }
  if(percentual) {
    return valor - ((valor * desconto) / 100);
  }
  return valor - desconto;
}

String convertUpper(String texto) {
  return texto.toUpperCase();
}

double retornaValor(double valor) {
  return valor;
}

Future<Map<dynamic, dynamic>> retornarCeP(String cep) async {
  var uri = Uri.parse("https://viacep.com.br/ws/$cep/json/");
  var retorno = await http.get(uri);
  var decodedResponse = jsonDecode(utf8.decode(retorno.bodyBytes)) as Map;
  return decodedResponse;
}
