import 'package:bccm_player/bccm_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BccmCastPlayer extends StatefulWidget {
  const BccmCastPlayer({super.key});

  @override
  State<BccmCastPlayer> createState() => _BccmPlayerState();
}

class _BccmPlayerState extends State<BccmCastPlayer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BccmPlayerInterface.instance.openExpandedCastController();
      },
      splashColor: Colors.transparent,
      child: ClipRect(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 29, 40, 56)),
            child: SvgPicture.asset('assets/images/chromecast_bg.svg', fit: BoxFit.cover, package: 'bccm_player', semanticsLabel: 'Casting'),
          ),
        ),
      ),
    );
  }
}
