import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tinasha_v2/widgets/anime_list.dart';

class TemporarilyList extends StatelessWidget {
  const TemporarilyList(this.scrollController, {super.key});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);

    return ListView.separated(
      itemCount: 20,
      padding: EdgeInsets.only(
        bottom: padding.bottom + 10,
        top: 10,
        left: 10,
        right: 10,
      ),
      itemBuilder: (context, index) => const AnimeList(),
      separatorBuilder: (context, index) => const Gap(2),
    );
  }
}

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
      bottom: false,
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
              TemporarilyList(watchingScrollController),
              TemporarilyList(watchingScrollController),
              TemporarilyList(watchingScrollController),
              TemporarilyList(watchingScrollController),
              TemporarilyList(watchingScrollController),
              TemporarilyList(watchingScrollController),
            ],
          ),
        ),
      ),
    );
  }
}
