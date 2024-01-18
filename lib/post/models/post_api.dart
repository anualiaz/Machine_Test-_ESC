import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:machine_test_esc/post/models/post.dart';

//https://api.slingacademy.com/v1/sample-data/users?offset=1&limit=10
// https://jsonplaceholder.typicode.com/posts

class PostApi {
  static String domain = "https://jsonplaceholder.typicode.com";
  static String path = "/posts";

  static Future<List<Post>> fetchPost(int start, int limit) async {
    final response = await http.get(
      Uri.https(
        domain,
        path,
        {"_start": "$start", "_limit": "$limit"},
      ),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to fetch post");
    }

    final json = jsonDecode(response.body) as List; print(json);
    return json.map<Post>((post) => Post.fromJson(post)).toList();
  }
}