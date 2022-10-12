import 'package:flutter/material.dart';

import '../icon_label_button.dart';

class Featured extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const Featured({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      const marginX = 2.0;
      final viewportFraction =
          (constraints.maxWidth - (32 - 2 * marginX)) / constraints.maxWidth;
      print(viewportFraction);
      return SizedBox(
        height: 323,
        child: PageView.builder(
          controller: PageController(viewportFraction: viewportFraction),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _FeaturedItem(
              data: items[index % items.length],
              margin: const EdgeInsets.symmetric(horizontal: marginX),
            );
          },
        ),
      );
    });
  }
}

class _FeaturedItem extends StatelessWidget {
  final Map<String, dynamic> data;
  final EdgeInsetsGeometry? margin;

  const _FeaturedItem({
    required this.data,
    this.margin = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: double.infinity,
      child: Stack(children: [
        _GradientImage(data['image']!),
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
                      data['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      data['subTitle']!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  data['live']
                      ? IconLabelButton.redSmall(
                          imagePath: 'assets/icons/Play.png',
                          labelText: 'Live',
                          onPressed: () {},
                        )
                      : IconLabelButton.secondarySmall(
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
  }
}

class _GradientImage extends StatelessWidget {
  final String image;
  final height = 290.0;

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
