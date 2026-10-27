import 'package:flutter_bloc/flutter_bloc.dart';
import 'conversa_list_event.dart';
import 'conversa_list_state.dart';


class ConversaListBloc extends Bloc<ConversaListEvent, ConversaListState> {
  // Implementação do BLoC para gerenciar o estado da lista de conversas

  ConversaListBloc() : super(ConversaListLoading()) {
    on<ConversaListInitialize>((event, emit) {
      // Lógica para inicializar a lista de conversas
      
      // Aqui você pode buscar as conversas de um repositório ou serviço
      // e emitir o estado apropriado (ConversaListSuccess ou ConversaListFailure)
    });
  }

}