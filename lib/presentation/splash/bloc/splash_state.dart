abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashAuthenticatedState extends SplashState {}

class SplashUnAuthenticatedState extends SplashState {
  final String errorMessage;
  SplashUnAuthenticatedState({required this.errorMessage});
}
