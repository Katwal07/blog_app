import 'package:blog_app/presentation/auth/login/bloc/pass_visibility_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassVisibilityCubit extends Cubit<PassVisibilityState>{
  PassVisibilityCubit(): super(PassVisibilityState(obscuredTextChange: true));

  void onClicked(bool obscureText){
    emit(PassVisibilityState(obscuredTextChange: !obscureText));
  }
}