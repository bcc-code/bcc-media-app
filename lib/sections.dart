import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/episode.dart';
import 'package:transparent_image/transparent_image.dart';

import 'api/sliders.dart';

class ItemSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const ItemSection({Key? key, required this.title, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              style: Theme.of(context).textTheme.headlineMedium,
              title,
            ),
          ),
          Slider(items: items),
        ],
      ),
    );
  }

  factory ItemSection.fromSection(BuildContext context, Section section) {
    var items = section.items.map((si) {
      var item = Item.fromSectionItem(si);
      return ItemWidget(
        item: item,
        onTap: () {
          Navigator.pushNamed(context, item.url, arguments: item.params);
        },
      );
    }).toList();
    return ItemSection(title: section.title, items: items);
  }
}

class Slider extends StatelessWidget {
  final List<Widget> items;

  const Slider({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: items,
      ),
    );
  }
}

class Item {
  String title;
  String? imageUrl;
  String? description;
  String url;
  dynamic params;
  Item(
      {required this.title,
      required this.url,
      this.description,
      this.imageUrl,
      this.params});

  factory Item.fromSectionItem(SectionItem sectionItem) {
    return Item(
        title: sectionItem.title,
        imageUrl: sectionItem.imageUrl,
        url: '/episode/${sectionItem.id}',
        params: EpisodePageArguments(sectionItem.id));
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;

  final void Function()? onTap;

  const ItemWidget({Key? key, required this.item, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item.imageUrl == null
                  ? Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(29, 40, 56, 1),
                          borderRadius: BorderRadius.circular(10)),
                      width: 200,
                      height: 120,
                      padding: const EdgeInsets.all(10))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.memoryNetwork(
                        width: 200,
                        height: 120,
                        fadeInDuration: Duration(milliseconds: 50),
                        image: item.imageUrl!,
                        placeholder: kTransparentImage,
                      )),
              Text(item.title),
              Text(item.title),
            ],
          ),
        ),
      ),
    );
  }
}
