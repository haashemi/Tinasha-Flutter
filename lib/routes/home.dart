import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tinasha_v2/widgets/anime_list.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Spring 2024'),
            OutlinedButton.icon(
              onPressed: () async {
                await context.push('/search');
              },
              label: const Text('Search'),
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AnimeList(),
            AnimeList(),
          ],
        ),
      ),
    );
  }
}
