import 'package:aula01/features/store/infra/data/product_repository.dart';
import 'package:aula01/features/store/domain/entities/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_list_event.dart';
import 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository productRepo = ProductRepository();
  
  ProductListBloc() : super(ProductListLoading()) {
    on<ProductListInitialize>((event, emit) async {
      await Future.delayed(Duration(seconds: 3));
      List<Product> dados = await productRepo.all();
      if (dados.isNotEmpty) {
        emit(ProductListSuccess(products: dados));
      } else {
        emit(ProductListFailure(msg: "Sem dados"));
      }
    });

    add(ProductListInitialize());
  }
}