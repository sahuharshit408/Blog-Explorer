import 'package:equatable/equatable.dart';
import '../models/blog_model.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

class BlogInitial extends BlogState {}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final List<Blog> blogs;

  const BlogLoaded({required this.blogs});

  @override
  List<Object> get props => [blogs];
}

class BlogError extends BlogState {
  final String message;

  const BlogError({required this.message});

  @override
  List<Object> get props => [message];
}
