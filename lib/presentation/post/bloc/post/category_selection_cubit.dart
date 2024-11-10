import 'package:blog_app/presentation/post/bloc/post/category_selection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelectionCubit extends Cubit<CategorySelectionState> {
  CategorySelectionCubit() : super(CategorySelectionInitial());
  
  String? _selectedCategory;

  void selectCategory(String category) {
    try {
      if (category.isEmpty) {
        emit(CategorySelectionFailure(errorMessage: "No Category Selected"));
        _selectedCategory = null;
      } else {
        _selectedCategory = category;
        emit(CategorySelected(selectedCategory: category));
      }
    } catch (e) {
      _selectedCategory = null;
      emit(CategorySelectionFailure(errorMessage: e.toString()));
    }
  }

  String? getSelectedCategory() => _selectedCategory;
}