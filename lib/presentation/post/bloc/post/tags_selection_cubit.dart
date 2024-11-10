import 'package:flutter_bloc/flutter_bloc.dart';
import 'tags_selection_state.dart';

class TagsSelectionCubit extends Cubit<TagsSelectionState> {
  TagsSelectionCubit() : super(TagsSelectionInitial());
  
  String? _selectedTags;

  void selectTags(String tags) {
    try {
      if (tags.isEmpty) {
        _selectedTags = null;
        emit(TagsSelectionFailure(errorMessage: "No Tags Selected"));
      } else {
        _selectedTags = tags;
        emit(TagsSelected(selectedTags: tags));
      }
    } catch (e) {
      _selectedTags = null;
      emit(TagsSelectionFailure(errorMessage: e.toString()));
    }
  }

  String? getSelectedTag() => _selectedTags;
}