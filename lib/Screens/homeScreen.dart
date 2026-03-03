

import 'dart:developer';

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
  void updatePost(Posts item){
    log('1');
  final index=  posts.indexWhere((element) => element.id==item.id,);
  log(index.toString());
  posts[index]= item;
  setState(() {
    
  });
  }
  


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('ToDoZen')),
      body: SafeArea(
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final item = posts[index];
            log(posts.length.toString());
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                child: Column(
                  children: [CardWidget(item: item, deletePost: deletePost, updatePost: updatePost)],
                ),
              ),
            );
          },
        ),
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
     TextEditingController _idController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // backgroundColor: Colors.purple.shade100,
          title: Text('Add New Todo'),
          content: SizedBox(
            height: 500,
            child: Column(
              children: [
                 TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'ID',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                ),
                Spacer(),
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
              onPressed: ()  {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: ()async {
                final item = Posts(
                  id: int.tryParse(_idController.text),
                  userId: int.tryParse(_userIdController.text) ?? 0,
                  title: _titleController.text,
                  body: _bodyController.text,
                );
                await ApiService.addPost(item);
                posts.add(item);
                setState(() {
                  
                });
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
