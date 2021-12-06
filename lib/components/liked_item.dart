import 'package:flutter/material.dart';

class Liked extends StatelessWidget {
  final Function onClick;
  final bool isSelected;

  Liked({required this.onClick, required this.isSelected});

  Color updateColor() {
    if (isSelected) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick.call();
      },
      child: Container(
        child: Icon(
          Icons.favorite,
          size: 40.0,
          color: updateColor(),
        ),
      ),
    );
  }
}
