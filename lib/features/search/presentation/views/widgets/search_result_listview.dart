import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/best_seller_listview_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics:const BouncingScrollPhysics(),
      itemBuilder: (context,index)=>const BestSellerListViewItem(),
      itemCount: 10,
    );
  }
}