import 'package:cache_music_player/models/hits_class_model.dart';
import 'package:flutter/material.dart';

class HitsCard extends StatelessWidget {
  HitsCard({super.key, required this.hits});
  Hits hits;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 0.05),
        ),
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
