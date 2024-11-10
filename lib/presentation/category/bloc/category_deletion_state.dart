abstract class CategoryDeletionState {}

class CategoryDeletionInitial extends CategoryDeletionState {}

class CategoryDeleting extends CategoryDeletionState {}

class CategoryDeleted extends CategoryDeletionState {
  final String message;

  CategoryDeleted({required this.message});
}

class FailureCategoryDeletion extends CategoryDeletionState {
  final String errorMessage;

  FailureCategoryDeletion({required this.errorMessage});
}
