import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_viewer/controllers/auth/auth_states.dart';
import 'package:products_viewer/views/screens/login_screen.dart';
import 'package:products_viewer/views/screens/products_screen.dart';
import '../../controllers/auth/auth_cubit.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return const ProductsScreen();
        } else if (state is UnAuthenticated || state is AuthInitial) {
          return const LoginScreen();
        }
        return const LoginScreen();
      },
    );
  }
}
