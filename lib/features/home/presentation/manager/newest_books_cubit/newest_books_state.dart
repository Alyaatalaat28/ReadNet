// ignore_for_file: must_be_immutable

part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}
final class NewestBooksLoadingState extends NewestBooksState {}


final class NewestBooksErrorState extends NewestBooksState {
  final String error;

  const NewestBooksErrorState(this.error);

}

final class NewestBooksSuccessState extends NewestBooksState {
  List<Item>books=[];
  NewestBooksSuccessState(this.books);

}
