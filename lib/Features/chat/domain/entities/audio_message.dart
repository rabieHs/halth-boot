// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

class AudioMessage {
  final File audio;
  final String outputLanguage;
  AudioMessage({
    required this.audio,
    required this.outputLanguage,
  });
}
