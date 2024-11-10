import 'package:image_picker/image_picker.dart';

abstract class ImageState {}

class ImageInitialState extends ImageState{}

class ImageLoadingState extends ImageState{}

class ImageLoadedState extends ImageState{
  final XFile imagePath;

  ImageLoadedState({required this.imagePath});
}

class FailureImageLoaded extends ImageState{
  final String errorMessage;

  FailureImageLoaded({required this.errorMessage});
}