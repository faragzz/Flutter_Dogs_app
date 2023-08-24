import 'package:flutter/material.dart';

class ImageListTile extends StatelessWidget {
  final int index;
  final List<String> breedListImage;
  const ImageListTile(
      {super.key, required this.index, required this.breedListImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.purple[50],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          breedListImage[index],
          fit: BoxFit.cover,
        ),
      ), //
    );
  }
}
