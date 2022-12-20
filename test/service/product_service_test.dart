import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:marketing_app/core/init/network/network_manager.dart';
import 'package:marketing_app/core/base/service/i_product_service.dart';
import 'package:marketing_app/core/base/service/product_service.dart';

void main() {
  late IProductService productService;
  setUp(() {
    productService = ProductService(VexanaManager());
  });
  test('Fetch All Products Service Test', () async {
    var res = await productService.fetchAllProductS();
    print(res.first.title);
  });

  test('Fetch All Products By Category Service Test', () async {
    var res = await productService.fetchAllProductsByCategory(categoryName: "smartphones");
    print(res.first.title);
  });

  test('Fetch All Products By Id Service Test', () async {
    var res = await productService.fetchProductById(productId: 10);
    print(res.title);
  });

  test('Search Products  Service Test', () async {
    var res = await productService.searchProducts(searchWord: "lapto");
    print(res.first.title);
  });
}
