abstract class OnBoardState {}


class OnBoardPageChangedState extends OnBoardState {
  final int pageIndex;

  OnBoardPageChangedState({required this.pageIndex});
}
