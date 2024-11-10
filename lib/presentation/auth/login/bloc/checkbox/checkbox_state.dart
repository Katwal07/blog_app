abstract class CheckBoxState{}

class CheckBoxInitial extends CheckBoxState{
  final bool value;

  CheckBoxInitial({this.value = false});
}

class CheckBoxClicked extends CheckBoxState{
  final bool value;

  CheckBoxClicked({required this.value});
}