import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
   final String path;

  const ImageAsset({super.key, required this.path});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: 24, // Set width according to your preference
      height: 24, // Set height according to your preference
    );
  }
}
