abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashAuthenticatedState extends SplashState {}

class SplashUnAuthenticatedOnBoardingCompleteState extends SplashState {}

class SplashUnAuthenticatedOnUnBoardingUnCompleteState extends SplashState {}

class OnBoardingNotComplete extends SplashState{}

class OnBoardingComplete extends SplashState{}
