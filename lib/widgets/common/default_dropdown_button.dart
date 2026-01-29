import 'package:flutter/material.dart';

class DefaultDropdownButton<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final T? firstItem;
  final String? hint;
  final Icon? icon;
  final InputDecoration? decoration; // optional decoration

  const DefaultDropdownButton({
    super.key,
    required this.items,
    this.value,
    this.hint,
    this.icon,
    this.onChanged,
    this.firstItem,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    List<T> listItems = items.contains(value) ? items : [value as T, ...items];

    final inputDecoration = decoration ??
        InputDecoration(
          helperText: hint,
          icon: icon,
          iconColor: Colors.indigo,
        );

    return InputDecorator(
      decoration: inputDecoration,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          onChanged: onChanged,
          isExpanded: true,
          isDense: true,
          items: listItems.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                item.toString(),
                style: const TextStyle(color: Colors.indigo),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
