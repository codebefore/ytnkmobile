import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/models/common/item.dart';

class ChipSelectionSheet extends StatefulWidget {
  final Future<List<Item>> Function(String) fetchChips;
  final int maxSelectionCount;

  const ChipSelectionSheet(
      {super.key, required this.fetchChips, required this.maxSelectionCount});

  @override
  ChipSelectionSheetState createState() => ChipSelectionSheetState();
}

class ChipSelectionSheetState extends State<ChipSelectionSheet> {
  final TextEditingController _searchController = TextEditingController();
  List<Item> _chips = [];
  List<Item> selectedChips = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _fetchChips('');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (mounted) _fetchChips(_searchController.text);
  }

  Future<void> _fetchChips(String filter) async {
    if (_isLoading) return; // Prevent multiple fetches

    setState(() {
      _isLoading = true;
    });
    final chips = await widget.fetchChips(filter);
    setState(() {
      _chips = chips;
      _isLoading = false;
    });
  }

  void _onChipSelected(Item chip) {
    if (mounted) {
      setState(() {
        if (selectedChips.contains(chip)) {
          selectedChips.remove(chip);
        } else if (selectedChips.length < widget.maxSelectionCount) {
          selectedChips.add(chip);
        }
      });
    }
  }

  void _onSelectButtonPressed() {
    _searchController.removeListener(_onSearchChanged);

    Navigator.pop(context, selectedChips);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(GlobalIcons.GENERAL_searchIcon),
            ),
          ),
          const SizedBox(height: 16.0),
          _isLoading
              ? const CircularProgressIndicator()
              : Wrap(
                  spacing: 8.0,
                  children: _chips.map((chip) {
                    final isSelected = selectedChips.contains(chip);
                    return ChoiceChip(
                      label: Text(chip.text),
                      selected: isSelected,
                      onSelected: (_) => _onChipSelected(chip),
                    );
                  }).toList(),
                ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: selectedChips.isNotEmpty ? _onSelectButtonPressed : null,
            child: Text(
                'Select (${selectedChips.length}/${widget.maxSelectionCount}) items'),
          ),
        ],
      ),
    );
  }
}
