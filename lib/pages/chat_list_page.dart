import 'package:aula01/domain/conversa.dart';
import 'package:flutter/material.dart';
import 'package:aula01/infra/conversa_repository.dart';

class ChatListPage extends StatelessWidget {
  ConversaRepository repository = ConversaRepository();
  ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),

      appBar: AppBar(
        title: Text('Conversas'),
      ),

      body: ListView.builder( 
        itemCount: repository.conversas.length,
        itemBuilder: (BuildContext context, int i) {
          Conversa conversa = repository.conversas[i];
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
                  // OPERADOR TERNARIO (NÃO PODE USAR IF)
                  conversa.naoLidas > 0 
                    ? Badge(label: Text('${conversa.naoLidas}'), backgroundColor: const Color.fromARGB(255, 255, 0, 0),) 
                    : SizedBox(),
              ],
            ),
          );
        },
      )
    );
  }
}