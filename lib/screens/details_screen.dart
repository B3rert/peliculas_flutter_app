import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _movie = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const _PosterAndTitle(),
              const _Overview(),
              const CastingCards(),
            ],
          ),
        ),
      ],
    ));
  }
}

class _Overview extends StatelessWidget {
  const _Overview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Text(
        'Mollit quis laboris quis in esse minim reprehenderit. Pariatur cillum tempor aliquip esse cillum tempor pariatur fugiat est esse. Occaecat duis eiusmod voluptate laboris consectetur. Cillum adipisicing Lorem culpa sunt esse officia. Laborum voluptate ipsum est minim. Incididunt dolore ipsum in velit labore pariatur esse sunt aute excepteur Lorem. Commodo occaecat mollit Lorem ex aliqua.',
        textAlign: TextAlign.justify,
        style: _textTheme.subtitle1,
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/300x400'),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movie Title',
                style: _textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Original Title',
                style: _textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '8.0',
                    style: _textTheme.caption,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          width: double.infinity,
          child: const Text(
            'Movie Title',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          alignment: Alignment.bottomCenter,
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
