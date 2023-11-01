import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
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
