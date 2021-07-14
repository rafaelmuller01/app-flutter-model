import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(CalculadoraCombustivel());
}

class CalculadoraCombustivel extends StatelessWidget {
  void calcularCombustivel() {
    print('quase lá');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('calculadoracombustível')),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Text('app Desenvolvido pelos alunos'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(children: [
            Center(child: Text('bora economizar?')),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'informe apenas valores númericos. Ex: 5.29',
                  labelText: 'informe o valor da gasolina: '),
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'informe apenas valores númericos. Ex: 4.29',
                  labelText: 'informe o valor do alcool: '),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: ElevatedButton(
                onPressed: calcularCombustivel,
                child: Text('calcular'),
              ),
            ),
            Center(child: Text('o melhor combustível é: ')),
          ]),
        ),
      ),
    );
  }
}
