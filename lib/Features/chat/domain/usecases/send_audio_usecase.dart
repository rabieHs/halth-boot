import 'package:dartz/dartz.dart';
import 'package:helthy_translator/Features/chat/domain/entities/audio_message.dart';

import 'package:http/http.dart';

import '../../../../core/common/methods/base_usecase.dart';
import '../../../../core/error/failure.dart';
import '../../data/repository/chat_repository_impl.dart';
import '../entities/request.dart';
import '../entities/response.dart';
import '../repository/chat_repository.dart';

class SendAudioUsecase
    extends BaseUsecase<List<MessageResponse>, AudioMessage> {
  final ChatRepository repository = ChatRepositoryImpl();

  @override
  Future<Either<Failure, List<MessageResponse>>> call(
      AudioMessage parameter) async {
    print("usecase called");

    return repository.sendAudioMessage(parameter);
  }
}
