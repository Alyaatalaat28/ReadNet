
import 'package:bookly_app/core/utils/function/launch_url.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../data/models/book_model/item.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key,required this.bookModel});
    final Item bookModel;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            text: 'Free',
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            ),
          )),
          Expanded(
              child: CustomButton(
              onPressed: (){
                 launchCustomUrl(context, bookModel.volumeInfo!.previewLink);
                },
            text: getText(bookModel),
            fontSize: 16.0,
            textColor: Colors.white,
            backgroundColor: const Color(0xffEF8262),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0)),
          )),
        ],
      ),
    );
  }
  String getText(Item bookModel){
    if(bookModel.volumeInfo?.previewLink==null){
      return 'Not Available';
    }else{
      return 'Preview';
    }
  }
}
