import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tinasha_v2/components/anime_list.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final watchingScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
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
              Tab(text: "All"),
              Tab(text: "Watching"),
              Tab(text: "Completed"),
              Tab(text: "On Hold"),
              Tab(text: "Dropped"),
              Tab(text: "Plan to Watch"),
            ],
          ),
          body: TabBarView(
            viewportFraction: 1,
            children: <Widget>[
              Scrollbar(
                controller: watchingScrollController,
                child: ListView.builder(
                  itemBuilder: (c, i) => const AnimeList(),
                  controller: watchingScrollController,
                  // padding: const EdgeInsets.all(15),
                ),
              ),
              Scrollbar(
                controller: watchingScrollController,
                child: ListView.separated(
                  itemCount: 20,
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
                child: ListView.builder(
                  itemBuilder: (c, i) => const AnimeList(),
                  controller: watchingScrollController,
                  // padding: const EdgeInsets.all(15),
                ),
              ),
              Scrollbar(
                controller: watchingScrollController,
                child: ListView.builder(
                  itemBuilder: (c, i) => const AnimeList(),
                  controller: watchingScrollController,
                  // padding: const EdgeInsets.all(15),
                ),
              ),
              Scrollbar(
                controller: watchingScrollController,
                child: ListView.builder(
                  itemBuilder: (c, i) => const AnimeList(),
                  controller: watchingScrollController,
                  // padding: const EdgeInsets.all(15),
                ),
              ),
              Scrollbar(
                controller: watchingScrollController,
                child: ListView.builder(
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
