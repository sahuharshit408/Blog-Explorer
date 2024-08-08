import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:hive/hive.dart';
import '../models/blog_model.dart';

class BlogRepository {
  final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  Future<List<Blog>> fetchBlogs() async {
    final response = await http.get(Uri.parse(url), headers: {
      'x-hasura-admin-secret': adminSecret,
    });

    print('API Response: ${response.body}'); // Debugging

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['blogs'];
      return data.map((blog) => Blog.fromJson(blog)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }

  Future<void> toggleFavorite(Blog blog) async {
    final box = await Hive.openBox<Blog>('favoriteBlogs');
    if (blog.isFavorite) {
      await box.put(blog.id, blog);
      print('Saved blog to favorites: ${blog.title}');
    } else {
      await box.delete(blog.id);
      print('Removed blog from favorites: ${blog.title}');
    }
  }

  Future<List<Blog>> getFavoriteBlogs() async {
    final box = await Hive.openBox<Blog>('favoriteBlogs');
    final favoriteBlogs = box.values.toList();
    print('Retrieved favorite blogs: ${favoriteBlogs.length}');
    return favoriteBlogs;
  }
}
