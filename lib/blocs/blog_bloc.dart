import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/blog_repository.dart';
import 'blog_event.dart';
import 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository blogRepository;

  BlogBloc({required this.blogRepository}) : super(BlogInitial()) {
    on<FetchBlogsEvent>((event, emit) async {
      emit(BlogLoading());
      try {
        final blogs = await blogRepository.fetchBlogs();
        emit(BlogLoaded(blogs: blogs));
      } catch (e) {
        print('Error fetching blogs: $e');
        emit(BlogError(message: e.toString()));
      }
    });
  }
}
