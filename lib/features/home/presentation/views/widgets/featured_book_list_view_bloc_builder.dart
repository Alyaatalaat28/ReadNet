import 'package:bookly_app/core/widgets/error_widget.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_book_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/featured_books_cubit/featured_book_cubit.dart';

class FeatuedBooksListViewBlocBuilder extends StatefulWidget {
  const FeatuedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeatuedBooksListViewBlocBuilder> createState() =>
      _FeatuedBooksListViewBlocBuilderState();
}

class _FeatuedBooksListViewBlocBuilderState
    extends State<FeatuedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBookCubit, FeaturedBookState>(
      listener: (context, state) {
        if (state is FeaturedBookSuccessState) {
          books.addAll(state.books);
        }

        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.error),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBookSuccessState ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBookListView(
            books: books,
          );
        } else if (state is FeaturedBookErrorState) {
          return Text(state.error);
        } else {
          return const FeaturedBooksListViewLoadingIndicator();
        }
      },
    );
  }
}