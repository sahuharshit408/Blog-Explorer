import 'package:flutter/material.dart';
import '../models/blog_model.dart';
import '../screens/blog_detail_screen.dart';

class FavoriteBlogItem extends StatefulWidget {
  final Blog blog;
  final VoidCallback onTap;

  const FavoriteBlogItem({
    super.key,
    required this.blog,
    required this.onTap,
  });

  @override
  State<FavoriteBlogItem> createState() => _FavoriteBlogItemState();
}

class _FavoriteBlogItemState extends State<FavoriteBlogItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), // Adjusted to match the design
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5), // Use the theme's accent color with opacity
            width: 0.5,
          ),
          color: Theme.of(context).cardColor, // Use the theme's card color
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
          child: Row(
            children: [
              if (widget.blog.imageUrl != null)
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    bottomLeft: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    widget.blog.imageUrl!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.blog.title,
                        style: Theme.of(context).textTheme.bodyLarge, // Use the theme's bodyText1 style
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
