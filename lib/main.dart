import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/heroes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hero Animation Flutter',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            child: Hero(
              tag: 'album-image',
              child: Image.network(
                  "https://img.ohmymag.com/article/musique/pochette-de-l-album-des-pink-floyd-dark-of-the-moon_52798d7562d1aa0907e1c57e5ed4216c397ba79e.jpg"),
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Hero(
        tag: 'album-image',
        child: Image.network(
            "https://img.ohmymag.com/article/musique/pochette-de-l-album-des-pink-floyd-dark-of-the-moon_52798d7562d1aa0907e1c57e5ed4216c397ba79e.jpg"),
      ),
    );
  }
}
