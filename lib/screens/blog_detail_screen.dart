import 'package:flutter/material.dart';
import '../models/blog_model.dart';

class BlogDetailScreen extends StatelessWidget {
  final Blog blog;

  const BlogDetailScreen({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    final String title = blog.title;
    final String imageUrl = blog.imageUrl ?? 'https://via.placeholder.com/150';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // Rounded corners for the image
              child: Image.network(
                imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network('https://via.placeholder.com/150');
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall, // Use the theme's headline5 style
            ),
          ],
        ),
      ),
    );
  }
}
