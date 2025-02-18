import 'package:flutter/material.dart';
import 'package:outfit4ride/closet_manager.dart';
import 'package:outfit4ride/outfit_card_big.dart';
import 'package:outfit4ride/outfit_screen.dart';
import 'package:provider/provider.dart';

class ClosetScreen extends StatefulWidget {
  const ClosetScreen({
    super.key,
  });

  @override
  State<ClosetScreen> createState() => _ClosetScreenState();
}

class _ClosetScreenState extends State<ClosetScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ClosetManager>(
      builder: (context, manager, child) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            ListView.separated(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final item = manager.allOutfits[index];
                return Dismissible(
                  confirmDismiss: (DismissDirection dismissDirection) async {
                    return await _showDismissDialog(context);
                  },
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
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OutfitScreen(
                            originalItem: item,
                            onUpdate: (item) {
                              manager.updateItem(item, index);
                              Navigator.pop(context);
                            },
                            onCreate: (item) {},
                          ),
                        ),
                      );
                    },
                    child: OutfitCardBig(
                        outfit: manager.allOutfits[index]
                    )
                  )
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8,);
              },
              itemCount: manager.allOutfits.length,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 20),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OutfitScreen(
                        onCreate: (outfit){
                          manager.addItem(outfit);
                          Navigator.pop(context);
                        },
                        onUpdate: (item){}
                      ),
                    )
                  );
                },
                child: const Icon(Icons.add),
              ),
            )
          ]
        );
      }
    );
  }

  Future<bool?> _showDismissDialog(BuildContext context) {
    return showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete"),
          content: const Text(
            "Are you sure to delete this outfit?"
          ),
          actions: <Widget> [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text("Yes")
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("No")
            ),
          ]
        );
      }
    );
  }

}