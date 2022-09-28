import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:products_viewer/views/screens/products_screen.dart';
import '../../controllers/auth/auth_cubit.dart';
import '../../controllers/auth/auth_states.dart';
import '../../controllers/credential/credential_cubit.dart';
import '../../controllers/credential/credential_state.dart';
import '../widgets/custom_login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: BlocConsumer<CredentialCubit, CredentialState>(
          listener: (context, credentialState) {
            if (credentialState is CredentialLoading) {
              context.read<CredentialCubit>().isLoading = true;
            }
            if (credentialState is CredentialSuccess) {
              context.read<CredentialCubit>().isLoading = false;
              BlocProvider.of<AuthCubit>(context).loggedIn();
            }
            if (credentialState is CredentialFailure) {
              context.read<CredentialCubit>().isLoading = false;
              const snackBar = SnackBar(
                content: Text('username or password is not correct'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, credentialState) {
            if (credentialState is CredentialSuccess) {
              return BlocBuilder<AuthCubit, AuthState>(
                builder: (context, authState) {
                  if (authState is Authenticated) {
                    return const ProductsScreen();
                  } else {
                    return CustomLoginForm();
                  }
                },
              );
            }
            return ModalProgressHUD(
              inAsyncCall: context.read<CredentialCubit>().isLoading,
              child: CustomLoginForm(),
            );
          },
        ),
      );
    });
  }
}
