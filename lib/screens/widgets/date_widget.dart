import 'package:bundacare/cubit/other_cubit.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({
    super.key,
    required this.date,
    required this.index,
    required this.state,
  });

  final List<Map<String, String>> date;
  final int index;
  final int state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: IconButton(
        onPressed: () {
          context.read<DateCubit>().changeDate(index);
        },
        style: IconButton.styleFrom(
          backgroundColor: state == index ? AppColor.primary : AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: AppColor.primary.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
        ),
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date[index]['day']!,
              style: AppTypography.light.copyWith(
                color: state == index ? AppColor.white : AppColor.black,
                fontSize: AppTypographySize.caption,
              ),
            ),
            Text(
              date[index]['date']!,
              style: AppTypography.medium.copyWith(
                color: state == index ? AppColor.white : AppColor.black,
                fontSize: AppTypographySize.body2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
