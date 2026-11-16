import 'package:aula01/features/posts/domain/entities/post.dart';
import 'package:aula01/features/posts/infra/data/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_list_event.dart';
import 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final PostRepository postRepo = PostRepository();

  PostListBloc() : super(PostListLoading()) {
    on<PostListInitialize>((event, emit) async {
      // Garante que o estado de loading seja emitido caso o evento seja chamado novamente
      emit(PostListLoading()); 
      
      try {
        await Future.delayed(const Duration(seconds: 1));
        List<Post> dados = await postRepo.all();

        // Verifica se a lista NÃO está vazia
        if (dados.isNotEmpty) {
          emit(PostListSuccess(posts: dados));
        } else {
          emit(PostListFailure(msg: "Sem Dados"));
        }
      } catch (e) {
        // Captura erros de API ou de conversão do JSON (Opção A)
        emit(PostListFailure(msg: "Erro ao carregar posts: $e"));
      }
    });

    add(PostListInitialize());
  }
}