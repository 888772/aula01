import 'package:flutter/material.dart';

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Aula'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Aula de hoje', style: TextStyle(fontSize: 20.0)),
                    SizedBox(height: 12),
                    Text('Widget e composição', style: TextStyle(fontSize: 16.0)),
                    SizedBox(height: 12.0),
                    Text('Aprendedo a construir interfaces com Flutter', style: TextStyle(fontSize: 16.0)),
                    SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Clique aqui', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),  
            ),

            SizedBox(height: 20.0),

            Row(
              children: [
                Card(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.book),
                        Text('Aula aulas', style: TextStyle(fontSize: 16.0)),
                        Text("12"),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Card(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check),
                        Text('Exercícios', style: TextStyle(fontSize: 16.0)),
                        Text("8"),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}