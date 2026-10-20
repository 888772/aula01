import 'package:aula01/domain/conversa.dart';

class ConversaRepository {
  // This class is responsible for managing conversations in the application.
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
          naoLidas: 0,
          ),
    ];

}