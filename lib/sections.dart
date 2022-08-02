import 'package:flutter/material.dart';
import 'package:my_app/screens/episode.dart';

import 'api/sliders.dart';

class ItemSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const ItemSection({Key? key, required this.title, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(style: Theme.of(context).textTheme.headlineMedium, title),
          Slider(items: items),
        ],
      ),
    );
  }

  factory ItemSection.fromSection(BuildContext context, Section section) {
    var items = section.items.map((si) {
      var item = Item.fromSectionItem(si);
      return ItemWidget(item: item, onTap: () {
        Navigator.pushNamed(context, item.url, arguments: item.params);
      },);
    }).toList();
    return ItemSection(title: section.title, items: items);
  }
}

class Slider extends StatelessWidget {
  final List<Widget> items;

  const Slider({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: items),
    );
  }
}

class Item {
  String title;
  String? description;
  String url;
  dynamic params;
  Item({required this.title, required this.url, this.description, this.params});

  factory Item.fromSectionItem(SectionItem sectionItem) {
    return Item(
      title: sectionItem.title,
      url: '/native',
      params: EpisodePageArguments(sectionItem.id)
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;
  
  final void Function()? onTap;

  const ItemWidget({Key? key, required this.item, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                color: Colors.cyan,
                width: 200,
                height: 120,
                padding: const EdgeInsets.all(10)),
            Text(item.title),
            Text(item.title),
          ],
        ),
      ),
    );
  }
}
