class Post {
  final int id;
  final String title;
  final String body;
  final int likes;
  final int dislikes;
  final int views;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.likes,
    required this.dislikes,
    required this.views,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'], 
    title: json['title'], 
    body: json['body'], 
    // Acessa o objeto interno 'reactions'
    likes: json['reactions']?['likes'] ?? 0,
    dislikes: json['reactions']?['dislikes'] ?? 0,
    views: json['views'] ?? 0,
  );
         
}