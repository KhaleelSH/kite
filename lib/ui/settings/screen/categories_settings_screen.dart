import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/model/category.dart';
import 'package:kite/providers/enabled_categories_provider.dart';
import 'package:kite/providers/news_provider.dart';
import 'package:kite/ui/settings/widget/reorderable_category_list_tile.dart';

class CategoriesSettingsScreen extends ConsumerStatefulWidget {
  const CategoriesSettingsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const CategoriesSettingsScreen());
  }

  @override
  ConsumerState<CategoriesSettingsScreen> createState() => _CategoriesSettingsScreenState();
}

class _CategoriesSettingsScreenState extends ConsumerState<CategoriesSettingsScreen> {
  late final List<Category> _enabledCategories = ref.read(enabledCategoriesProvider);
  late final List<Category> _disabledCategories = ref
      .read(categoriesProvider)
      .requireValue
      .values
      .where((category) => !_enabledCategories.contains(category))
      .toList();

  void _toggleCategory(String categoryName, bool value) {
    if (_enabledCategories.length == 1 && value == false) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('You cannot disable the last enabled category.')));
      return;
    }
    setState(() {
      Category? targetCategory = _enabledCategories.firstWhere(
        (c) => c.name == categoryName,
        orElse: () => _disabledCategories.firstWhere((c) => c.name == categoryName),
      );

      if (value) {
        _disabledCategories.remove(targetCategory);
        _enabledCategories.add(targetCategory);
      } else {
        _enabledCategories.remove(targetCategory);
        _disabledCategories.insert(0, targetCategory);
      }
      HapticFeedback.lightImpact();
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (_enabledCategories.length == 1 && newIndex > oldIndex) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('You cannot disable the last enabled category.')));
      return;
    }
    setState(() {
      final items = [
        ..._enabledCategories,
        if (_disabledCategories.isNotEmpty) ...[
          'divider', // Add divider as a special item
          ..._disabledCategories,
        ],
      ];

      if (items[oldIndex] == 'divider') return;

      final item = items.removeAt(oldIndex);

      if (newIndex > oldIndex) {
        newIndex--;
      }

      items.insert(newIndex, item);
      final newDividerIndex = items.indexWhere((item) => item == 'divider');

      _enabledCategories.clear();
      _disabledCategories.clear();

      // Process all categories based on their position relative to divider
      for (int i = 0; i < items.length; i++) {
        if (items[i] != 'divider') {
          final category = items[i] as Category;
          if (newDividerIndex == -1 || i < newDividerIndex) {
            // Above divider or no divider = enabled
            _enabledCategories.add(category);
          } else {
            // Below divider = disabled
            _disabledCategories.add(category);
          }
        }
      }
      HapticFeedback.lightImpact();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, _) {
        ref.read(enabledCategoriesProvider.notifier).updateCategories(_enabledCategories);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Categories')),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                spacing: 8,
                children: [
                  Icon(Icons.info_outline),
                  Expanded(
                    child: Text(
                      'Drag to reorder categories. Enabled categories stay at the top.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReorderableListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount:
                    _enabledCategories.length + (_disabledCategories.isNotEmpty ? _disabledCategories.length + 1 : 0),
                onReorder: _onReorder,
                buildDefaultDragHandles: false,
                proxyDecorator: (child, index, animation) {
                  return AnimatedBuilder(
                    animation: animation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: 1.05,
                        child: Material(elevation: 4, borderRadius: BorderRadius.circular(8), child: child),
                      );
                    },
                    child: child,
                  );
                },
                itemBuilder: (context, index) {
                  final item = index < _enabledCategories.length
                      ? _enabledCategories[index]
                      : index == _enabledCategories.length && _disabledCategories.isNotEmpty
                      ? 'divider'
                      : _disabledCategories[index - _enabledCategories.length - 1];

                  if (item == 'divider') {
                    return Container(
                      key: const ValueKey('divider'),
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          Container(height: 1, width: 40, color: Theme.of(context).colorScheme.outline),
                          const SizedBox(width: 8),
                          Text(
                            'Disabled Categories',
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(child: Container(height: 1, color: Theme.of(context).colorScheme.outline)),
                        ],
                      ),
                    );
                  }

                  final isEnabled = _enabledCategories.contains(item);
                  final category = item as Category;
                  return Container(
                    key: ValueKey(category.name),
                    child: ReorderableCategoryListTile(
                      category: category,
                      index: index,
                      isEnabled: isEnabled,
                      onToggleCategory: _toggleCategory,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
