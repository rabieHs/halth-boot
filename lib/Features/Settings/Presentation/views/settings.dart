import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helthy_translator/Features/Settings/Presentation/views/widgets/language_selector.dart';
import 'package:helthy_translator/Features/chat/presentation/controllers/bloc/chat_bloc.dart';
import 'package:helthy_translator/Features/chat/presentation/views/chatroom.dart';
import 'package:helthy_translator/core/extensions.dart';
import '../../../../core/common/methods/validation.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../core/consts.dart';
import 'widgets/custom_auth_navigation_row.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(Consts.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Text(
                "Welcome Back!",
                style: Consts.titleTextStyle,
              ),
            ),
            Center(
              child: Image.asset(
                "assets/app.png",
                width: context.screenWidth * 0.5,
              ),
            ),
            SizedBox(
              height: Consts.defaultPadding * 2,
            ),
            _buildForm(context)
          ],
        ),
      ),
    );
  }

  Form _buildForm(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final validator = AuthValidation();
    String inputLanguage = "";
    String outputLanguage = "";

    bool viewPassword = false;
    return Form(
        key: formKey,
        child: Container(
          height: context.screenHeight * 0.27,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LanguageSelector(
                  validator: validator.validateInput,
                  title: "Input Language",
                  onChange: (input) {
                    inputLanguage = input!;
                  }),
              LanguageSelector(
                  validator: validator.validateInput,
                  title: "Output Language",
                  onChange: (output) {
                    outputLanguage = output!;
                  }),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final bloc = BlocProvider.of<ChatBloc>(context);
                    bloc.input = inputLanguage;
                    bloc.output = outputLanguage;

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChatRoom(
                            input: inputLanguage, output: outputLanguage)));
                  }
                },
                label: "GO",
              ),
            ],
          ),
        ));
  }
}
