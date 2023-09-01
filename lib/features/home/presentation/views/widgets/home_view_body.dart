import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'best_seller_listview.dart';
import 'custom_appbar.dart';
import 'featured_book_listview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 30),
               child: CustomAppBar(),
             ),
             FeaturedBookListView(),
             SizedBox(height: 50.0,),
             Padding(
               padding:EdgeInsets.symmetric(horizontal: 30),
               child: Text('Newst Books',
               style: Styles.textStyle18,),
             ),
             SizedBox(height: 20.0,)
          ],
        ),
        ),
        SliverFillRemaining(
          child:Padding(
            padding:EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ) ,
        ),
      ],

    );
  }
}