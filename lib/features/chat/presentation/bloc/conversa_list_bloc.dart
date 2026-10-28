import 'package:aula01/features/chat/domain/entities/conversa.dart';
import 'package:aula01/features/chat/infra/data/conversa_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'conversa_list_event.dart';
import 'conversa_list_state.dart';


class ConversaListBloc extends Bloc<ConversaListEvent, ConversaListState> {
  // Implementação do BLoC para gerenciar o estado da lista de conversas

  final ConversaRepository conversaRepo = ConversaRepository();

  ConversaListBloc() : super(ConversaListLoading()) {
    // Capitura o evento de inicialização
    on<ConversaListInitialize>((event, emit) async {
      await Future.delayed(Duration(seconds: 1));
      List<Conversa> dados = conversaRepo.conversas;
      if (dados.isNotEmpty) {
       emit(ConversaListSuccess(conversas: dados)); 
      }
      else {
        emit(ConversaListFailure(msg: "Sem dados"));
      }
    });

    on<ConversaListDuplicaConversa>((event, emit) async {
      // EMITO O LOADING PARA EXIBIR O CARREGAMENTO NA TELA
      emit(ConversaListLoading());
      await Future.delayed(Duration(seconds: 1));

      conversaRepo.add(event.conversa);
      emit(ConversaListSuccess(conversas: conversaRepo.conversas));
    },);

    // Dispara um evento de inicialização
    add(ConversaListInitialize());
  }

}