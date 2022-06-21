import 'package:better_player/better_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:my_app/player_state.dart';
import 'package:provider/provider.dart';

class BccmPlayer extends StatelessWidget {
  const BccmPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerState>(
        builder: ((context, value, child) => BetterPlayer(controller: value.controller.betterPlayerController!)));
  }
}
