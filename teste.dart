import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Column(
      children: const <Widget>[
        Text(
          'Deliver features faster',
          textDirection: TextDirection.ltr,
        ),
        Text('seja bem vindo', textDirection: TextDirection.ltr),
        Expanded(
          child: FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: FlutterLogo(),
          ),
        ),
      ],
    ));
