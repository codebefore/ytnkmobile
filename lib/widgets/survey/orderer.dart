import 'package:flutter/material.dart';
import 'package:ytnkio/models/survey/choice.dart';
import 'package:ytnkio/widgets/survey/orderer_item.dart';

class Orderer extends StatefulWidget {
  final List<Choice> choices;
  final Function(int, double) onChanged;

  const Orderer({required this.choices, required this.onChanged, super.key});

  @override
  State<Orderer> createState() => _OrdererState();
}

class _OrdererState extends State<Orderer> {
  final List<Choice> _selectedChoices = List.empty(growable: true);
  final List<Choice> _notSelectedChoices = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    _selectedChoices.clear();
    _notSelectedChoices.clear();

    for (var i = 0; i < widget.choices.length; i++) {
      if (widget.choices[i].selectionOrder != null) {
        _selectedChoices.add(widget.choices[i]);
      } else {
        _notSelectedChoices.add(widget.choices[i]);
      }
    }

    _selectedChoices.sort(
        (a, b) => (a.selectionOrder ?? 0).compareTo(b.selectionOrder ?? 0));
  }

  _onClicked(int choiceOrder) {
    if (_notSelectedChoices.any((element) => element.order == choiceOrder)) {
      var choice = _notSelectedChoices
          .firstWhere((element) => element.order == choiceOrder);

      setState(() {
        _selectedChoices.add(choice);
        _notSelectedChoices.remove(choice);
      });
    } else {
      if (_selectedChoices.any((element) => element.order == choiceOrder)) {
        var choice = _selectedChoices
            .firstWhere((element) => element.order == choiceOrder);

        setState(() {
          _notSelectedChoices.add(choice);
          _selectedChoices.remove(choice);
        });
      }
    }

    setState(() {
      for (var i = 0; i < _selectedChoices.length; i++) {
        _selectedChoices[i].selectionOrder = i + 1;

        // var selectedChoices = widget.choices
        //     .where((element) => element.order == _selectedChoices[i].order);

        // if (selectedChoices.isNotEmpty) {
        //   selectedChoices.first.selectionOrder = i + 1;
        // }
      }

      for (var i = 0; i < _notSelectedChoices.length; i++) {
        _notSelectedChoices[i].selectionOrder = null;

        // var notSelectedChoices = widget.choices
        //     .where((element) => element.order == _selectedChoices[i].order);

        // if (notSelectedChoices.isNotEmpty) {
        //   notSelectedChoices.first.selectionOrder = i + 1;
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          for (var i = 0; i < _selectedChoices.length; i++) ...[
            OrdererItem(
              choice: _selectedChoices[i],
              color: _notSelectedChoices.isEmpty ? Colors.green : Colors.blue,
              onClick: _onClicked,
            )
          ],
          for (var i = 0; i < _notSelectedChoices.length; i++) ...[
            OrdererItem(
              choice: _notSelectedChoices[i],
              color: Colors.grey,
              onClick: _onClicked,
            )
          ],
        ],
      ),
    );
  }
}
