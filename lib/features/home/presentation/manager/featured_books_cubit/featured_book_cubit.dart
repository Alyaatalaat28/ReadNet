import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/book_model/item.dart';
import '../../data/repos/home_repo.dart';
part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit({required this.homeRepo}) : super(FeaturedBookInitial());

  HomeRepo homeRepo;

  Future<void>featchFeaturedBooks()async{
    emit(FeaturedBookLoadingState());
    var result=await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) =>emit(FeaturedBookErrorState(failure.errMessage)) , 
      (books) =>emit(FeaturedBookSuccessState(books)) );
  }
}
