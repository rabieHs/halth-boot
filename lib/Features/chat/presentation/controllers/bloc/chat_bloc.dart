import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:helthy_translator/Features/chat/domain/entities/audio_message.dart';
import 'package:helthy_translator/Features/chat/domain/usecases/sendMessage.dart';
import 'package:helthy_translator/Features/chat/domain/usecases/send_audio_usecase.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../../domain/entities/request.dart';
import '../../../domain/entities/response.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final usecase = SendMessageUseCase();
  final audioUsecase = SendAudioUsecase();
  String _audioPath = "";
  String get path => _audioPath;
  String _input = "";
  String get input => _input;
  String _output = "";
  String get output => _output;
  List<MessageResponse> _messages = [];

  List<MessageResponse> get chats => _messages;

  set input(String newInput) {
    _input = newInput;
  }

  set output(String newOutput) {
    _output = newOutput;
  }

  final AudioRecorder _record = AudioRecorder();

  ChatBloc() : super(ChatInitial()) {
    on<SendMessageEvent>((event, emit) async {
      emit(LoadingChatsState());
      final messageModel = MessageRequest(
          message: event.message,
          inputLanguage: event.inputLanguage,
          outputLanguage: event.outputLanguage);

      final response = await usecase.call(messageModel);
      response.fold((l) => emit(ErrorLoadingChatsState(message: "error")), (r) {
        r.forEach((message) {
          _messages.add(message);
          emit(LoadedChatsState());
        });
      });
    });

    on<sendAudioMessageEvent>((event, emit) async {
      emit(LoadingChatsState());
      final messageModel = AudioMessage(
          audio: event.audioFile, outputLanguage: event.outputLanguage);

      final response = await audioUsecase.call(messageModel);
      response.fold((l) => emit(ErrorLoadingChatsState(message: "error")), (r) {
        r.forEach((message) {
          _messages.add(message);
          _audioPath = "";
          emit(LoadedChatsState());
        });
      });
    });
  }

  Future<void> startRecording() async {
    try {
      if (await _record.hasPermission()) {
        Directory tempDir = await getTemporaryDirectory();
        _audioPath = '${tempDir.path}/recording.wav';

        await _record.start(
            path: _audioPath,
            RecordConfig(
              encoder: AudioEncoder.wav,
            ));
      } else {
        print('Recording permission not granted.');
      }
    } catch (e) {
      print('Failed to start recording: $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      await _record.stop();
    } catch (e) {
      print('Failed to stop recording: $e');
    }
  }
}
