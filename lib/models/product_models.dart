class ProductModel {
  final String productId;
  final String productName;
  final double quantity;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.quantity,
  });

   factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
     productId: json["product_id"] ,
     productName: json["product_name"],
     quantity: json["quantity"]
    );
  }


    Map<String, dynamic> toJson() {
    return {
     "product_id" : productId,
     "product_name" : productName,
     "quantity" : quantity
    };
  }
}
