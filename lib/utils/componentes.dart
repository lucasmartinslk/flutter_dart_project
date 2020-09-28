import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Componentes {
  static botao(String _texto, Function _f) {
    return Container(
        child: RaisedButton(
          onPressed: _f,
          child: Text(
            _texto,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.grey, width: 4)
          ),
          color: Colors.white.withOpacity(0.5),
          hoverColor: Colors.white.withOpacity(0.3),
        )
    );
  }
}