import 'package:flt_fooderlich/components/grocery_tile.dart';
import 'package:flt_fooderlich/models/models.dart';
import 'package:flt_fooderlich/screens/grocery_item_screen.dart';
import 'package:flutter/material.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: groceryItems.length,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
        itemBuilder: (context, index) {
          final item = groceryItems[index];

          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            onDismissed: (direction) {
              manager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item.name} dismissed'),
                ),
              );
            },
            child: InkWell(
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change) {
                  if (change != null) {
                    manager.completeItem(index, change);
                  }
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroceryItemScreen(
                            originalItem: item,
                            onUpdate: (item) {
                              manager.updateItem(item, index);
                              Navigator.pop(context);
                            },
                            onCreate: (item) {},
                          )),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
