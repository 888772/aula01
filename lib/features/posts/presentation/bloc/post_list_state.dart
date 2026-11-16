
import 'package:aula01/features/posts/domain/entities/post.dart';

sealed class PostListState {}

class PostListLoading extends PostListState {}

class PostListSuccess extends PostListState {
  final List<Post> posts;
  PostListSuccess({
    required this.posts,
  });
}

class PostListFailure extends PostListState {
  final String msg;
  PostListFailure({
    required this.msg,
  });
}