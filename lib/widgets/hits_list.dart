import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cache_music_player/models/data_provider.dart';
import 'package:cache_music_player/widgets/hits_card.dart';

class HitsList extends StatelessWidget {
  const HitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
        builder: ((context, value, child) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: value.getHitsList().map((hits) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HitsCard(
                    hits: hits,
                  ),
                );
              }).toList()),
            )));
  }
}
