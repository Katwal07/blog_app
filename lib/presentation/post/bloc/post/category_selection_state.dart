abstract class CategorySelectionState {}

class CategorySelectionInitial extends CategorySelectionState{}

class CategorySelected extends CategorySelectionState{
  final String selectedCategory;

  CategorySelected({required this.selectedCategory});
}

class CategorySelectionFailure extends CategorySelectionState{
  final String errorMessage;

  CategorySelectionFailure({required this.errorMessage});
}