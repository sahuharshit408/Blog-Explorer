import 'package:flutter/material.dart';
import '../models/blog_model.dart';
import '../repositories/blog_repository.dart';
import '../widgets/favorite_blog_item.dart';

class FavoriteBlogsScreen extends StatefulWidget {
  const FavoriteBlogsScreen({super.key});

  @override
  _FavoriteBlogsScreenState createState() => _FavoriteBlogsScreenState();
}

class _FavoriteBlogsScreenState extends State<FavoriteBlogsScreen> {
  List<Blog> _favoriteBlogs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavoriteBlogs();
  }

  Future<void> _loadFavoriteBlogs() async {
    final blogRepo = BlogRepository();
    try {
      final favoriteBlogs = await blogRepo.getFavoriteBlogs();
      setState(() {
        _favoriteBlogs = favoriteBlogs;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading favorite blogs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Blogs'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _favoriteBlogs.isEmpty
          ? const Center(child: Text('No favorite blogs found.'))
          : ListView.builder(
        itemCount: _favoriteBlogs.length,
        itemBuilder: (context, index) {
          final blog = _favoriteBlogs[index];
          return FavoriteBlogItem(
            blog: blog,
            onTap: () {
              // Navigate to blog detail screen
            },
          );
        },
      ),
    );
  }
}
