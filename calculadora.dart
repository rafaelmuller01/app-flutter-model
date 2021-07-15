import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomeApp(),
));

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();

}

class _HomeAppState extends State<HomeApp> {
  String output = "0";

  String fora = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operador = "";

  buttonPressed(String botao){
    print(botao);
    if(botao == "limpar"){
       fora = "0";
       num1 = 0.0;
       num2 = 0.0;
       operador = "";
    }else if(botao == "+" || botao == "-" || botao =="x" || botao == "/"){
      num1 = double.parse(output);
      operador = botao;
      fora = "0";
      output = output + botao;
    }else if(botao == "x"){
      if(fora.contains("x")){
        print("deu certo");
        return;
      }else{
        fora = fora + botao;
      }
    }else if(botao == "="){
      num2 = double.parse(output);
      if(operador == "+"){
        fora = (num2 + num1).toString();

      }
      if(operador == "-"){
        fora = (num1 - num2).toString();

      }
      if(operador == "x"){
        fora = (num2 * num1).toString();

      }
      if(operador == "/"){
        fora = (num1 / num2).toString();

      }
      num1 = 0.0;
      num2 = 0.0;

    }else{
      fora = fora+ botao;
    }

    setState(() {
      output = double.parse(fora).toStringAsFixed(2);
    });
  }

  Widget buildButton(String ButtonVal){
    return new Expanded(
        child: Container(
          padding: EdgeInsets.all(0.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.blue[900],
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(2.0,2.0),
                blurRadius: 8.0,
                spreadRadius: 1.0
              ),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-2.0,-2.0),
                  blurRadius: 8.0,
                  spreadRadius: 1.0
              ),
            ],
          ),
          child: MaterialButton(
            padding: EdgeInsets.all(30.0),
            child: Text(ButtonVal, style: TextStyle(
              fontSize: 22.0
            ),),
            onPressed: ()=>
              buttonPressed(ButtonVal)
            ,
          ),
        )
    );

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal:12.0,vertical: 50.0),
                  child: Text(output, style: TextStyle(
                    fontSize: 60.0
                  ),)
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildButton("limpar"),
                      buildButton("x")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("/")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("+")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("-")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("0"),
                      buildButton("="),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
