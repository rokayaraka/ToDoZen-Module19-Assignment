import 'dart:developer';

import 'package:todos/Utils/urls.dart';
import 'package:http/http.dart'as http;

class ApiService {
  static Future<dynamic> getData()async{
    final url = Urls.postsUrl;
    try{

      final response = await http.get(Uri.parse(url));
      log(response.statusCode.toString());

    }catch(e){}
  }
}