import 'package:flutter/material.dart';

import '../icon_label_button.dart';

class Featured extends StatelessWidget {
  final List<Map<String, String>> items;

  const Featured({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: 323,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Container(
              margin: index == items.length - 1
                  ? null
                  : const EdgeInsets.only(right: 4),
              height: double.infinity,
              width: constraints.maxWidth - 32,
              child: Stack(children: [
                _GradientImage(items[index]['image']!),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(13, 22, 35, 0),
                          Color.fromRGBO(13, 22, 35, 1),
                        ],
                        stops: [0, 0.36],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 12, right: 18, bottom: 18, left: 18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              items[index]['title']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w800),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              items[index]['subTitle']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          IconLabelButton.secondarySmall(
                            imagePath: 'assets/icons/Play.png',
                            labelText: 'Watch now',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            );
          },
        ),
      );
    });
  }
}

class _GradientImage extends StatelessWidget {
  final String image;
  final height = 291.0;

  const _GradientImage(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(29, 40, 56, 1),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image),
        ),
      ),
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(13, 22, 35, 0.23),
            Color.fromRGBO(26, 37, 53, 0),
            Color.fromRGBO(13, 22, 35, 1),
          ],
          stops: [0, 0.5, 1],
        ),
      ),
    );
  }
}
