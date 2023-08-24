import 'package:dogs_app/Api/api_service.dart';
import 'package:dogs_app/components/home_list_tile.dart';
import 'package:dogs_app/model/dog_data.dart';
import 'package:dogs_app/screens/favorites_page.dart';
import 'package:dogs_app/screens/images_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService api = ApiService();
  void onClickImage(String breedName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagePage(name: breedName),
        ));
  }

  void toFav() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavoritePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Dogs List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(onPressed: toFav, icon: const Icon(Icons.favorite))
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<DogData>(
                  // future: fetchDogData(),
                  future: api.fetchDogData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final dogData = snapshot.data!;
                      return ListView.builder(
                        itemCount: dogData.message.keys.length,
                        itemBuilder: (context, index) {
                          final breed = dogData.message.keys.elementAt(index);
                          final subBreeds = dogData.message[breed] ?? [];

                          return AllBreedsListTile(
                            breed: breed,
                            subBreeds: subBreeds,
                            onPressed: () => onClickImage(breed),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget allBreedsListTile(String breed, List<String> subBreeds) {
  //   return Container(
  //     margin: const EdgeInsets.all(8),
  //     decoration: BoxDecoration(
  //       color: Colors.purple[50],
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: ListTile(
  //       title: Text(breed),
  //       subtitle: subBreeds.isNotEmpty
  //           ? Text(subBreeds.join(', '))
  //           : const Text('No sub-breeds'),
  //       trailing: IconButton(
  //         onPressed: () => onClickImage(breed),
  //         icon: const Icon(Icons.image),
  //       ),
  //     ),
  //   );
  // }
}
