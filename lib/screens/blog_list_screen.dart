import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/blog_model.dart';
import '../providers/theme_provider.dart';
import '../repositories/blog_repository.dart';
import '../widgets/blog_item.dart';
import 'favourite_blogs_screen.dart';

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});

  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  List<Blog> _blogs = [];
  List<Blog> _favoriteBlogs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBlogs();
  }

  Future<void> _loadBlogs() async {
    final blogRepo = BlogRepository();
    try {
      final blogs = await blogRepo.fetchBlogs();
      final favoriteBlogs = await blogRepo.getFavoriteBlogs();
      setState(() {
        _blogs = blogs;
        _favoriteBlogs = favoriteBlogs;
        _isLoading = false;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _toggleFavorite(Blog blog) async {
    final blogRepo = BlogRepository();
    final updatedBlog = blog.copyWith(isFavorite: !blog.isFavorite);

    try {
      await blogRepo.toggleFavorite(updatedBlog);
      setState(() {
        if (updatedBlog.isFavorite) {
          _favoriteBlogs.add(updatedBlog);
        } else {
          _favoriteBlogs.removeWhere((b) => b.id == updatedBlog.id);
        }
        _blogs = _blogs.map((b) => b.id == updatedBlog.id ? updatedBlog : b).toList();
      });
    } catch (e) {
      print('Error toggling favorite: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoriteBlogsScreen(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: const Center(
          child: Text(
            'Blog Explorer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(themeProvider.isDarkMode ? Icons.nights_stay : Icons.light_mode_rounded),
            onPressed: themeProvider.toggleTheme,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _blogs.length,
        itemBuilder: (context, index) {
          final blog = _blogs[index];
          return BlogItem(
            blog: blog,
            onFavoriteToggle: () => _toggleFavorite(blog),
            onTap: () {
              // Navigate to blog detail screen
            },
          );
        },
      ),
    );
  }
}
