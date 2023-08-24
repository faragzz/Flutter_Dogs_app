import 'package:dogs_app/Api/api_service.dart';
import 'package:dogs_app/components/image_list_tile.dart';
import 'package:dogs_app/model/images_data.dart';
import 'package:dogs_app/model/saved_data_info.dart';
import 'package:dogs_app/screens/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ImagePage extends StatefulWidget {
  final String name;
  const ImagePage({Key? key, required this.name}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  List<String> breedListImage = [];
  late Box<SavedDataInfo> mybox;
  ApiService api = ApiService();

  @override
  void initState() {
    super.initState();
    mybox = Hive.box('mybox');
  }

  void addInDatabase(String name) {
    showSankBar('added $name to favorites');

    List<String> list = [];

    for (int i = 0; i < 5; i++) {
      list.add(breedListImage[i]);
    }
    SavedDataInfo x = SavedDataInfo(name: name, list: list);
    mybox.put(x.name, x);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FavoritePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: Text(' ${widget.name} image list')),
            IconButton(
                onPressed: () => addInDatabase(widget.name),
                icon: const Icon(Icons.add_circle_outline_outlined))
          ],
        ),
      ),
      body: FutureBuilder<ImagesModel>(
        future: api.getBreedImage(widget.name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Show a loading indicator
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            breedListImage = snapshot.data!.message ?? [];
            return ListView.builder(
              itemCount: breedListImage.length,
              itemBuilder: (context, index) {
                return ImageListTile(
                  index: index,
                  breedListImage: breedListImage,
                );
              },
            );
          }
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
