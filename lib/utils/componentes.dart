import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Componentes{
  static caixa(String rotulo, String dica, TextEditingController controlador, validacao, {bool obscure=false, bool numero=false}){
  return TextFormField(
    controller: controlador,
    obscureText: obscure,
    validator: validacao,
    keyboardType: numero?TextInputType.number:TextInputType.text,
    decoration: InputDecoration(
      labelText: rotulo,
      labelStyle: TextStyle(fontSize: 18),
      hintText: dica,
      hintStyle: TextStyle(fontSize: 10, color: Colors.red),

    ),
  );

  }


 static botao(String _texto, Function _f){
   return Container(
     child: RaisedButton(
       onPressed: _f,
       child: Text(
           _texto,
          style: TextStyle(color: Colors.blue, fontSize: 14),
       ),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(20),
         side: const BorderSide(color: Colors.black45, width: 4)
       ),
       color: Colors.greenAccent.withOpacity(0.5),
       hoverColor: Colors.black87.withOpacity(0.3),
     )
   );
 }
}