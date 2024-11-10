abstract class TagsSelectionState {}

class TagsSelectionInitial extends TagsSelectionState{}

class TagsSelected extends TagsSelectionState{
  final String selectedTags;

  TagsSelected({required this.selectedTags});
}

class TagsSelectionFailure extends TagsSelectionState{
  final String errorMessage;

  TagsSelectionFailure({required this.errorMessage});
}