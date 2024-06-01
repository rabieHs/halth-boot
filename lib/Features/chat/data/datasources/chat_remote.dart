import 'dart:convert';

import 'package:helthy_translator/Features/chat/data/models/audio_message_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/consts.dart';
import '../../../../core/error/exception.dart';
import '../models/message_request_model.dart';
import '../models/message_response_model.dart';

abstract class ChatRemote {
  Future<MessageResponseModel> sendMessage(MessageRequestModel request);
  Future<MessageResponseModel> sendAudio(AudioMessageModel request);
}

class ChatRemoteImpl implements ChatRemote {
  @override
  Future<MessageResponseModel> sendMessage(MessageRequestModel request) async {
    print("running");
    print(request.toJson());
    final response = await http.post(
      Uri.parse("http://172.16.15.0:8080/api/translate/"),
      body: request.toJson(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);

    if (response.statusCode == 200) {
      return MessageResponseModel.fromJson(response.body);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MessageResponseModel> sendAudio(AudioMessageModel audioRequest) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("http://172.16.15.0:8080/api/chat-audio/"));

    // Add the audio file
    request.files.add(
      await http.MultipartFile.fromPath(
        'audio',
        audioRequest.audio.path,
      ),
    );

    request.fields['output_language'] = audioRequest.outputLanguage;

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();

      return MessageResponseModel.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }
}
