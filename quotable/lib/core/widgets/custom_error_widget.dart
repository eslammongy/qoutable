import 'package:flutter/material.dart';
import 'package:quotable/core/error/api_failure.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:quotable/core/error/api_error_msg.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.failure, this.onPressed});
  final Failure failure;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          failure.message == noInternetError
              ? Image.asset(
                  AppAssets.noWifiImg,
                  width: 200,
                )
              : Image.asset(
                  AppAssets.responseErrorImg,
                  width: 200,
                ),
          Text(
            "${failure.message}",
            textAlign: TextAlign.center,
            style: TextStyles.font16SemiBold,
          ),
          TextButton(
              onPressed: onPressed,
              child: Text(
                "Try again",
                textAlign: TextAlign.center,
                style:
                    TextStyles.font16SemiBold.copyWith(color: Colors.redAccent),
              )),
        ],
      ),
    ));
  }
}
