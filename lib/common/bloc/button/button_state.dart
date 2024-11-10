abstract class ButtonState {}

class ButtonInitial extends ButtonState{}

class ButtonLoading extends ButtonState{}

class ButtonLoaded extends ButtonState{
  final String message;

  ButtonLoaded({required this.message});
}

class FailureButtonLoad extends ButtonState{
  final String errorMessage;

  FailureButtonLoad({required this.errorMessage});
}