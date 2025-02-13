import 'package:bundacare/screens/widgets/picture_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/strings.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:bundacare/utils/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConsumingWidget extends StatelessWidget {
  const ConsumingWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: IconButton(
        onPressed: () {
          context.pushNamed(RouterPath.detailConsuming);
        },
        style: IconButton.styleFrom(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: SizedBox(
          height: 80,
          child: Row(
            children: [
              Container(
                width: 80,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://cdn1-production-images-kly.akamaized.net/LDRjBxjUH3gyrzEAUFrCi_XisTs=/0x148:1920x1230/800x450/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3093328/original/069244600_1585909700-fried-2509089_1920.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.62,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nasi Goreng',
                            style: AppTypography.medium.copyWith(
                              color: AppColor.black,
                            ),
                          ),
                          Row(
                            children: [
                              const CustomSvgPicture(
                                assetName: AppIcon.clockIcon,
                                height: 16,
                                color: AppColor.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '16 Min',
                                style: AppTypography.medium.copyWith(
                                  color: AppColor.grey,
                                  fontSize: AppTypographySize.caption,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return icon(nutritionIcon[index]);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 4);
                        },
                        itemCount: nutritionIcon.length,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row icon(String assetName) {
    return Row(
      children: [
        CustomSvgPicture(
          assetName: assetName,
          width: 20,
        ),
        const SizedBox(width: 2),
        Text(
          '20 kg',
          style: AppTypography.light.copyWith(
            color: AppColor.black,
            fontSize: AppTypographySize.caption,
          ),
        ),
      ],
    );
  }
}
