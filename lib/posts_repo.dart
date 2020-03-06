import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class PostsRepo {
  Future loadPosts() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      var response = await http.get(url, headers: headers);

      return json.decode(response.body);
    } catch (error) {
      print(error);
    }
  }
}
