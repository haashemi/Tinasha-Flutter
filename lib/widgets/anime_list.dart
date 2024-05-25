import 'package:flutter/material.dart';

class AnimeList extends StatelessWidget {
  const AnimeList({super.key});

  void onAdd() {}
  void onEdit() {}

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: 140,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Image.network(
                  'https://cdn.myanimelist.net/images/anime/1346/141203.jpg',
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Maou no Ore ga Dorei Elf wo Yome ni Shitanda ga, Dou Medereba Ii?',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.transparent,
                                chipTheme:
                                    const ChipThemeData(shape: LinearBorder()),
                              ),
                              child: Chip(
                                label: Text(
                                  "8.76",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                avatar: const Icon(Icons.star),
                              ),
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.transparent,
                                chipTheme:
                                    const ChipThemeData(shape: LinearBorder()),
                              ),
                              child: Chip(
                                label: Text(
                                  "8/12",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                avatar: const Icon(Icons.play_circle_outlined),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                IconButton.outlined(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                ),
                                const SizedBox(width: 10), // give it width
                                IconButton.filled(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit_note),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
