import 'package:bundacare/screens/widgets/appbar_widget.dart';
import 'package:bundacare/utils/constant/colors.dart';
import 'package:bundacare/utils/constant/typography.dart';
import 'package:flutter/material.dart';

class DetailEducation extends StatelessWidget {
  const DetailEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(context, 'Education', () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Nutrisi Wajib untuk Ibu Hamil di Setiap Trimester',
                style: AppTypography.semiBold.copyWith(
                  color: AppColor.black,
                  overflow: TextOverflow.clip,
                  fontSize: AppTypographySize.body2,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Selama kehamilan, kebutuhan gizi ibu akan meningkat untuk mendukung pertumbuhan janin. Setiap trimester memiliki kebutuhan nutrisi yang berbeda.',
                style: AppTypography.light.copyWith(
                  color: AppColor.black,
                  fontSize: AppTypographySize.body4,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
