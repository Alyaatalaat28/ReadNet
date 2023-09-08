import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/book_model/item.dart';
import '../../data/repos/home_repo.dart';

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
