import 'package:bundacare/cubit/chat/chat_cubit.dart';
import 'package:bundacare/cubit/other_cubit.dart';
import 'package:bundacare/screens/widgets/bar_widget.dart';
import 'package:bundacare/screens/chat/widgets/chat_widget.dart';
import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController _chatController;
  late ScrollController _scrollController;
  // bool _isFirstBuild = true;

  @override
  void initState() {
    super.initState();
    _chatController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _chatController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => {FocusManager.instance.primaryFocus?.unfocus()},
        child: SafeArea(
          child: Column(
            children: [
              const CustomeBar(),
              BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  if (state is ChatInitial) {
                    return const Expanded(child: Center());
                  } else if (state is ChatLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: state.chats.length,
                        itemBuilder: (context, index) {
                          return ChatWidget(
                            chat: state.chats[index],
                          );
                        },
                      ),
                    );
                  } else {
                    return const Expanded(child: SizedBox());
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 28),
                child: Center(
                  child: TextFormField(
                    controller: _chatController,
                    maxLines: 2,
                    cursorColor: AppColor.black,
                    style: AppTypography.light.copyWith(color: AppColor.black),
                    decoration: InputDecoration(
                      labelText: AppID.hintTextfield,
                      labelStyle: AppTypography.light.copyWith(
                        color: AppColor.black,
                        fontSize: AppTypographySize.body4,
                      ),
                      filled: true,
                      fillColor: AppColor.primary.withValues(alpha: 0.08),
                      suffixIcon: BlocBuilder<ChatButtonCubit, bool>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: CustomSvgPicture(
                                assetName: AppIcon.sendIcon,
                                height: 38,
                                color: state ? AppColor.primary : AppColor.grey,
                              ),
                              style: IconButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(2),
                              ),
                              onPressed: state
                                  ? () {
                                      context
                                          .read<ChatCubit>()
                                          .getChats(_chatController.text);
                                      _chatController.clear();
                                      _scrollController.animateTo(
                                        _scrollController
                                            .position.maxScrollExtent,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeOut,
                                      );
                                    }
                                  : null,
                            ),
                          );
                        },
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      helperText: AppID.helperTextfield,
                      helperStyle: AppTypography.light.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        context.read<ChatButtonCubit>().changeChatButton(true);
                      } else {
                        context.read<ChatButtonCubit>().changeChatButton(false);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
