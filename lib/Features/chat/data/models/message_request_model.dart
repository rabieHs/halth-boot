import 'dart:convert';

import '../../domain/entities/request.dart';

class MessageRequestModel extends MessageRequest {
  MessageRequestModel(
      {required super.message,
      required super.inputLanguage,
      required super.outputLanguage});

  String toJson() {
    return jsonEncode({
      "message": message,
      "input_language": inputLanguage,
      "output_language": outputLanguage
    });
  }
}
