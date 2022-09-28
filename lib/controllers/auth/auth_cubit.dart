import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthState>
{
  AuthCubit() : super(AuthInitial());

  void appStarted() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? isSignIn = preferences.getBool("isLogin");

    if (isSignIn != true || isSignIn == null) {
      emit(UnAuthenticated());
    } else {
      String userToken = preferences.getString("userToken")!;
      emit(Authenticated(userToken: userToken ));
    }
  }

  void loggedIn() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
     String userToken = preferences.getString("userToken")! ;
      emit(Authenticated(userToken: userToken));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      preferences.clear() ;
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
  
}