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
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('All Posts')),
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
        onPressed: (){},
        child: Icon(Icons.add, size: 35),
      ),
    );
  }
}