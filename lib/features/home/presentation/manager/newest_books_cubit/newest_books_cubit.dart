import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:equatable/equatable.dart';


part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.homeRepo}) : super(NewestBooksInitial());

  HomeRepo homeRepo;
  Future<void>featchNewestdBooks()async{
    emit(NewestBooksLoadingState());
    var result=await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) =>emit(NewestBooksErrorState(failure.errMessage)) , 
      (books) =>emit(NewestBooksSuccessState(books)) );
  }
}
