import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_challenge/screens/home_screen.dart';

main() {
  testWidgets('Should display the main image when the app start', (tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });
  testWidgets('Should display the favorite button', (tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));
    final fabFavoriteItem = find.widgetWithIcon(FloatingActionButton, Icons.favorite);
    expect(fabFavoriteItem, findsOneWidget);
  });
}