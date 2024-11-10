import 'package:image_picker/image_picker.dart';

import '../../post/bloc/image/image_state.dart';
import '../../post/bloc/post/category_selection_state.dart';

extension ImageStateX on ImageState {
  T when<T>({
    required T Function() initial,
    required T Function(XFile) loaded,
    required T Function(String) failure,
  }) {
    return switch (this) {
      ImageInitialState() => initial(),
      ImageLoadedState(imagePath: final path) => loaded(path),
      FailureImageLoaded(errorMessage: final msg) => failure(msg),
      // TODO: Handle this case.
      ImageState() => throw UnimplementedError(),
    };
  }
}

extension CategorySelectionStateX on CategorySelectionState {
  T when<T>({
    required T Function() initial,
    required T Function(String) selected,
    required T Function(String) failure,
  }) {
    return switch (this) {
      CategorySelectionInitial() => initial(),
      CategorySelected(selectedCategory: final category) => selected(category),
      CategorySelectionFailure(errorMessage: final msg) => failure(msg),
      // TODO: Handle this case.
      CategorySelectionState() => throw UnimplementedError(),
    };
  }
}