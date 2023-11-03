// ignore_for_file: must_be_immutable

part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksLoadingState extends SimilarBooksState {}


final class SimilarBooksErrorState extends SimilarBooksState {
  final String error;

  const SimilarBooksErrorState(this.error);

}

final class SimilarBooksSuccessState extends SimilarBooksState {
  List<BookEntity>books=[];
  SimilarBooksSuccessState(this.books);

}