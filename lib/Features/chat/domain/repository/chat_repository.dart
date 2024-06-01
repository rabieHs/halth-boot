import 'package:dartz/dartz.dart';
import 'package:helthy_translator/Features/chat/domain/entities/audio_message.dart';

import '../../../../core/error/failure.dart';
import '../entities/request.dart';
import '../entities/response.dart';

abstract class ChatRepository {
  Future<Either<Failure, List<MessageResponse>>> sendMessage(
      MessageRequest reques);

  Future<Either<Failure, List<MessageResponse>>> sendAudioMessage(
      AudioMessage reques);
}
