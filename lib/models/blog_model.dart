import 'package:hive/hive.dart';

part 'blog_model.g.dart';

@HiveType(typeId: 0)
class Blog extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? imageUrl;

  @HiveField(3)
  final bool isFavorite;

  Blog({
    required this.id,
    required this.title,
    this.imageUrl,
    this.isFavorite = false,
  });

  // Factory constructor for creating a Blog from JSON
  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }

  // Method to convert Blog to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image_url': imageUrl,
      'isFavorite': isFavorite,
    };
  }

  // The copyWith method
  Blog copyWith({
    String? id,
    String? title,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Blog(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
