
import 'package:blog_app/presentation/post/bloc/image/image_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitialState());

  final ImagePicker _imagePicker = ImagePicker();
  XFile? selectedImage;

  Future<void> pickImage() async {
    emit(ImageLoadingState());

    try {
      final XFile? pickedImage =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        selectedImage = pickedImage;
        emit(ImageLoadedState(imagePath: selectedImage!.path));
      } else {
        emit(FailureImageLoaded(errorMessage: "No Image Selected"));
      }
    } catch (e) {
      emit(FailureImageLoaded(errorMessage: e.toString()));
    }
  }

  void reset() {
    selectedImage = null;
    emit(ImageInitialState());
  }

  String? getSelectedImagePath(){
     debugPrint("Selected image path: ${selectedImage?.path}"); 
    return selectedImage?.path;
  }
}
