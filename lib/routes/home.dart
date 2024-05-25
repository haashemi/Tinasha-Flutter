import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tinasha_v2/widgets/AnimeListCard.dart';

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
              onPressed: () async => context.push('/search'),
              label: const Text('Search'),
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<bool?>(
            context: context,
            builder: (context) => SizedBox(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton.outlined(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.cancel),
                          tooltip: 'Cancel',
                        ),
                        IconButton.filled(
                          onPressed: () => context.pop(true),
                          icon: const Icon(Icons.check),
                          tooltip: "Set Filters",
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: IconButton.outlined(
                            onPressed: () {},
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            icon: const Icon(Icons.exposure_minus_1),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "2024",
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: IconButton.outlined(
                            onPressed: () {},
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            icon: const Icon(Icons.plus_one),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: SegmentedButton(
                        segments: const [
                          ButtonSegment(value: 'winter', label: Text('Winter')),
                          ButtonSegment(value: 'spring', label: Text('Spring')),
                          ButtonSegment(value: 'summer', label: Text('Summer')),
                          ButtonSegment(value: 'fall', label: Text('Fall')),
                        ],
                        onSelectionChanged: (val) {},
                        selected: Set.from({'spring'}),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: SegmentedButton(
                        segments: const [
                          ButtonSegment(
                            value: 'anime_num_list_users',
                            label: Text('Sort by Members'),
                          ),
                          ButtonSegment(
                            value: 'anime_score',
                            label: Text('Sort by Score'),
                          ),
                        ],
                        onSelectionChanged: (val) {},
                        selected: Set.from({'anime_num_list_users'}),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.filter_alt_outlined),
      ),
      body: ListView.separated(
        itemCount: 20,
        padding: EdgeInsets.only(
          bottom: MediaQuery.paddingOf(context).bottom + 10,
          top: 2,
          left: 10,
          right: 10,
        ),
        itemBuilder: (context, index) => const AnimeListCard(),
        separatorBuilder: (context, index) => const Gap(2),
      ),
    );
  }
}
