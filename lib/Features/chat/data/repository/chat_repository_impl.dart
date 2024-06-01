import 'package:dartz/dartz.dart';
import 'package:helthy_translator/Features/chat/data/models/audio_message_model.dart';
import 'package:helthy_translator/Features/chat/domain/entities/audio_message.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/networking/network_info.dart';
import '../../domain/entities/request.dart';
import '../../domain/entities/response.dart';
import '../../domain/repository/chat_repository.dart';
import '../datasources/chat_remote.dart';
import '../models/message_request_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  ChatRemote datasource = ChatRemoteImpl();
  final NetworkInfo checker =
      NetworkInfoImpl(connectionChecker: InternetConnectionChecker());

  @override
  Future<Either<Failure, List<MessageResponse>>> sendMessage(
      MessageRequest reques) async {
    print("run repository");

    List<MessageResponse> responseList = [];
    responseList.add(MessageResponse(
        response: reques.message, isTyping: false, isChatbot: false));

    try {
      final MessageRequestModel model = MessageRequestModel(
          message: reques.message,
          inputLanguage: reques.inputLanguage,
          outputLanguage: reques.outputLanguage);
      final response = await datasource.sendMessage(model);
      responseList.add(response);
      return Right(responseList);
    } on ServerFailure catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<MessageResponse>>> sendAudioMessage(
      AudioMessage reques) async {
    List<MessageResponse> responseList = [];
    responseList.add(MessageResponse(
        response: "Audio File", isTyping: false, isChatbot: false));

    try {
      final AudioMessageModel model = AudioMessageModel(
          audio: reques.audio, outputLanguage: reques.outputLanguage);
      final response = await datasource.sendAudio(model);
      responseList.add(response);
      return Right(responseList);
    } on ServerFailure catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }
}
