import 'package:flutter/material.dart';
import 'package:todos/Utils/apiService.dart';
import 'package:todos/model/posts.dart';

class CardWidget extends StatelessWidget {
  final Posts item;
  final Function(int) deletePost;
  const CardWidget({super.key, required this.item, required this.deletePost});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 150,
            width: 50,
            decoration: BoxDecoration(color: Colors.green.shade200),
            child: Center(
              child: Text(
                item.id.toString(),
                style: TextTheme.of(context).bodyLarge,
              ),
            ),
          ),
          Expanded(
            child:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                item.title,
                style: TextTheme.of(context).bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 20,),
              //  Text(
              //   item.body,
              //   style: TextTheme.of(context).bodySmall,
              //   overflow: TextOverflow.ellipsis,
              //   maxLines: 2,
              // ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}


//  ListTile(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               item.userId.toString(),
//               style: TextTheme.of(context).bodyMedium,
//             ),

//             Text(item.id.toString(), style: TextTheme.of(context).bodyMedium),
//           ],
//         ),
//         subtitle: Column(
//           children: [
//             Text(item.title, style: TextTheme.of(context).bodyLarge),
//             Text(item.body),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 IconButton(
//                   onPressed: () async {
//                     final isDeleted = await ApiService.deletePost(item.id!);
//                     if (isDeleted) {
//                       deletePost(item.id!);
//                       ScaffoldMessenger.of(
//                         context,
//                       ).showSnackBar(SnackBar(content: Text('Post Deleted.')));
//                     }

//                   },
//                   icon: Icon(Icons.delete, color: Colors.red),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.edit, color: Colors.white),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),