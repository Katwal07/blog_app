abstract class OnBoardState {}

class OnBoardingNotComplete extends OnBoardState{}

class OnBoardingComplete extends OnBoardState{}

class OnBoardPageChangedState extends OnBoardState {
  final int pageIndex;

  OnBoardPageChangedState({required this.pageIndex});
}
