import 'package:flutter/material.dart';
import 'package:tinasha_v2/components/anime_list.dart';

class SeasonalScreen extends StatefulWidget {
  const SeasonalScreen({super.key});

  @override
  State<SeasonalScreen> createState() => _SeasonalScreenState();
}

class _SeasonalScreenState extends State<SeasonalScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Spring 2024"),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text("Search"),
              icon: const Icon(Icons.search),
            )
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            AnimeList(),
            AnimeList(),
            AnimeList(),
            AnimeList(),
            AnimeList(),
            AnimeList(),
            AnimeList(),
            AnimeList(),
            AnimeList(),
            AnimeList(),
            AnimeList(),
          ],
        ),
      ),
    );
  }
}
