import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: _screenSize.height * 0.5,
        child: const Center(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: _screenSize.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.6,
        itemHeight: _screenSize.height * 0.4,
        itemBuilder: (_, int index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: movies[index]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullProsterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
