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

  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  GlobalKey<FormState> cForm = GlobalKey<FormState>();
  String info = "Informe os seus Dados";
  String colorsx = 'green';

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
      home: criaPagina(),

    );
  }

  criaPagina() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcula IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: resetaCampos,
          ),
        ],
      ),
      body: criaFormulario(),
    );
  }

  criaFormulario() {
    return Form(
      key: cForm,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Componentes.caixa("Peso", "Digite o Peso", controllerPeso, validaPeso, numero: true),
            Componentes.caixa("Altura", "Digite a altura", controllerAltura, validaAltura, numero: true),
            Componentes.botao("Calcula", calcularImc),
            Text(
              info,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ),
    );
  }
  Function validaPeso = ((value){
    if(value.isEmpty){
      return "Informe o Peso";
    }
    if(int.parse(value) <=0){
      return "O Peso não pode ser negativo";
    }
    return null;
  });

  Function validaAltura = ((value){
    if(value.isEmpty){
      return "Informe a Altura";
    }
    if(double.parse(value) <=0){
      return "A altura não pode ser negativa.";
    }
    return null;
  });

  resetaCampos(){
    controllerPeso.text ="";
    controllerAltura.text ="";
    setState(() {
      info = "Informe os seus dados";
      cForm = GlobalKey<FormState>();
    });
  }

  calcularImc(){
    setState(() {
    if(!cForm.currentState.validate()){
      return null;
    }
    double p = double.parse(controllerPeso.text);
    double a = double.parse(controllerAltura.text);
    double imc = p/(a*a);
    if (imc < 18.5)
      info = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      colorsx = 'blue';
    if (imc >= 18.5 && imc < 30)
      info = "Peso Ideal (${imc.toStringAsPrecision(4)})";
    else
      info = "Acima do Peso (${imc.toStringAsPrecision(4)})";
      colorsx = 'red';

    print(info);
    });

  }
}
