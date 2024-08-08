import 'package:flutter/material.dart';
import '../models/blog_model.dart';
import '../screens/blog_detail_screen.dart';

class BlogItem extends StatefulWidget {
  final Blog blog;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onTap;

  const BlogItem({
    super.key,
    required this.blog,
    required this.onFavoriteToggle,
    required this.onTap,
  });

  @override
  _BlogItemState createState() => _BlogItemState();
}

class _BlogItemState extends State<BlogItem> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.blog.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onFavoriteToggle();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor, // Use the theme's card color
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Adjusted to match the design
      ),
      child: InkWell(
        onTap: () {
          widget.onTap();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlogDetailScreen(blog: widget.blog),
            ),
          );
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                    child: Image.network(
                      widget.blog.imageUrl ?? 'https://via.placeholder.com/150',
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          'https://via.placeholder.com/150',
                          width: double.infinity,
                          height: 200.0,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.blog.title,
                    style: Theme.of(context).textTheme.titleLarge, // Use the theme's headline6 style
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.bookmark : Icons.bookmark_border,
                  color: Theme.of(context).colorScheme.secondary, // Use the theme's accent color
                ),
                onPressed: _toggleFavorite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
