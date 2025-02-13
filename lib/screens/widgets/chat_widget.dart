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

  final Map<String, dynamic> chat;

  @override
  Widget build(BuildContext context) {
    var sender = chat['isMe'] == true;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment:
            sender ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (sender) ...[
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
          ],
          const SizedBox(width: 0),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: sender
                  ? AppColor.transparent
                  : AppColor.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                chat['message'],
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
    );
  }
}
