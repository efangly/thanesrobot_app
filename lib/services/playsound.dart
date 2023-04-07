import 'package:just_audio/just_audio.dart';

class PlaySound {
  Future<void> play(String file) async {
    final player = AudioPlayer();
    await player.setAsset('assets/sounds/$file');
    await player.play();
  }
}
