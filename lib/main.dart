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
  TextEditingController controllerNumero1 = TextEditingController();
  TextEditingController controllerNumero2 = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String info = "";

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
        title: Text("Calculadora"),
        centerTitle: true,
      ),
      body: criaNumeros(),
    );
  }

  criaNumeros() {
    return Form(
      key: cForm,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Componentes.caixa("Numero 1","Digite o primeiro numero", controllerNumero1, validaNumero1, numero: true),
            Componentes.caixa("Numero 2","Digite o segundo numero", controllerNumero2, validaNumero2, numero: true),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Componentes.botao("+", calcularValores),
                Componentes.botao("-", calcularSub),
                Componentes.botao("x", calcularMult),
                Componentes.botao("/", calcularDiv),
              ],
            ),
            Text(
              info,
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.greenAccent),
            ),
          ],
        ),
      ),
    );
  }

  Function validaNumero1 = ((value){
    if(value.isEmpty){
      return "Informe um valor";
    }
    return null;
  });

  Function validaNumero2 = ((value){
    if(value.isEmpty){
      return "Informe um valor";
    }
    return null;
  });

  calcularValores(){
    setState(() {
      if(!cForm.currentState.validate()){
        return null;
      }
      double x = double.parse(controllerNumero1.text);
      double y = double.parse(controllerNumero2.text);
      var xy = x + y;
      info = "A Soma é $xy";
    });
  }
  calcularSub(){
    setState(() {
      if(!cForm.currentState.validate()){
        return null;
      }
      double x = double.parse(controllerNumero1.text);
      double y = double.parse(controllerNumero2.text);
      var xy = x - y;
      info = "A Subtração é $xy";
    });
  }
  calcularMult(){
    setState(() {
      if(!cForm.currentState.validate()){
        return null;
      }
      double x = double.parse(controllerNumero1.text);
      double y = double.parse(controllerNumero2.text);
      var xy = x * y;
      info = "A Multiplicação é $xy";
    });
  }
  calcularDiv(){
    setState(() {
      if(!cForm.currentState.validate()){
        return null;
      }
      double x = double.parse(controllerNumero1.text);
      double y = double.parse(controllerNumero2.text);
      if(y!=0){
        var xy = x / y;
        info = "A Divisão é $xy";
      }
      else
        info = "Cálculo Impossível";
    });
  }
}


