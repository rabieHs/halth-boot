import 'dart:convert';

import '../../domain/entities/response.dart';

class MessageResponseModel extends MessageResponse {
  MessageResponseModel(
      {required super.isChatbot,
      required super.response,
      required super.isTyping});

  factory MessageResponseModel.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return MessageResponseModel(
      isChatbot: map["is_chatbot"],
      response: map["response"],
      isTyping: map["is_typing"],
    );
  }
}
