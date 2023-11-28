// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:audioplayers/audioplayers.dart';
import 'package:share_plus/share_plus.dart';

class SoundButton extends StatelessWidget {
  final String text;
  final String path;

  final player = AudioPlayer();

  void playFile(String file) async {
    await player.play(AssetSource(path));
  }

  void onClick() {
    if (player.state == PlayerState.playing) {
      player.stop();
    } else {
      playFile(path);
    }
  }

  void onLongPress() {
    print(
        path); /*
    final audio = await rootBundle.load("assets/$path");
    final buffer = audio.buffer;
    Share.shareXFiles([
      XFile.fromData(
          buffer.asUint8List(
          audio.offsetInBytes, 
          audio.lengthInBytes),
          name: path,
          mimeType: "audio/mpeg")
    ]);*/
    XFile audioFile = XFile("assets/$path");
    Share.shareXFiles([audioFile]);
  }

  SoundButton({required this.text, required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onClick,
      onLongPress: onLongPress,

      style: FilledButton.styleFrom(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        side: const BorderSide(color: Colors.white, width: 1),
      ),

      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
