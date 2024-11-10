import 'package:blog_app/domain/tags/usecases/delete_tags_usecase.dart';
import 'package:blog_app/presentation/tags/bloc/tags_deletion_state.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagsDeletionCubit extends Cubit<TagsDeletionState>{
  TagsDeletionCubit(): super(TagsDeletionInitial());

  Future<void> deleteTags( String id,) async{
    emit(TagsDeletionLoading());
    var returnedData = await sl<DeleteTagsUsecase>().call(params: id);
    returnedData.fold(
      (error){
        emit(FailureTagDeletion(errorMessage: error));
      }, (data){
        emit(TagsDeleted(message: data['message']));
      });
  }
}