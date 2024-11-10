import 'package:blog_app/presentation/post/bloc/image/image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitialState());

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;

  Future<void> pickImage() async {
    try {
      final pickedImage =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _selectedImage = pickedImage;
        emit(ImageLoadedState(imagePath: pickedImage));
      } else {
        emit(FailureImageLoaded(errorMessage: "No Image Selected"));
      }
    } catch (e) {
      emit(FailureImageLoaded(errorMessage: e.toString()));
    }
  }

  void reset() {
    _selectedImage = null;
    emit(ImageInitialState());
  }

  String? getSelectedImagePath() => _selectedImage?.path;
}
