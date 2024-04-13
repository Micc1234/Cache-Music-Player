import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  TitleText({super.key, required this.titleText});
  String titleText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        children: [
          Text(
            titleText,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
