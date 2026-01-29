import 'package:flutter/material.dart';

class DragPlace extends StatefulWidget {
  final int order;
  final Function(int, DragTargetDetails<Object>) onDragged;

  const DragPlace({super.key, required this.order, required this.onDragged});

  @override
  State<DragPlace> createState() => _DragPlaceState();
}

class _DragPlaceState extends State<DragPlace> {
  bool _abovePlace = false;

  @override
  void didUpdateWidget(covariant DragPlace oldWidget) {
    super.didUpdateWidget(oldWidget);

    _abovePlace = false;
  }

  void _onDragged(order, details) {
    widget.onDragged.call(order, details);
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, candidateData, rejectedData) => ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: 200,
            minHeight: 10,
            maxWidth: double.infinity,
            maxHeight: 40),
        child: Container(
          width: double.infinity,
          height: _abovePlace ? 36 : 1,
          margin: const EdgeInsets.only(left: 30, right: 30, top: 4, bottom: 4),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                style: BorderStyle.solid,
                color: _abovePlace ? Colors.blue : Colors.white,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: const Text(""),
        ),
      ),
      onMove: (details) {
        setState(() {
          _abovePlace = true;
        });
      },
      onLeave: (data) {
        setState(() {
          _abovePlace = false;
        });
      },
      onAcceptWithDetails: (details) => _onDragged(widget.order, details),
    );
  }
}
