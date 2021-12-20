import 'package:flutter/material.dart';
import 'package:harry_challenge/components/character_item.dart';
import 'package:harry_challenge/models/character.dart';

bool characterItemMatcher(Widget widget, String name) {
  if (widget is CharacterItem) {
    return widget.character.name == name;
  }
  return false;
}