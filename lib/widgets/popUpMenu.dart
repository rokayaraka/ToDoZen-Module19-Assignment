import 'package:flutter/material.dart';
import 'package:todos/Utils/apiService.dart';
import 'package:todos/model/posts.dart';

class PopUpMenu extends StatefulWidget {
  final Posts item;
  final Function(int) deletePost;

  final Function(Posts) updatePost;
  const PopUpMenu({
    super.key,
    required this.item,
    required this.deletePost,
    required this.updatePost,
  });

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
          editPost();
        } else if (value == 'delete') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Delete"),
              content: Text("Are you sure you want to delete?"),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () async {
                    final isDeleted = await ApiService.deletePost(
                      widget.item.id!,
                    );
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

  void editPost() {
    TextEditingController _titleEditController = TextEditingController(
      text: widget.item.title,
    );
    TextEditingController _bodyEditController = TextEditingController(
      text: widget.item.body,
    );

    showDialog(
      context: context,
      builder: (context) {
        return  SizedBox(
          height: 700,
          child: AlertDialog(
              contentTextStyle: TextStyle(fontSize: 20),
              title: Text('Edit Post'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    style: TextStyle(fontSize: 20),
                    controller: _titleEditController,
          
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    style: TextStyle(fontSize: 20),
                    controller: _bodyEditController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final post = Posts(
                      title: _titleEditController.text,
                      body: _bodyEditController.text,
                      id: widget.item.id,
                      userId: widget.item.userId,
                    );
                    await ApiService.updatePost(post);
                    widget.updatePost(post);
                    Navigator.pop(context);
                  },
                  child: Text('Update'),
                ),
              ],
            
          ),
        );
      },
    );
  }
}
