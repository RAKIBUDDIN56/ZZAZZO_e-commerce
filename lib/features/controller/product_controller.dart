import 'package:get/get.dart';
import 'package:rakibuddin560p/constants/http_service/http_service.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var isLoading2 = true.obs;
  var productList = [].obs;
  var productListWomen = [].obs;

  @override
  void onInit() {
    fetchProducts();
    fetchProductsWomen();

    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var data = await HttpService.fetchproducts();
      if (data != null) {
        productList.value = data;
      } else {
        throw Exception("Error Message");
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchProductsWomen() async {
    try {
      isLoading2(true);
      var data = await HttpService.fetchproductsWomen();
      if (data != null) {
        productListWomen.value = data;
      } else {
        throw Exception("Error Message");
      }
    } finally {
      isLoading2(false);
    }
  }
}
