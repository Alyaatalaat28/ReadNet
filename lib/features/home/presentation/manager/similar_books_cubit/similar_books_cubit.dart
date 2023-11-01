import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:equatable/equatable.dart';


part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  
  final  HomeRepo homeRepo;

   Future<void>featchSimilarBooks({required String category})async{
    emit(SimilarBooksInitial());
    var result=await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) =>emit(SimilarBooksErrorState(failure.errMessage)) , 
      (books) =>emit(SimilarBooksSuccessState(books)) );
  }
}
