import 'package:flutter/material.dart';
import 'package:kite/model/category.dart';

class ReorderableCategoryListTile extends StatelessWidget {
  const ReorderableCategoryListTile({
    super.key,
    required this.category,
    required this.index,
    required this.isEnabled,
    required this.onToggleCategory,
  });

  final Category category;
  final int index;
  final bool isEnabled;
  final Function(String, bool) onToggleCategory;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      title: Text(category.name, style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch.adaptive(
            value: isEnabled,
            onChanged: (value) => onToggleCategory(category.name, value),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(width: 8),
          ReorderableDragStartListener(
            index: index,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.drag_handle, color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}
