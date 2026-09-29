import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, Mundo!'),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
      ),
      floatingActionButton: OutlinedButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.deepOrange,)
        ),
    );

  }
}