import 'package:flutter/material.dart';
import 'package:aula01/pages/chat_list_page.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDM'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'MÓDULO 5',
            style: TextStyle(fontSize: 24),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text('Lista de Conversas'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatListPage()),
                  );
                },
                tileColor: Colors.blue,
              ),
            ],
          ),
        ]
      )
    );
  }
}