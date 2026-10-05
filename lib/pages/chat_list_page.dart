import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversas'),),
      body: ListView(
        children: [
          ListTile(
            title: Text("José Eduardo"),
            subtitle: Text("Olá meu amigo"),
            leading: CircleAvatar(backgroundColor: Colors.red, child: const Text("JE"),),
            trailing: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("17:00"),
                Text("1"),
              ],
            ),
          ),
          ListTile(
            title: Text("Cecilia"),
            subtitle: Text("Sabemos de tudo"),
            leading: CircleAvatar(backgroundColor: Colors.deepPurpleAccent, child: Text("C"),),
            trailing: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("17:00"),
                Text("1"),
              ],
            ),
          )
        ],
      ),
    );
  }
}