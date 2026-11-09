import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aula01/features/store/presentation/bloc/product_list_bloc.dart';
import 'package:aula01/features/store/presentation/bloc/product_list_state.dart';
import 'package:aula01/features/store/presentation/bloc/product_list_event.dart';
import 'package:aula01/features/store/domain/entities/product.dart';
import 'package:aula01/features/store/infra/data/product_repository.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductListBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Catalogo de Produtos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          backgroundColor: const Color.fromARGB(255, 101, 35, 255),
          foregroundColor: Colors.white,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))],
        ),
        body: BlocBuilder<ProductListBloc, ProductListState>(
          builder: (context, state) {
            if (state is ProductListSuccess) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (BuildContext context, int i) {
                  Product product = state.products[i];
                  return Card(
                    child: ListTile(
                      title: Text(product.nome),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.categoria),
                          Row(
                            spacing: 10,
                            children: [
                              Text('R\$ ${product.preco}', style: TextStyle(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 93, 0, 255), fontSize: 20)),
                              Icon(Icons.star, color: Colors.yellow),
                              Text('${product.avaliacao}'),
                            ],
                          ),
                        ],
                      ),
                      leading: Image.network(
                        product.UrlImagem,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 26),
                    ),
                  );
                },
              );
            }

            if (state is ProductListFailure) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.cloud_off_rounded),
                  Center(child: Text(state.msg))
                ],
              );
            }

            if (state is ProductListLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}