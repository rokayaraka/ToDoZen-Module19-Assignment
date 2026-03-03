import 'package:flutter/material.dart';

import 'package:todos/model/posts.dart';
import 'package:todos/widgets/popUpMenu.dart';

class CardWidget extends StatelessWidget {
  final Posts item;
  final Function(int) deletePost;
  const CardWidget({super.key, required this.item, required this.deletePost});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.purple.shade200,
                              shape: BoxShape.circle,
                            ),
      
                            child: Center(
                              child: Text(
                                item.id.toString(),
                                style: TextTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            
                            child: Text(
                              item.title,
                              style: TextTheme.of(context).bodyMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
      
                      Divider(color: Colors.black, thickness: 1),
                  
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple.shade100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.body,
                            style: TextTheme.of(context).bodySmall,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: PopUpMenu(item: item, deletePost: deletePost),
            ),
      
            // Expanded(
            //   flex: 0,
            //   child:
            //    Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       IconButton(
            //         onPressed: () {
      
            //         },
            //         icon: Icon(Icons.more_vert, color: Colors.blue),
            //       ),
            //       IconButton(
            //         onPressed: () async {
            //           final isDeleted = await ApiService.deletePost(item.id!);
            //           if (isDeleted) {
            //             deletePost(item.id!);
            //             ScaffoldMessenger.of(
            //               context,
            //             ).showSnackBar(SnackBar(content: Text('Post Deleted.')));
            //           }
      
            //         },
            //         icon: Icon(Icons.delete, color: Colors.red),
            //       ),
            //       Divider(height: 6,),
            //       IconButton(
            //         onPressed: () {},
            //         icon: Icon(Icons.edit, color: Colors.blue),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        
      ),
    );
  }
}
