import 'package:blog_explorer/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'blocs/blog_bloc.dart';
import 'blocs/blog_event.dart';
import 'models/blog_model.dart';
import 'repositories/blog_repository.dart';
import 'screens/blog_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BlogAdapter());
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return BlocProvider(
      create: (context) => BlogBloc(blogRepository: BlogRepository())..add(FetchBlogsEvent()),
      child: MaterialApp(
        title: 'Blog Explorer',
        themeMode: themeProvider.themeMode,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black, // Light gray background
          scaffoldBackgroundColor: const Color.fromRGBO(200, 218, 230, 1.0),
          cardColor: const Color(0xFFFFFFFF), // White for cards
          hintColor: const Color(0xFF00A7E1), // Accent color (pastel-like)
          textTheme: const TextTheme(
            displayLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(color: Colors.black87), // Dark gray text
            bodyMedium: TextStyle(color: Colors.black54), // Medium gray text
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(97, 142, 170, 1.0), // AppBar background
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          ),
          buttonTheme: const ButtonThemeData(
            buttonColor: Color(0xFF00A7E1), // Accent color for buttons
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black, // Maintain black primary color
          scaffoldBackgroundColor: const Color(0xFF212121), // Dark gray background
          cardColor: const Color(0xFF303030), // Darker gray for cards
          hintColor: Colors.tealAccent[700], // Teal accent color
          textTheme: const TextTheme(
            displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(color: Colors.white70), // Lighter white text
            bodyMedium: TextStyle(color: Colors.white54), // Even lighter white text
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: const Color(0xFF1B1B1B), // Darker gray for AppBar
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.grey), // White icons
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.tealAccent, // Teal accent color for buttons
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: const BlogListScreen(),
      ),
    );
  }
}
