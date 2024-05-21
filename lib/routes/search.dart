import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchRoute extends StatefulWidget {
  const SearchRoute({super.key});

  @override
  State<SearchRoute> createState() => _SearchRouteState();
}

class _SearchRouteState extends State<SearchRoute> {
  String searchMode = 'anime';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchBar(
          autoFocus: true,
          leading: BackButton(onPressed: () => context.pop()),
          hintText: 'Search...',
          trailing: <Widget>[
            IconButton(
              onPressed: () => setState(() {
                searchMode = searchMode == 'anime' ? 'manga' : 'anime';
              }),
              icon: Icon(searchMode == 'anime'
                  ? Icons.live_tv
                  : Icons.menu_book_rounded,),
            ),
          ],
        ),
      ),
      body: const Column(
        
      ),
    );
  }
}
