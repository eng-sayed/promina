abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginErrorState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterErrorState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class LogoutLoadingState extends AuthStates {}

class LogoutErrorState extends AuthStates {}

class LogoutSuccessState extends AuthStates {}
