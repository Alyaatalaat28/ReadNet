// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  CustomErrorWidget({super.key,required this.errorMessage});
  String errorMessage;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: Styles.textStyle18,

      ),
    );
  }
}