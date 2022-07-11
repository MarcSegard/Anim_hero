import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
        child: GridSection(),
      ),
    );
  }
}

class GridSection extends StatelessWidget {
  const GridSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      desiredItemWidth: 150,
      minSpacing: 10,
      children: const [
        AlbumCover(
          albumUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRr4Q776RctXur78Z4NaMRrdh7-_2CZ7wDdBg&usqp=CAU',
          albumTag: 'Starboy',
        ),
        AlbumCover(
          albumUrl:
              'https://i.pinimg.com/236x/26/eb/e9/26ebe9788b358c734a2851048d05b12c--pop-albums-music-albums.jpg',
          albumTag: 'Born to die',
        ),
        AlbumCover(
          albumUrl:
              'https://i.pinimg.com/originals/6a/65/a1/6a65a167095e5f930b5569b276818213.jpg',
          albumTag: 'Overexposed',
        ),
        AlbumCover(
          albumUrl:
              'https://images-na.ssl-images-amazon.com/images/I/31tZr4Nr5vL._AC_SY450_.jpg',
          albumTag: 'Dark Side',
        ),
        AlbumCover(
          albumUrl:
              'https://static.billboard.com/files/media/Taylor-Swift-1989-album-covers-billboard-1000x1000-compressed.jpg',
          albumTag: '1989',
        ),
        AlbumCover(
          albumUrl:
              'https://img.huffingtonpost.com/asset/5badb5be200000e500ff1775.jpeg?ops=scalefit_630_noupscale',
          albumTag: 'Thriller',
        ),
      ],
    );
  }
}

class AlbumCover extends StatelessWidget {
  const AlbumCover({Key? key, required this.albumUrl, required this.albumTag})
      : super(key: key);
  final String albumUrl;
  final String albumTag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumPage(
              albumUrl: albumUrl,
              albumTag: albumTag,
            ),
          ),
        );
      },
      child: Hero(
        tag: albumTag,
        child: Image.network(albumUrl),
      ),
    );
  }
}

class AlbumPage extends StatelessWidget {
  final String albumUrl;
  final String albumTag;
  const AlbumPage({Key? key, required this.albumUrl, required this.albumTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Hero(
        tag: albumTag,
        child: Container(
          width: double.infinity,
          height: 400,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(albumUrl), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
