import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_viewer/core/constants/constants.dart';
import 'package:products_viewer/core/helper/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  bool isLoading = false;
  CredentialCubit() : super(CredentialInitial());

  Future<void> signInWithUserNameAndPassword(
      {required String userName, required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    Map<String, String> body = {"identity": userName, "password": password};

    emit(CredentialLoading());

    final response = await ApiHelper().post(
      url: Constants.baseUrl + Constants.loginUrl,
      body: body,
    );
    if (response != null) {
      preferences.setBool("isLogin", true);
      preferences.setString(
          "userToken", response["result"]["data"][0]["token"]);
      log(preferences.getString("userToken").toString());
      emit(CredentialSuccess());
    } else {
      emit(CredentialFailure());
    }
  }
}
