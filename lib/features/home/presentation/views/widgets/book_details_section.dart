
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../data/models/book_model/item.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key,required this.book});
     final Item book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(imageUrl:book.volumeInfo?.imageLinks?.thumbnail??''),
        ),
        const SizedBox(
          height: 43.0,
        ),
        Text(
          book.volumeInfo!.title!,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6.0,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo?.authors?[0]??'',
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
         BookRating(
          count:book.volumeInfo?.ratingsCount??0,
          rating:book.volumeInfo?.averageRating??0  ,
          mainAxisAlignment:MainAxisAlignment.center ,
         ),
        const SizedBox(
          height: 37.0,
        ),
         BooksAction(bookModel: book),
      ],
    );
  }
}
