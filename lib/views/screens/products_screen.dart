import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_viewer/controllers/products/product_cubit.dart';
import 'package:products_viewer/controllers/products/product_states.dart';
import 'package:products_viewer/core/constants/constants.dart';
import 'package:products_viewer/core/widgets/custom_button_widget.dart';
import 'package:products_viewer/core/widgets/vertical_spacer.dart';
import '../../controllers/auth/auth_cubit.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          VerticalSpacer(MediaQuery.of(context).size.height * 0.1),
          Row(
            children: [
              CustomButton(
                buttonWidth: 170,
                buttonHeight: 50,
                buttonMargin: 20,
                buttonTextFontSize: 20,
                buttonBorderRadius: 10,
                buttonText: "Get All Products",
                buttonAction: () async {
                  await BlocProvider.of<ProductsCubit>(context)
                      .getAllProducts();
                },
              ),
              Expanded(
                child: CustomButton(
                  buttonWidth: 150,
                  buttonHeight: 50,
                  buttonMargin: 20,
                  buttonTextFontSize: 20,
                  buttonBorderRadius: 10,
                  buttonText: "LogOut",
                  buttonAction: () {
                    BlocProvider.of<AuthCubit>(context).loggedOut();
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<ProductsCubit, GetProductsStates>(
              builder: (context, state) {
                if (state is GetProductsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetProductsSuccess) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Card(
                          color: Constants.kSeconderColor,
                          child: ListTile(
                            title: Text(
                              state.products[index].productName,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            subtitle: Text(
                              state.products[index].quantity.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                            leading: Text(
                              state.products[index].productId,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 23),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: state.products.length,
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
