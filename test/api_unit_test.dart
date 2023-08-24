// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dogs_app/Api/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dogs_app/main.dart';

void main() {
  group('Api testing ', () {
    final apiService = ApiService();
    test('Testing APIs', () async {
      var fetch = (await apiService.getBreedImage('african'));
      expect(fetch.status, 'success');
    });

    test('Testing APIs', () async {
      var fetch = (await apiService.fetchDogData());
      expect(fetch.status, 'success');
    });
  });
}
