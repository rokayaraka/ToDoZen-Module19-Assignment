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
    // TODO: implement initState
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Posts')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final item = posts[index];
          log(posts.length);
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
    TextEditingController _userIdController = TextEditingController();
    // TextEditingController _idController = TextEditingController();
    TextEditingController _titleController = TextEditingController();
    TextEditingController _bodyController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Product'),
          content: Column(
            children: [
              TextField(
                controller: _userIdController,
                decoration: InputDecoration(hintText: 'UserId'),
              ),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: _bodyController,
                decoration: InputDecoration(hintText: 'Body'),
              ),
            ],
          ),
          actions: [ElevatedButton(onPressed: () {}, child: Text('save'))],
        );
      },
    );
  }
}
