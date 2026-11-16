import 'package:aula01/features/posts/domain/entities/post.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class PostRepository {
  final List<Post> _posts = [
    Post(
      id: 1,
      title: 'Introdução ao Flutter e Dart',
      body: 'Aprenda a criar objetos e estruturar modelos de dados de forma simples.',
      likes: 120,
      tags: ['flutter', 'dart', 'programacao'],
      dislikes: 3,
      views: 1540,
    )
  ];

  void add(Post post) => _posts.add(post);
  Future<List<Post>> all() async {
    final Uri url = Uri.parse("https://dummyjson.com/posts");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> posts = json["posts"];
        // List<dynamic> reactions = json["reactions"];
        return posts.map(((e) => Post.fromJson(e))).toList();
      }
      throw Exception();
    } catch (e) {
      print('Erro de conexão: $e');
      return List.empty();
    }
  }
}