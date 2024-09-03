import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/core/error/api_failure.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:quotable/core/error/api_error_msg.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_decorated_box.dart';

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
  bool isFailState = true,
}) {
  final theme = context.theme;
  final snackBar = SnackBar(
    content: Text(
      msg,
      style: theme.textTheme.bodyMedium,
    ),
    margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor:
        isFailState ? theme.appColors.error : theme.appColors.primary,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

/// Captures the current widget's render as a PNG image and saves it to the device's document directory as "screenshot.png".
/// Returns a [Future] that resolves when the image has been saved. If an error occurs, it is logged to the console.
Future<void> captureWidgetAsPng(
    BuildContext context, GlobalKey quoteAnimatedBoxKey) async {
  try {
    // Ensure that the widget's context is available
    if (quoteAnimatedBoxKey.currentContext == null) {
      displaySnackBar(context, "The widget's context is not available.");
      return;
    }
    RenderRepaintBoundary? boundary = quoteAnimatedBoxKey.currentContext!
        .findRenderObject() as RenderRepaintBoundary?;
    // Ensure the RenderRepaintBoundary is not null
    if (boundary == null) {
      displaySnackBar(context, "Failed to find RenderRepaintBoundary.");
      return;
    }
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null && context.mounted) {
      displaySnackBar(context, "Failed to convert image to PNG.");
      return;
    }
    if (!context.mounted) return;
    await _saveImageLocally(byteData, context);
  } catch (e) {
    if (!context.mounted) return;
    displaySnackBar(context, "Error: $e");
  }
}

Future<void> _saveImageLocally(ByteData? byteData, BuildContext context) async {
  final pngBytes = byteData!.buffer.asUint8List();

  // Get the Pictures directory
  final directory = await getExternalStorageDirectory();
  final picturesDir = Directory('${directory!.path}/Pictures');

  // Create a directory with the app's name
  final appDir = Directory('${picturesDir.path}/$kAppName');
  await appDir.create(recursive: true);

  // Define the file path and save the image
  final quote = 'quote${pngBytes.offsetInBytes}';
  final imgFile = File('${appDir.path}/$quote.png');

  await imgFile.writeAsBytes(pngBytes).whenComplete(() {
    if (!context.mounted) return;
    debugPrint("File Saved: $imgFile");
    displaySnackBar(context, "File Saved: $imgFile");
  });
}
