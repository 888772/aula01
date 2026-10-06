import 'package:aula01/domain/conversa.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {

  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {

      List<Conversa> conversas = [
        Conversa(
          contato: 'Matheus',
          ultimaMsg: 'JUROOO',
          hora: '13:20',
          naoLidas: 1,
          ),
        Conversa(
          contato: 'Cecilia',
          ultimaMsg: 'EU AMOOOO',
          hora: '15:18',
          naoLidas: 2,
          ),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),

      appBar: AppBar(
        title: Text('Conversas'),
      ),

      body: ListView.builder(
        itemCount: conversas.length,
        itemBuilder: (BuildContext context, int i) {
          Conversa conversa = conversas[i];
          return ListTile(
            title: Text(conversa.contato),
            subtitle: Text(conversa.ultimaMsg),
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: const Text("*"),
            ),
            trailing: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(conversa.hora),
                Badge(
                  label: Text('${conversa.naoLidas}'),
                  backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                ),
              ],
            ),
          );
        },
      )
    );
  }
}