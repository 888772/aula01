import 'package:aula01/features/store/domain/entities/product.dart';

sealed class ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListSuccess extends ProductListState {
  final List<Product> products;
  ProductListSuccess({
    required this.products,
  });
}

class ProductListFailure extends ProductListState {
  final String msg;
  ProductListFailure({
    required this.msg,
  });
}

