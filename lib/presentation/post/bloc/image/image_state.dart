
abstract class ImageState {}

class ImageInitialState extends ImageState{}

class ImageLoadingState extends ImageState{}

class ImageLoadedState extends ImageState{
  final String imagePath;

  ImageLoadedState({required this.imagePath});
}

class FailureImageLoaded extends ImageState{
  final String errorMessage;

  FailureImageLoaded({required this.errorMessage});
}