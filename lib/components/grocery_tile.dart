import 'package:flt_fooderlich/models/models.dart';
import 'package:flutter/material.dart';

class GroceryTitle extends StatelessWidget {
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  GroceryTitle({
    super.key,
    required this.item,
    this.onComplete,
  }) : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    // TODO: Change this Widget
    return Container(
      height: 100.0,
      // TODO: Replace this color
      color: Colors.red,
    );
  }

// TODO: Add BuildImportance()

// TODO: Add buildDate()
// TODO: Add buildCheckbox()
}
