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
      theme: ThemeData(
        primaryColor: Colors.green[900]
      ),
      home: Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          title: Center(
              child: Text(
            'calculadora de combustível',
            style: TextStyle(color: Colors.white),
          )),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Text('app Desenvolvido pelo rafael'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(children: [
            Center(child: Text('bora economizar?',
            style: TextStyle(
              color: Colors.black, fontFamily: 'arial', fontSize: 25
            ),
            )),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'informe apenas valores númericos. Ex: 5.29',
                  icon: Icon(Icons.local_gas_station),
                  labelText: 'informe o valor da gasolina: '),
              onChanged: (valorg) {
                gasolina = valorg.replaceAll('','');
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'informe apenas valores númericos. Ex: 4.29',
                  icon: Icon(Icons.local_gas_station_outlined),
                  labelText: 'informe o valor do etanol: '),
              onChanged: (valora) {
                etanol = valora.replaceAll('','');
              },
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[900],
                  elevation: 20,
                  shadowColor: Colors.green[400],
                ),
                onPressed: calcularCombustivel,
                child: Text(
                  'calcular o combustivel',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'arial', fontSize: 20),
                ),
              ),
            ),
            Center(child: Text(
              'o melhor combustível é: ',
              style: TextStyle(
                color: Colors.green[900], fontFamily: 'arial', fontSize: 20),)),
            Text('$melhorcombustivel')
          ]),
        ),
      ),
    );
  }
}
