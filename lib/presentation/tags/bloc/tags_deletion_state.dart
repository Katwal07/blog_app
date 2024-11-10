abstract class TagsDeletionState {}

class TagsDeletionInitial extends TagsDeletionState{}

class TagsDeletionLoading extends TagsDeletionState{}

class TagsDeleted extends TagsDeletionState{
  final String message;

  TagsDeleted({required this.message});
}

class FailureTagDeletion extends TagsDeletionState{
  final String errorMessage;

  FailureTagDeletion({required this.errorMessage});
}