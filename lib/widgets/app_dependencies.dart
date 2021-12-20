import 'package:flutter/cupertino.dart';
import 'package:harry_challenge/Managers/network_manager.dart';
import 'package:harry_challenge/database/character_dao.dart';

class AppDependencies extends InheritedWidget {
  final CharacterDao characterDao;
  final NetworkManager networkManager;

  AppDependencies({
    required this.characterDao,
    required this.networkManager,
    required Widget child,
}) : super(child: child);

  static AppDependencies? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDependencies>();

  @override
  bool updateShouldNotify(AppDependencies oldWidget) {
    return characterDao != oldWidget.characterDao ||
    networkManager != oldWidget.networkManager;
  }

}