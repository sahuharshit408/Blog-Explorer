import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/blog_model.dart';

class ApiService {
  final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(Uri.parse(url), headers: {
      'x-hasura-admin-secret': adminSecret,
    });

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['blogs'];
      return data.map((blog) => Blog.fromJson(blog)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }
}
