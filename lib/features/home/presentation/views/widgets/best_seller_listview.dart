import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'best_seller_listview_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state){
        if(state is NewestBooksSuccessState) {
          return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) =>  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: BestSellerListViewItem(bookModel:state.books[index],),
          ),
          itemCount: state.books.length,
        );
        }else if(state is NewestBooksErrorState){
          return CustomErrorWidget(errorMessage: state.error,);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
