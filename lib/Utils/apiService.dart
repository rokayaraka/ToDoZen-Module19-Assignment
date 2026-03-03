import 'dart:convert';
import 'dart:developer';

import 'package:todos/Utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:todos/model/posts.dart';

class ApiService {
  static Future<dynamic> getData() async {
    final url = Urls.postsUrl;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-type': 'application/json',
          'User-Agent': 'FlutterApp',
        },
      );
      log(response.statusCode.toString());
      //log(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log(data.runtimeType.toString());

        return Posts.listOfPosts(data);
      }
    } catch (e) {}
  }

  static Future<bool> deletePost(int id) async {
    final url = '${Urls.postsUrl}/$id';
    try {
      final response = await http.delete(Uri.parse(url));
      if(response.statusCode==200){
        return true;
      }
      else{
        return false;
      }
    } catch (e) {
    return false;
    }
  }

    static Future<void> addPost(Posts item)async{
    final url = Urls.postsUrl;
    log(url);
    try{
      final response = await http.post(Uri.parse(url),
      body: json.encode(item.toMap()),
      headers: {
        'Content-Type':'application/json',
      }
      );
      log(response.statusCode.toString());
    }catch(e){}
  }

}
