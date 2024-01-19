import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:machine_test_esc/post/models/post.dart';

//https://api.slingacademy.com/v1/sample-data/users?offset=1&limit=10
// https://jsonplaceholder.typicode.com/posts

class PostApi {
  static String domain = "api.slingacademy.com/v1/sample-data";
  static String path = "/users";

  static Future<List<Post>> fetchPost(int start, int limit) async {
    print("fetchPost started!!!");
    final response = await http.get(Uri.parse('https://api.slingacademy.com/v1/sample-data/users?offset=$start&limit=$limit'),);
    print(response.statusCode);
    print(jsonDecode(response.body)['users']);
    if (response.statusCode != 200) {
      throw Exception("Failed to fetch post");
    }

    final json = jsonDecode(response.body)['users'] as List; print(json);
    return json.map<Post>((post) => Post.fromJson(post)).toList();
  }
}