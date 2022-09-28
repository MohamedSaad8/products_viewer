// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:products_viewer/models/product_models.dart';

abstract class GetProductsStates  {}

class GetProductsInitial extends GetProductsStates {}

class GetProductsLoading extends GetProductsStates {}

class GetProductsSuccess extends GetProductsStates {

List<ProductModel> products;
  GetProductsSuccess({
    required this.products,
  });
}

class GetProductsFailure extends GetProductsStates {}