class Post {
  final int id;
  final String title;
  final String body;
  final List<String> tags;
  final int likes;
  final int dislikes;
  final int views;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.likes,
    required this.tags,
    required this.dislikes,
    required this.views,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'], 
    title: json['title'], 
    body: json['body'], 
    // Converte a lista dinâmica de tags para List<String>
    tags: List<String>.from(json['tags'] ?? []),
    // Acessa o objeto interno 'reactions'
    likes: json['reactions']?['likes'] ?? 0,
    dislikes: json['reactions']?['dislikes'] ?? 0,
    views: json['views'] ?? 0,
  );
         
}