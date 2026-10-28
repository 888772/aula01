import 'package:aula01/features/chat/domain/entities/conversa.dart';
import 'package:aula01/features/chat/infra/data/conversa_repository.dart';
import 'package:aula01/features/chat/presentation/bloc/conversa_list_event.dart';
import 'package:aula01/features/chat/presentation/bloc/conversa_list_state.dart';
import 'package:flutter/material.dart';
import 'package:aula01/features/chat/presentation/bloc/conversa_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversaListPage extends StatelessWidget {
  const ConversaListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => ConversaListBloc(),
    child: Scaffold(
      appBar: AppBar(title: Text('Conversas')),
      body: BlocBuilder<ConversaListBloc, ConversaListState>(
        builder: (context, state) {
          if (state is ConversaListSuccess) {
            return  ListView.builder(
              itemCount: state.conversas.length,
              itemBuilder: (BuildContext context, int i) {
                Conversa conversa = state.conversas[i];
                return ListTile(
                  onTap: () {
                    context.read<ConversaListBloc>().add(ConversaListDuplicaConversa(conversa: conversa));
                  },
                  title: Text(conversa.contato),
                  subtitle: Text(conversa.ultimaMsg),
                  leading: CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                    foregroundColor: Colors.white,
                    child: Text(conversa.sigla),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(conversa.hora),
                      conversa.naoLidas > 0
                          ? Badge(label: Text('${conversa.naoLidas}'))
                          : SizedBox(),
                    ],
                  ),
                );
              },
            );
          }

          if (state is ConversaListFailure) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(Icons.cloud_off_rounded),
                Center(child: Text(state.msg))
              ],
            );
          }

          if (state is ConversaListLoading) {
            //
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator()
              ),
              Text(" "),
              Text("Carregando conversas.....")
            ],
          );
        },
      )
    ),
    );
  }
}
