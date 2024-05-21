import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tinasha_v2/widgets/anime_list.dart';

class ListRoute extends StatefulWidget {
  const ListRoute({super.key});

  @override
  State<ListRoute> createState() => _ListRouteState();
}

class _ListRouteState extends State<ListRoute> {
  final ScrollController watchingScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        initialIndex: 1,
        child: Scaffold(
          appBar: const TabBar(
            isScrollable: true,
            enableFeedback: true,
            padding: EdgeInsets.only(left: 20),
            tabAlignment: TabAlignment.center,
            tabs: <Widget>[
              Tab(text: 'All'),
              Tab(text: 'Watching'),
              Tab(text: 'Completed'),
              Tab(text: 'On Hold'),
              Tab(text: 'Dropped'),
              Tab(text: 'Plan to Watch'),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              Scrollbar(
                controller: watchingScrollController,
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) => const Gap(2),
                  itemBuilder: (c, i) => const AnimeList(),
                  controller: watchingScrollController,
                  // padding: const EdgeInsets.all(15),
                ),
              ),
              Scrollbar(
                controller: watchingScrollController,
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) => const Gap(2),
                  itemBuilder: (c, i) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: AnimeList(),
                  ),
                  controller: watchingScrollController,
                  // padding: const EdgeInsets.all(15),
                ),
              ),
              Scrollbar(
                controller: watchingScrollController,
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) => const Gap(2),
                  itemBuilder: (c, i) => const AnimeList(),
                  controller: watchingScrollController,
                  // padding: const EdgeInsets.all(15),
                ),
              ),
              Scrollbar(
                controller: watchingScrollController,
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) => const Gap(2),
                  itemBuilder: (c, i) => const AnimeList(),
                  controller: watchingScrollController,
                  // padding: const EdgeInsets.all(15),
                ),
              ),
              Scrollbar(
                controller: watchingScrollController,
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) => const Gap(2),
                  itemBuilder: (c, i) => const AnimeList(),
                  controller: watchingScrollController,
                  // padding: const EdgeInsets.all(15),
                ),
              ),
              Scrollbar(
                controller: watchingScrollController,
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (context, index) => const Gap(2),
                  itemBuilder: (c, i) => const AnimeList(),
                  controller: watchingScrollController,
                  // padding: const EdgeInsets.all(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
