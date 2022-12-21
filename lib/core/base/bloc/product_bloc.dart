import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../init/locale_storage/locale_storage_manager.dart';
import '../model/product_model.dart';
import '../service/i_product_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductService _productService;
  ProductBloc(this._productService) : super(ProductInitial()) {
    on<FetchAllProducts>((event, emit) async {
      try {
        emit(ProductsLoading());
        var response = await _productService.fetchAllProductS();
        emit(ProductsLoaded(response));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });

    on<SearchProducts>((event, emit) async {
      try {
        emit(ProductsLoading());
        var response = await _productService.searchProducts(searchWord: event.searchWord);
        emit(ProductsLoaded(response));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });

    on<FetchProductByCategory>((event, emit) async {
      try {
        emit(ProductsLoading());
        var response = await _productService.fetchAllProductsByCategory(categoryName: event.categoryName);
        emit(ProductsLoaded(response));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });

    on<FetchAllFavoritesProducts>((event, emit) async {
      try {
        emit(ProductsLoading());
        List<ProductModel> products = [];
        var favorites = await LocalStorageManager.getStringList("favorites");
        favorites?.forEach((element) async {
          var product = await _productService.fetchProductById(productId: int.parse(element));
          products.add(product);
        });
        emit(ProductsLoaded(products));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });

    on<FetchAllBasketProducts>((event, emit) async {
      try {
        emit(ProductsLoading());
        List<ProductModel> products = [];
        var favorites = await LocalStorageManager.getStringList("basket");
        favorites?.forEach((element) async {
          var product = await _productService.fetchProductById(productId: int.parse(element));
          products.add(product);
        });
        emit(ProductsLoaded(products));
      } catch (e) {
        emit(ProductLoadError(e.toString()));
      }
    });
    on<RemoveProductFromBasket>((event, emit) async {
      try {
        var basket = await LocalStorageManager.getStringList("basket");
        basket!.remove(event.productId);
        LocalStorageManager.setStringList("basket", basket);
        emit(UpdatedBasket());
      } catch (e) {
        emit(UpdateBasketError(e.toString()));
      }
    });
  }
}
