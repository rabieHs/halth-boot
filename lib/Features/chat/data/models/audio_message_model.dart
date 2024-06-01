import 'dart:convert';

import 'package:helthy_translator/Features/chat/domain/entities/audio_message.dart';

class AudioMessageModel extends AudioMessage {
  AudioMessageModel({required super.audio, required super.outputLanguage});
  String toJson() {
    return jsonEncode({"file": audio, "output_language": outputLanguage});
  }
}
