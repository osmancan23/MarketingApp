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

class FetchAllFavoritesProducts extends ProductEvent {}

class FetchAllBasketProducts extends ProductEvent {}


class RemoveProductFromBasket extends ProductEvent{
  final String productId;

  RemoveProductFromBasket(this.productId);
}