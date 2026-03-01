import 'package:flutter/material.dart';
import 'package:todos/model/posts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Posts> posts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homscreen')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          //final item = Posts[index];
          return Container(
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('UserId',style: TextTheme.of(context).bodyMedium,),

                        Text('id',style: TextTheme.of(context).bodyMedium,),
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        Text('Title',style: TextTheme.of(context).bodyLarge,),
                        Text('Body')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 35),
      ),
    );
  }
}
