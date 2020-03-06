import 'dart:io';

import 'package:http/http.dart' as http;

class PostsRepo {
  loadPosts() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    try {
      final response = await http.get(url, headers: headers);
      return response;
    } catch (error) {
      print(error);
    }
  }
}
