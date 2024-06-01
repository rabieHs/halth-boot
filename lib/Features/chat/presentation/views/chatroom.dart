// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helthy_translator/Features/Settings/Presentation/views/widgets/language_selector.dart';
import 'package:helthy_translator/Features/chat/presentation/controllers/bloc/chat_bloc.dart';
import 'package:helthy_translator/core/common/methods/validation.dart';
import 'package:helthy_translator/core/common/widgets/custom_button.dart';
import 'package:helthy_translator/core/extensions.dart';

import '../../../../core/consts.dart';

import '../../../Settings/Presentation/views/widgets/settings_button.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/custom_message_textfield.dart';

class ChatRoom extends StatefulWidget {
  final messageController = TextEditingController();

  String input;
  String output;
  ChatRoom({
    Key? key,
    required this.input,
    required this.output,
  }) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  bool isRecording = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is LoadedChatsState) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(child: _buildBody(context)),
          ),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTopBar(context),
        Padding(
          padding:
              EdgeInsets.all(Consts.defaultPadding).copyWith(top: 0, bottom: 0),
          child: _buildChatList(context),
        ),
        _buildMessageInputContainer(),
      ],
    );
  }

  Container _buildMessageInputContainer() {
    return Container(
      height: 100,
      color: Colors.white.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: Consts.defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: CustomMessageTextField(
              isRecord: isRecording,
              onAudioTaped: () {
                if (isRecording) {
                  BlocProvider.of<ChatBloc>(context).stopRecording();
                } else {
                  BlocProvider.of<ChatBloc>(context).startRecording();
                }
                setState(() {
                  isRecording = !isRecording;
                });
              },
              title: "message",
              validator: (value) {},
              nameController: widget.messageController,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.attach_file)),
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Consts.primaryColor,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              if (BlocProvider.of<ChatBloc>(context).path.isNotEmpty) {
                print("button pressed");
                final bloc = BlocProvider.of<ChatBloc>(context);

                BlocProvider.of<ChatBloc>(context).add(sendAudioMessageEvent(
                    audioFile: File(BlocProvider.of<ChatBloc>(context).path),
                    outputLanguage: bloc.output));
              } else {
                print("button pressed");
                final bloc = BlocProvider.of<ChatBloc>(context);

                BlocProvider.of<ChatBloc>(context).add(SendMessageEvent(
                    message: widget.messageController.text,
                    inputLanguage: bloc.input,
                    outputLanguage: bloc.output));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChatList(BuildContext context) {
    final bloc = BlocProvider.of<ChatBloc>(context);
    return Container(
        height: context.screenHeight * 0.77,
        child: ListView.builder(
            itemCount: bloc.chats.length,
            itemBuilder: (context, index) {
              return ChatBubble(
                isSender: bloc.chats[index].isChatbot ? false : true,
                message: bloc.chats[index].response,
              );
            }));
  }

  Container _buildTopBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Consts.defaultPadding).copyWith(bottom: 0),
      height: context.screenHeight * 0.11,
      color: Colors.white.withOpacity(0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 27,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55),
                image: DecorationImage(image: AssetImage("assets/app.png"))),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Health Translator", style: Consts.defaultTextStyle),
                Text("online"),
              ],
            ),
          ),
          SettingsButton()
        ],
      ),
    );
  }
}
