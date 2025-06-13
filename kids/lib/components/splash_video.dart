import 'package:device_info_plus/device_info_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class SplashVideo extends StatefulWidget {
  const SplashVideo({super.key, required this.child});
  final Widget child;

  @override
  State<SplashVideo> createState() => _SplashVideoState();
}

class _SplashVideoState extends State<SplashVideo> {
  late VideoPlayerController? playerController;
  bool done = false;

  Future<bool> _isHiSiliconDevice() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      String manufacturer = androidInfo.manufacturer.toLowerCase();
      String model = androidInfo.model.toLowerCase();
      String hardware = androidInfo.hardware.toLowerCase();

      return manufacturer.contains('huawei') ||
          manufacturer.contains('honor') ||
          model.contains('kirin') ||
          hardware.contains('hisi') ||
          hardware.contains('hisilicon');
    }
    return false;
  }

  @override
  void initState() {
    super.initState();

    // Skip video initialization if it's a HiSilicon device
    _isHiSiliconDevice().then((value) {
      if (!value) return;

      setState(() {
        done = true;
      });
      return;
    });

    playerController = VideoPlayerController.asset('assets/flavors/prod/logo_anim.mp4')
      ..setVolume(0.3)
      ..initialize().then((_) {
        if (mounted && playerController != null) {
          playerController!.play();
        }
      }).catchError((error) {
        // Handle initialization errors (including codec issues)
        debugPrint('Video player initialization error: $error');
        setState(() {
          done = true;
        });
      })
      ..addListener(() {
        if (playerController == null) return;

        // Check for playback errors
        if (playerController!.value.hasError) {
          debugPrint('Video playback error: ${playerController!.value.errorDescription}');
          setState(() {
            done = true;
          });
          return;
        }

        if (playerController!.value.isCompleted) {
          setState(() {
            done = true;
          });
          Future.delayed(const Duration(seconds: 5), () {
            playerController?.dispose();
            playerController = null;
          });
        }
      });
  }

  @override
  void dispose() {
    playerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (done) {
      return widget.child;
    } else {
      return Container(
        color: Colors.black,
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width * 9 / 16,
            child: playerController == null ? null : VideoPlayer(playerController!),
          ),
        ),
      );
    }
  }
}
