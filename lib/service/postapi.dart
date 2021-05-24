import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/model/post.dart';

class PostApi {
  Future<List<Post>> fetchData() async {
    var response = await http.get(
        Uri.parse('https://dummyapi.io/data/api/post'),
        headers: {'app-id': '60a373f57c13e7f5a901a999'});
    Map<String, dynamic> parsedJson = jsonDecode(response.body);

    List<Post> posts = List();

    if (parsedJson['data'] != null)
      parsedJson['data'].forEach((element) {
        posts.add(Post.fromJson(element));
      });

    return posts;
  }
}
