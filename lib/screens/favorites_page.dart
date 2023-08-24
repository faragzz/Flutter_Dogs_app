import 'package:dogs_app/components/favorites_tile.dart';
import 'package:dogs_app/model/saved_data_info.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late Box<SavedDataInfo> mybox;

  @override
  void initState() {
    super.initState();
    mybox = Hive.box('mybox');
  }

  void deleteAllfunction() {
    mybox.clear();
    showSankBar('deleted all form favorites');
  }

  void deleteTask(String index) {
    mybox.delete(index);
    showSankBar(' deleted $index form favorites');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Center(child: Text('Favorites')),
            IconButton(
                onPressed: () => deleteAllfunction(),
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: mybox.listenable(),
        builder: (context, Box<SavedDataInfo> box, _) {
          List<SavedDataInfo> list = box.values.toList();

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: FavoritesTile(
                  name: list[index].name,
                  list: list[index].list,
                  deleteFunction: (context) => deleteTask(list[index].name),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void showSankBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
