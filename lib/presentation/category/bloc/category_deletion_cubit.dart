import 'package:blog_app/domain/category/usecase/delete_category_usecase.dart';
import 'package:blog_app/presentation/category/bloc/category_deletion_state.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDeletionCubit extends Cubit<CategoryDeletionState>{
  CategoryDeletionCubit(): super(CategoryDeletionInitial());

  Future<void> deleteCategory(String id) async{
    emit(CategoryDeleting());
    var returnedData = await sl<DeleteCategoryUsecase>().call(params: id);
    return returnedData.fold(
      (error){
        emit(FailureCategoryDeletion(errorMessage: error));
      }, (data){
        emit(CategoryDeleted(message: data['message']));
      });
  }
}