import 'package:bundacare/data/models/chat_model.dart';
import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.chat,
  });

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 0),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Text(
                    chat.userPrompt.text,
                    softWrap: true,
                    style: AppTypography.light.copyWith(
                      color: AppColor.black,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const CustomSvgPicture(
                  assetName: AppIcon.appIcon,
                  height: 42,
                  color: AppColor.white,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Text(
                    chat.botResponse.text,
                    softWrap: true,
                    style: AppTypography.light.copyWith(
                      color: AppColor.black,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
