import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helthy_translator/Features/Settings/Presentation/views/widgets/language_selector.dart';
import 'package:helthy_translator/Features/chat/presentation/controllers/bloc/chat_bloc.dart';

import '../../../../../core/common/methods/validation.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/consts.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ChatBloc>(context);
    String input = bloc.input;
    String output = bloc.output;
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Change Language"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LanguageSelector(
                            title: input,
                            onChange: (inp) {
                              input = inp!;
                            },
                            validator: AuthValidation().validateInput),
                        SizedBox(
                          height: Consts.defaultPadding,
                        ),
                        LanguageSelector(
                            title: output,
                            onChange: (out) {
                              output = out!;
                            },
                            validator: AuthValidation().validateInput),
                        SizedBox(
                          height: Consts.defaultPadding,
                        ),
                        CustomButton(
                            onPressed: () {
                              bloc.input = input;
                              bloc.output = output;
                              Navigator.pop(context);
                            },
                            label: "Save")
                      ],
                    ),
                  ));
        },
        icon: Icon(Icons.settings));
  }
}
