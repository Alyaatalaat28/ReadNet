import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetails);
      },
      child:  SizedBox(
        height: 125,
        child:  Row(
          children: [
           const SizedBox(
              child: CustomBookImage()),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Harry Potter and the Goblet of Fire',
                    style: Styles.textStyle20.copyWith(
                      fontFamily:kGtSectraFine, 
                    ),),
                    const SizedBox(height: 3.0,),
                   const Text('J.K. Rowling',
                    style:Styles.textStyle14 ,),
                    const SizedBox(height: 3.0,),
                    Row(
                      children: [
                          Text('Free',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold
                          ),),
                          const Spacer(),
                        const  BookRating(),

                      ],
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}