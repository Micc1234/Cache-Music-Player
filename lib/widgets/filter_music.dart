import 'package:cache_music_player/models/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterMusic extends StatefulWidget {
  const FilterMusic({super.key});

  @override
  State<FilterMusic> createState() => _FilterMusicState();
}

class _FilterMusicState extends State<FilterMusic>
    with AutomaticKeepAliveClientMixin {
  List<String> _filterValues = ['All', 'Indonesian', 'English'];
  String _selectedFilter = 'All';

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _selectedFilter = PageStorage.of(context)
            .readState(context, identifier: 'selectedFilter') as String? ??
        'All';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _filterValues.map((value) {
          return FilterChip(
            label: Text(value),
            selected: _selectedFilter == value,
            shape: StadiumBorder(),
            onSelected: (selected) {
              setState(() {
                _selectedFilter = selected ? value : 'All';
                PageStorage.of(context).writeState(context, _selectedFilter,
                    identifier: 'selectedFilter');
                context.read<DataProvider>().filterMusic(_selectedFilter);
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
