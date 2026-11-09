import 'package:aula01/features/chat/presentation/pages/conversa_list_page.dart';
import 'package:aula01/features/store/presentation/pages/product_list_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TADS IV')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text('Módulos', style: TextStyle(fontSize: 16)),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              Card(
                elevation: 0.5,
                color: const Color.fromARGB(255, 101, 35, 255),
                child: ListTile(
                  title: Text('Chat', style: TextStyle(color: Colors.white)),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConversaListPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Card(
                elevation: 0.5,
                color: const Color.fromARGB(255, 101, 35, 255),
                child: ListTile(
                  title: Text('Store', style: TextStyle(color: Colors.white)),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      ),
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductListPage())
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
