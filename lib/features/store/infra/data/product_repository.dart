import 'package:aula01/features/store/domain/entities/product.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class ProductRepository {
  // BD

  final List<Product> _products = [
    // Product(
    //   id: int.fromEnvironment('PLAYSTATION5_ID', defaultValue: 1),
    //   nome: 'Console Playstation 5 Slim Digital Edition, 825GB, USB, HDMI, Branco',
    //   preco: 4.356,
    //   categoria: 'Eletrônicos',
    //   avaliacao: '4.8',
    //   UrlImagem: 'https://images.kabum.com.br/produtos/fotos/sync_mirakl/939944/xlarge/Console-Playstation-5-Slim-Digital-Edition-825GB-USB-HDMI-Branco_1772549615.jpg',
    // ),
    // Product(
    //   id: int.fromEnvironment('SMART_TV_ID', defaultValue: 2),
    //   nome: 'Smart Tv Philips 50'' 4k Led Hdr10+ Comando De Voz 50pug7300',
    //   preco: 1.978,
    //   categoria: 'Eletrônicos',
    //   avaliacao: '4.2',
    //   UrlImagem: 'https://http2.mlstatic.com/D_NQ_NP_2X_603690-MLA93305557455_092025-F-smart-tv-philips-50-4k-led-hdr10-comando-de-voz-50pug7300.webp',
    // ),
    // Product(
    //   id: int.fromEnvironment('CAMERA_SEGURANCA_ID', defaultValue: 3),
    //   nome: 'TP-Link Tapo C200, Camera de Segurança Wi-Fi 360º',
    //   preco: 148.90,
    //   categoria: 'Eletrônicos',
    //   avaliacao: '4.8',
    //   UrlImagem: 'https://m.media-amazon.com/images/I/41WQe9NiU6L._AC_SX679_.jpg',
    // ),
  ];

  void add(Product product) => _products.add(product);
  Future<List<Product>> all() async {
    final Uri url = Uri.parse("https://dummyjson.com/products/");

    try {
      final response = await http.get(url);

      // MODO 01

      // if (response.statusCode == 200) {
      //   Map<String, dynamic> json = jsonDecode(response.body);
      //   List<dynamic> products = json["products"];

      //   List<Product> listaProdutos = [];

      //   for (dynamic prod in products) {
      //     Product product = Product(
      //       id: prod['id'],
      //       nome: prod['title'],
      //       preco: prod['price'],
      //       categoria: prod['category'],
      //       avaliacao: prod['rating'],
      //       UrlImagem: prod['thumbnail']
      //     );

      //     listaProdutos.add(product);
      //   }
      //   return listaProdutos;
      // }
      
      // MODO 02

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> products = json["products"];
        return products.map((e) => Product.fromJson(e)).toList();
      }
      
      throw Exception();
    } catch (e) {
      print('Erro de conexão: $e');
      return List.empty();
    }
  } // alterar metodo para o http pegar no json do dummyjson
}
