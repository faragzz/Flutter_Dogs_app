import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoritesTile extends StatelessWidget {
  final String name;
  final List<String> list;
  final Function(BuildContext)? deleteFunction;

  const FavoritesTile({
    super.key,
    required this.name,
    required this.list,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12)),
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.purple[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (int i = 0; i < list.length; i++) ...[
                  Image.network(list[i], width: 70),
                ]
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
