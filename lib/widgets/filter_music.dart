import 'package:cache_music_player/models/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterMusic extends StatefulWidget {
  const FilterMusic({super.key});

  @override
  State<FilterMusic> createState() => _FilterMusicState();
}

class _FilterMusicState extends State<FilterMusic> {
  List<String> _filterValues = ['All', 'Indonesian', 'English'];
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: _filterValues.map((value) {
        return FilterChip(
          label: Text(value),
          selected: _selectedFilter == value,
          onSelected: (selected) {
            setState(() {
              _selectedFilter = selected ? value : 'All';
              context.read<DataProvider>().filterMusic(value);
            });
          },
        );
      }).toList(),
    );
  }
}
