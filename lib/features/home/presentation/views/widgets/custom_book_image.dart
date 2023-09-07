import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_data.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: const AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Image(
          image: AssetImage(AssetsData.testImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
