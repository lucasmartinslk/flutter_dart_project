import 'dart:ui';

import 'package:flutter/material.dart';




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
      appBar: barraPrincipal(),
      body: Container(
        color: Colors.blueGrey,
        child: textoPrincipal(),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,),
    );
  }

  barraPrincipal() {
      return AppBar(
        title: Text("Ola Flutter"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      );
  }

  textoPrincipal() {
    return Text(
        "Texto Principal",
        style: TextStyle(
          color: Colors.blue,
            fontSize: 50,
            fontWeight: FontWeight.bold,
      ),
    );

  }
}



