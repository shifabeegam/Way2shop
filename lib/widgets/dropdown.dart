// import 'package:flutter/material.dart';
//
// class MyDropdownWidget extends StatelessWidget {
//   final List<String> items;
//   final String selectedItem;
//   final ValueChanged<String> onChanged;
//
//   MyDropdownWidget({
//     required this.items,
//     required this.selectedItem,
//     required this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: selectedItem,
//       onChanged: onChanged,
//       items: items.map((String item) {
//         return DropdownMenuItem<String>(
//           value: item,
//           child: Text(item),
//         );
//       }).toList(),
//     );
//   }
// }
