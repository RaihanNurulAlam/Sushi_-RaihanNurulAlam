import 'package:flutter/material.dart';
import 'package:flutter_latihan/provider/cart.dart';
import 'package:flutter_latihan/screens/about_screen.dart';
import 'package:flutter_latihan/screens/emoji_generator.dart';
import 'package:flutter_latihan/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Cart(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(title: 'About Screen'),
        '/emojiGenerator': (context) => const EmojiGenerator(),
      },
    );
  }
}
