import 'package:flutter/material.dart';
import 'package:todos/Utils/apiService.dart';
import 'package:todos/model/posts.dart';

class PopUpMenu extends StatefulWidget {
  final Posts item;
  final Function(int) deletePost;
  const PopUpMenu({super.key, required this.item, required this.deletePost});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'edit') {
          //editItem();
        } else if (value == 'delete') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Delete"),
              content: Text("Are you sure you want to delete?"),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () async {
                    final isDeleted = await ApiService.deletePost(widget.item.id!);
                    if (isDeleted) {
                      widget.deletePost(widget.item.id!);
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Post Deleted.')));
                    }
                    Navigator.pop(context);
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
          );
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(value: 'edit', child: Text("Edit")),
        PopupMenuItem(value: 'delete', child: Text("Delete")),
      ],
    );
  }
}
