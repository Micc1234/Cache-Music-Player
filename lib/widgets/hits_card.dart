import 'package:cache_music_player/models/hits_class_model.dart';
import 'package:flutter/material.dart';

class HitsCard extends StatelessWidget {
  HitsCard({super.key, required this.hits});
  Hits hits;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        color: Colors.white,
        height: 200,
        child: Column(
          children: [
            Image.network(hits.imgSrc,
                width: 200, height: 150, fit: BoxFit.cover),
            Text(
              hits.name,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
