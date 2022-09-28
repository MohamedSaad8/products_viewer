import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_viewer/controllers/products/product_cubit.dart';
import 'package:products_viewer/views/screens/control_screen.dart';
import 'controllers/auth/auth_cubit.dart';
import 'controllers/credential/credential_cubit.dart';

void main() async {
  runApp(const ProductsViewer());
  SystemChrome.setPreferredOrientations(
     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class ProductsViewer extends StatelessWidget {
  const ProductsViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit()..appStarted(),
        ),
        BlocProvider<ProductsCubit>(
          create: (context) => ProductsCubit(),
        ),
         BlocProvider<CredentialCubit>(
          create: (context) => CredentialCubit(),
        ),
      ],
      child: const MaterialApp(
        home: ControlScreen(),
      ),
    );
  }
}



