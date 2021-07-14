import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(CalculadoraCombustivel());
}

class CalculadoraCombustivel extends StatefulWidget {
  @override
  _CalculadoraCombustivelState createState() => _CalculadoraCombustivelState();
}

class _CalculadoraCombustivelState extends State<CalculadoraCombustivel> {
  String melhorcombustivel = '';
  String etanol = '0.0';
  String gasolina = '0.0';
  double resultado = 0.0;

  void calcularCombustivel() {
    setState(() {
      double valoretanol = double.parse(etanol.toString());
      double valorgasolina = double.parse(gasolina.toString());
      resultado = valoretanol / valorgasolina;
      if (resultado < 0.7) {
        melhorcombustivel = 'etanol';
      } else if (resultado >= 0.7) {
        melhorcombustivel = 'gasolina';
      } else {
        melhorcombustivel = 'valores inseridos inválidos';
      }
    });
    print('quase lá');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'calculadora de combustível',
            style: TextStyle(color: Colors.white),
          )),
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
                  icon: Icon(Icons.local_gas_station),
                  labelText: 'informe o valor da gasolina: '),
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'informe apenas valores númericos. Ex: 4.29',
                  icon: Icon(Icons.local_gas_station),
                  labelText: 'informe o valor do etanol: '),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[900],
                  elevation: 20,
                  shadowColor: Colors.red[900],
                ),
                onPressed: calcularCombustivel,
                child: Text(
                  'calcular o combustivel',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'arial', fontSize: 14),
                ),
              ),
            ),
            Center(child: Text('o melhor combustível é: ')),
            Text('$melhorcombustivel')
          ]),
        ),
      ),
    );
  }
}

