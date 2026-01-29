import 'package:flutter/material.dart';
import 'package:ytnkio/models/survey/choice.dart';
import 'package:ytnkio/widgets/survey/drag_place.dart';
import 'package:ytnkio/widgets/survey/draggable_choice_viewer.dart';

class DragSelector extends StatefulWidget {
  final List<Choice> choices;
  final Function(int, double) onChanged;

  const DragSelector(
      {required this.choices, required this.onChanged, super.key});

  @override
  State<DragSelector> createState() => _DragSelectorState();
}

class _DragSelectorState extends State<DragSelector> {
  final List<Choice> _selectedChoices = List.empty(growable: true);
  List<Choice> _notSelectedChoices = List.empty(growable: true);
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {});

    _notSelectedChoices = [...widget.choices];
  }

  _onDragged(int order, DragTargetDetails<Object> details) {
    var draggedChoice = _notSelectedChoices.firstWhere(
      (element) => element.order == details.data,
      orElse: () => _selectedChoices
          .firstWhere((element) => element.order == details.data),
    );

    setState(() {
      draggedChoice.selectionOrder = order;
    });

    if (_notSelectedChoices.any((element) => element.order == details.data)) {
      setState(() {
        _selectedChoices.add(draggedChoice);
        _notSelectedChoices.remove(draggedChoice);
      });
    }

    setState(() {
      _selectedChoices.sort(
          (a, b) => (a.selectionOrder ?? 0).compareTo(b.selectionOrder ?? 0));

      for (var i = 0; i < _selectedChoices.length; i++) {
        _selectedChoices[i].selectionOrder = i + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        controller: _scrollController,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
                minWidth: 200,
                minHeight: 150,
                maxWidth: double.infinity,
                maxHeight: double.infinity),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DragPlace(order: 0, onDragged: _onDragged),
                  for (var i = 0; i < _selectedChoices.length; i++) ...[
                    DraggableChoiceViewer(
                        choice: _selectedChoices[i],
                        showOrder: true,
                        color: Colors.black,
                        scrollController: _scrollController),
                    DragPlace(order: i + 1, onDragged: _onDragged),
                  ]
                ],
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 200,
              minHeight: 150,
              maxWidth: double.infinity,
              maxHeight: double.infinity,
            ),
            child: DragTarget<int>(
              builder: (context, candidateData, rejectedData) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _notSelectedChoices
                      .map((e) => DraggableChoiceViewer(
                          choice: e,
                          showOrder: false,
                          color: Colors.black,
                          scrollController: _scrollController))
                      .toList(),
                ),
              ),
              onWillAcceptWithDetails: (data) {
                return _selectedChoices
                    .any((element) => element.order == data.data);
              },
              onAcceptWithDetails: (data) {
                var draggedChoice = _selectedChoices
                    .firstWhere((element) => element.order == data.data);

                setState(() {
                  _notSelectedChoices.add(draggedChoice);
                  _selectedChoices.remove(draggedChoice);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
