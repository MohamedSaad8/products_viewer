import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../core/shared_methods/auth_validation.dart';
import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/vertical_spacer.dart';
import '../../controllers/credential/credential_cubit.dart';
import '../../core/constants/constants.dart';
import 'auth_page_footer.dart';
import 'auth_page_header.dart';

// ignore: must_be_immutable
class CustomLoginForm extends StatelessWidget {
  String? userName;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  CustomLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const VerticalSpacer(10),
              const AuthPageHeader(
                title: "Login",
                subTitle: 'Please Sign in to continue',
              ),
              CustomTextField(
                height: 20,
                prefixIconData: Icons.email,
                iconColor: Constants.kMainColor,
                hintText: "Username",
                labelText: "Username",
                autoValidateMode: AutovalidateMode.onUserInteraction,
                onChange: (value) {
                  userName = value;
                },
                validate: (value) {
                  return userNameControllerValidator(value);
                },
              ),
              CustomTextField(
                height: 20,
                prefixIconData: Icons.lock,
                iconColor: Constants.kMainColor,
                obscureText: true,
                keyboardType: TextInputType.text,
                hintText: "Password",
                labelText: "Password",
                autoValidateMode: AutovalidateMode.onUserInteraction,
                onChange: (value) {
                  password = value;
                },
                validate: (value) {
                  return passwordControllerValidator(
                    value,
                  );
                },
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () async {},
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(
                      color: Constants.kMainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              CustomButton(
                buttonWidth: Get.width,
                buttonHeight: 60,
                buttonMargin: 10,
                buttonTextFontSize: 16,
                buttonText: "Login",
                buttonAction: () async {
                  if (formKey.currentState!.validate()) {
                    await BlocProvider.of<CredentialCubit>(context)
                        .signInWithUserNameAndPassword(userName: userName!, password: password!);
                  }
                },
                buttonBorderRadius: 10,
              ),
              AuthPageFooter(
                footerNewActionName: 'Register',
                footerHitText: "don't have an Account",
                action: () {},
              ),
              VerticalSpacer(MediaQuery.of(context).size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
