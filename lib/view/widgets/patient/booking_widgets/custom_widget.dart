import 'package:flutter/material.dart';



class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final void Function(T?) onChanged;
  final String label;
  final Widget Function(T) itemDisplay;
  final String Function(T) displayValue;

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    required this.label,
    required this.itemDisplay,
    required this.displayValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: selectedItem,
      onChanged: onChanged,
      icon: const Icon(Icons.expand_more_rounded, color: Colors.grey),
      dropdownColor: Colors.white,
      isExpanded: true,
      style: const TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
      ),
      selectedItemBuilder: (context) {
        return items.map((item) {
          return Text(displayValue(item), style: const TextStyle(fontSize: 14.5));
        }).toList();
      },
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: itemDisplay(item),
        );
      }).toList(),
    );
  }
}



class CustomDropdownMenuItemCenter extends StatelessWidget {
  const CustomDropdownMenuItemCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
