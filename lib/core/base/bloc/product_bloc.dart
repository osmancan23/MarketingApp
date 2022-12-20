import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../service/i_product_service.dart';
import '../model/product_model.dart';

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
  }
}
