import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harry_challenge/Managers/network_manager.dart';
import 'package:harry_challenge/database/character_dao.dart';
import 'package:harry_challenge/models/character.dart';
import 'package:harry_challenge/screens/home_screen.dart';
import 'package:harry_challenge/widgets/app_dependencies.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_screen_widget_test.mocks.dart';

// import '../mocks/mocks.dart';

@GenerateMocks([CharacterDao, NetworkManager])
main() {
  testWidgets('Should display the main image when the app start',
      (tester) async {
    final mockNetworkManager = MockNetworkManager();

    when(mockNetworkManager.getData()).thenAnswer((_) async => []);

    await tester.pumpWidget(
      AppDependencies(
        characterDao: MockCharacterDao(),
        networkManager: mockNetworkManager,
        child: MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });

  testWidgets('Should display the favorite button', (tester) async {
    final mockNetworkManager = MockNetworkManager();

    when(mockNetworkManager.getData()).thenAnswer((_) async => []);

    await tester.pumpWidget(
      AppDependencies(
        characterDao: CharacterDao(),
        networkManager: mockNetworkManager,
        child: MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );
    final fabFavoriteItem =
        find.widgetWithIcon(FloatingActionButton, Icons.favorite);
    expect(fabFavoriteItem, findsOneWidget);
  });

  testWidgets('Should display the character Personagem Foo', (tester) async {
    final mockNetworkManager = MockNetworkManager();

    when(mockNetworkManager.getData()).thenAnswer(
        (_) async => [Character("Personagem Foo", "Casa 1", "Henry Cavil", true, "01/01/2000", "blue", "")]);

    await tester.pumpWidget(
      AppDependencies(
        characterDao: CharacterDao(),
        networkManager: mockNetworkManager,
        child: MaterialApp(
          home: HomeScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text("Personagem Foo"), findsOneWidget);
  });
}
