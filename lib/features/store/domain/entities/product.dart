class Product {
  final int id;
  final String nome;
  final double preco;
  final String categoria;
  final double avaliacao;
  final String UrlImagem;


  Product({
    required this.id,
    required this.nome,
    required this.preco,
    required this.categoria,
    required this.avaliacao,
    required this.UrlImagem,
  });

  // factory Product.fromJson(Map<String, dynamic> json){
  //   final id = json['id'] as int;
  //   // return Product(id: id, nome: nome, preco: preco, categoria: categoria, avaliacao: avaliacao, UrlImagem: UrlImagem)
  // }

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    nome: json['title'],
    preco: json['price'],
    categoria: json['category'],
    avaliacao: json['rating'],
    UrlImagem: json['thumbnail']
    );

}