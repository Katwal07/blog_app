abstract class ButtonState {}

class ButtonInitial extends ButtonState{}

class ButtonLoading extends ButtonState{}

class ButtonLoaded extends ButtonState{}

class FailureButtonLoad extends ButtonState{
  final String errorMessage;

  FailureButtonLoad({required this.errorMessage});
}