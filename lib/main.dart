import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/componentes.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: paginaPrincipal(),
    );
  }

  paginaPrincipal() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calculadora"),
      ),
      body: Center(
        child: Column(
          children: [
            tipos(),
            tipos2(),
          ],
        ),
      ),
    );
  }

  tipos() {
    return Form(
      child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Componentes.botao("+", null),
              Componentes.botao("-", null),
              Componentes.botao("/", null),
              Componentes.botao("*", null),
            ],
          )
      ),
    );
  }
  tipos2() {
    return Form(
      child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Componentes.botao("DEL", null),
              Componentes.botao("=", null),
            ],
          )
      ),
    );
  }
}

