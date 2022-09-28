import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_viewer/controllers/products/product_states.dart';
import 'package:products_viewer/core/constants/constants.dart';
import 'package:products_viewer/models/product_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsCubit extends Cubit<GetProductsStates> {
  ProductsCubit() : super(GetProductsInitial());

  Future<void> getAllProducts() async {
    Dio dio = Dio();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, List> body = {
      "products": [1, 2]
    };
    dio.options.headers["Authorization"] =
        "Bearer ${preferences.getString("userToken")}";

    emit(GetProductsLoading());

    final response = await dio
        .post(Constants.baseUrl + Constants.getProductStock, data: body);
    List<ProductModel> allProductList = [];
    if (response.statusCode == 200) {
      allProductList.clear();
      List<dynamic> data = response.data["result"]["data"];
      for (int i = 0; i < data.length; i++) {
        allProductList.add(ProductModel.fromJson(data[i]));
      }
      emit(GetProductsSuccess(products: allProductList));
    } else {
      emit(GetProductsFailure());
    }
  }
}
