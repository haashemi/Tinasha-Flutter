import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Maou no Ore ga Dorei Elf wo Yome ni Shitanda ga, Dou Medereba Ii?',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Row(
                            children: <Widget>[
                              Icon(Icons.star, size: 20),
                              Gap(5),
                              Text('8.22'),
                            ],
                          ),
                          const Row(
                            children: <Widget>[
                              Icon(Icons.play_circle_outlined, size: 20),
                              Gap(5),
                              Text(
                                '5/12',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
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
