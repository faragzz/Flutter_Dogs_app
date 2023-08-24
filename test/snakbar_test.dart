// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dogs_app/main.dart';
import 'package:dogs_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Check if Favorites icon exists', (WidgetTester tester) async {
    await tester
        .pumpWidget(HomePage()); // Replace MyWidget with your widget under test

    // Replace this with the correct icon pack and icon you are looking for
    final icon = find.byIcon(Icons.favorite);

    expect(icon, findsNothing); // Expects to find exactly one matching widget
  });
}
