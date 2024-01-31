import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:nike_flutter/gen/colors.gen.dart';

class CustomButtonChip extends StatelessWidget {
  const CustomButtonChip({
    super.key,
    required this.title,
    this.backgroundColor,
    this.imagePath,
    this.size,
    this.textStyle,
  });

  final Color? backgroundColor;
  final String? imagePath;
  final String title;
  final TextStyle? textStyle;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorName.secondary,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.5,
          vertical: 5,
        ),
      ),
      onPressed: () {},
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: Platform.isIOS
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (imagePath != null) ...[
              Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  imagePath!,
                  height: size,
                  width: size,
                ),
              ),
              const Gap(5),
            ],
            Text(
              title,
              style: textStyle ??
                  TextStyle(
                    color: ColorName.primary.withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
