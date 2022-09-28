abstract class AuthState  {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  String userToken ;
  Authenticated({
    required this.userToken,
  });
}

class UnAuthenticated extends AuthState {}
