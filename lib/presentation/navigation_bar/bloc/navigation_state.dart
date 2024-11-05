abstract class NavigationState {}

class NavigationPageState extends NavigationState {
  final int tabIndex;

  NavigationPageState({required this.tabIndex});
}
