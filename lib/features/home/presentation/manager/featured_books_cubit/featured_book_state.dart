// ignore_for_file: must_be_immutable

part of 'featured_book_cubit.dart';

sealed class FeaturedBookState extends Equatable {
  const FeaturedBookState();

  @override
  List<Object> get props => [];
}

final class FeaturedBookInitial extends FeaturedBookState {}

final class FeaturedBookLoadingState extends FeaturedBookState {}


final class FeaturedBookErrorState extends FeaturedBookState {
  final String error;

  const FeaturedBookErrorState(this.error);

}

final class FeaturedBookSuccessState extends FeaturedBookState {
  List<Item>books=[];
  FeaturedBookSuccessState(this.books);

}
