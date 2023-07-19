import 'package:meuapp_testes/meuapp_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  test('Calcular o valor do produto com desconto em reais', () {
    expect(app.calcularDesconto(1000, 150, false), equals(850));
  });

  test('Calcular o valor do produto com desconto zerado sendo o valor zerado', () {
    expect(() => app.calcularDesconto(0, 150, false), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcular o valor do produto com desconto em porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850));
  });

  test('Calcular o valor do produto com desconto zerado', () {
    expect(() => app.calcularDesconto(1000, 0, true), throwsA(TypeMatcher<ArgumentError>()));
  });

  group("Calcula o valor do produto com desconto: ", () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850,
      {'valor': 1000, 'desconto': 10, 'percentual': true}: 900
    };
    valuesToTest.forEach((values, expected) { 
      test('Entrada: $values Esperado: $expected', () {
      expect(
        app.calcularDesconto(
            double.parse(values["valor"].toString()), 
            double.parse(values["desconto"].toString()), 
            values["percentual"] == true),
          equals(expected));
      });
    });
  });

  group("Calcula o valor do produto informando valores zerados, deve gerar erro ", () {
    var valuesToTest = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
      {'valor': 1000, 'desconto': 0, 'percentual': true}
    };
    for (var values in valuesToTest) { 
      test('Entrada: $values', () {
      expect(
        () => app.calcularDesconto(
            double.parse(values["valor"].toString()), 
            double.parse(values["desconto"].toString()), 
            values["percentual"] == true),
          throwsA(TypeMatcher<ArgumentError>()));
      });
    }
  });

  test("Verifica se o texto foi convertido para maiusculas", () {
    expect(app.convertUpper("dio"), equals("DIO"));
  });
   
  test("Verifica se o texto foi convertido para maiusculas", () {
    expect(app.convertUpper("dio"), equalsIgnoringCase("dio"));
  });

  test("Valor maior que 50", () {
    expect(app.retornaValor(52), greaterThan(50));
  });

  test("Valor maior ou igual a 50", () {
    expect(app.retornaValor(50), greaterThanOrEqualTo(50));
  });

  test("Valor menor que 50", () {
    expect(app.retornaValor(49), lessThan(50));
  });

  test("Valor diferente de 50", () {
    expect(app.retornaValor(52), isNot(equals(50)));
  });

  test("Retornar CEP", () async {
    var body = await app.retornarCeP("42710400");
    print(body);
    expect(body["bairro"], equals("Buraquinho"));
  });
}
