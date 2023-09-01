import 'package:flutter/material.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height*.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) =>const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5),
          child: CustomBookImage(),
        )),
        itemCount: 10,
        
      ),
    );
  }
}