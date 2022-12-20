part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class FetchAllProducts extends ProductEvent {}

class SearchProducts extends ProductEvent {
  final String searchWord;

  SearchProducts(this.searchWord);
}

class FetchProductByCategory extends ProductEvent {
  final String categoryName;

  FetchProductByCategory(this.categoryName);
}
