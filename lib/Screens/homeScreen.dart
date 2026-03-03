import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todos/Utils/apiService.dart';
import 'package:todos/model/posts.dart';
import 'package:todos/widgets/cardWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Posts> posts = [];
  @override
  void initState() {
   
    super.initState();
    getData();
  }

  Future<void> getData() async {
    posts = await ApiService.getData();
    setState(() {});
  }

  void deletePost(int id) {
    posts.removeWhere((i) => i.id == id);
    setState(() {});
  }

  Map<String,dynamic> addPost(Posts post){
    return {};
  }


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('ToDoZen')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final item = posts[index];
          log(posts.length);
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Column(
                children: [CardWidget(item: item, deletePost: deletePost)],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: Icon(Icons.add, size: 35),
      ),
    );
  }

  void showAddDialog() {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _bodyController = TextEditingController();
    TextEditingController _userIdController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // backgroundColor: Colors.purple.shade100,
          title: Text('Add New Todo'),
          content: SizedBox(
            height: 300,
            child: Column(
              children: [
                TextField(
                  controller: _userIdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'UserId',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                ),
                Spacer(),
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Title',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                ),
                Spacer(),
                TextField(
                  controller: _bodyController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Body',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                final item = Posts(
                  userId: int.tryParse(_userIdController.text) ?? 0,
                  title: _titleController.text,
                  body: _bodyController.text,
                );
                await ApiService.addPost(item);
                await getData();
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
