import 'package:flutter/cupertino.dart';

import '../../components/snackbar/snackbar.dart';
import '../../init/locale_storage/locale_storage_manager.dart';

class BaseFunctions {
  static BaseFunctions? _instance;
  static BaseFunctions? get instance {
    _instance ??= BaseFunctions._init();
    return _instance;
  }

  BaseFunctions._init();

  String? toShortString(String? value, {int countCharacter = 8}) {
    return value != null
        ? value.length > countCharacter
            ? "${value.substring(0, countCharacter)} ..."
            : value
        : null;
  }

 Future<void> addOrRemoveProductListLocaleStorage(BuildContext context, {required String key, required String productId}) async {
    var productList = await LocalStorageManager.getStringList(key);
    if (productList!.contains(productId)) {
      key == "favorites" ? productList.remove(productId) : snackbarWidget(context, message: "Ürün zaten sepetinizde bulunmakta !", isSuccess: false);
    } else {
      productList.add(productId);
      key == "basket" ? snackbarWidget(context, message: "Ürün sepete eklendi ") : null;
    }
    LocalStorageManager.setStringList(key, productList);
    print(productList.toString());
  }
}
