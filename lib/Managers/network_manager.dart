import 'package:flutter/material.dart';
import 'package:harry_challenge/components/centered_message.dart';
import 'package:harry_challenge/models/character.dart';
import 'package:harry_challenge/components/components.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkManager {
  Future getData() async {
    http.Response response = await http
        .get(
          Uri.parse(url),
        )
        .timeout(
          Duration(
            seconds: 15,
          ),
        );

    final List<dynamic> decodedJson = jsonDecode(response.body);
    final characterData =
        decodedJson.map((dynamic json) => Character.fromJson(json)).toList();
    return characterData;
  }
}
