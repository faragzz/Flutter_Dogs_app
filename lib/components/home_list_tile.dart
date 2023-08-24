import 'package:flutter/material.dart';

class AllBreedsListTile extends StatelessWidget {
  final String breed;
  final List<String> subBreeds;
  void Function()? onPressed;
  AllBreedsListTile({
    super.key,
    required this.breed,
    required this.subBreeds,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(breed),
        subtitle: subBreeds.isNotEmpty
            ? Text(subBreeds.join(', '))
            : const Text('No sub-breeds'),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.image),
        ),
      ),
    );
  }
}
