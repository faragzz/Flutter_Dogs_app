import 'package:dogs_app/components/home_list_tile.dart';
import 'package:dogs_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('testing home page', () {
    testWidgets('favorite icon visible', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      await tester.pumpAndSettle();

      var title = find.text('Dogs List');
      expect(title, findsOneWidget);

      var favIcons = find.byIcon(Icons.favorite);
      expect(favIcons, findsOneWidget);
    });

    testWidgets('Icon in list View Tile in home page', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AllBreedsListTile(
              key: UniqueKey(), // Add a unique key here
              breed: 'breed',
              subBreeds: const ['1', '2', '3', '4'],
              onPressed: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final iconFinder = find.byIcon(Icons.image);
      expect(iconFinder, findsOneWidget);
    });
  });
}
