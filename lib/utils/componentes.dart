import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Componentes {
  static botao(String texto, Function f){
    return Container(
      child: RaisedButton(
        onPressed: f,
        child: Text(texto,
          style: TextStyle(color: Colors.white, fontSize: 30),        
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.white, width: 4),
        ),
        color: Colors.cyan.withOpacity(0.4),
      ),
    );      
  }

  static caixa(String rotulo, String dica, TextEditingController controlador,valicao, {bool numero=false}){
    return TextFormField(
      controller: controlador,
      validator: valicao,
      keyboardType: numero?TextInputType.number:TextInputType.text,
      decoration: InputDecoration(
        labelText: rotulo,
        labelStyle: TextStyle(fontSize: 25),
        hintText: dica,
        hintStyle: TextStyle(fontSize: 25),
      ),
    );
  }
}