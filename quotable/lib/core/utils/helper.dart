import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/core/error/api_failure.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:quotable/core/error/api_error_msg.dart';

const pubBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  gradient: LinearGradient(
    colors: [
      Color(0xFF5F20F1),
      Color(0xFF831D95),
      Color(0xFFAE0606),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5, 1.0], // Optional, controls the distribution of colors
  ),
);

BoxDecoration customizedDecorationBox(List<Color> colors,
    {double radius = 12}) {
  return BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    gradient: LinearGradient(
      colors: colors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.0, 1.0], // Optional, controls the distribution of colors
    ),
  );
}

/// Throws a DioException with a connection error type. This is used to
/// simulate a network connection error when fetching remote data.
DioException noConnection() => DioException(
      requestOptions: RequestOptions(),
      type: DioExceptionType.connectionError,
    );

/// Throws a DioException with a Bad Response type. This is used to
/// simulate a bad response error when fetching remote data.
DioException badResponse(Response response) {
  final dioError = DioException(
    requestOptions: response.requestOptions,
    error: response.statusMessage,
    type: DioExceptionType.badResponse,
    response: response,
  );
  return dioError;
}

Widget displayErrorWidget(BuildContext context, Failure failure) {
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
      ],
    ),
  ));
}

Center displayLoadingWidget({String loadingMsg = "loading..."}) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const CircularProgressIndicator.adaptive(),
      Text(
        loadingMsg,
        textAlign: TextAlign.center,
        style: TextStyles.font16SemiBold,
      ),
    ],
  ));
}

/// displaying a customized snackbar
void displaySnackBar(
  BuildContext context,
  String msg, {
  bool hasError = false,
}) {
  final theme = context.theme;
  final snackBar = SnackBar(
    content: Text(
      msg,
      style: theme.textTheme.bodyMedium,
    ),
    margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: hasError ? theme.appColors.error : theme.appColors.primary,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
