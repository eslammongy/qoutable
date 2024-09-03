import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotable/core/constant/constant.dart';

abstract class ImageCapture {
  /// Captures the current widget's render as a PNG image and saves it to the device's document directory as "screenshot.png".
  /// Returns a [Future] that resolves when the image has been saved. If an error occurs, it is logged to the console.
  static Future<void> captureAsPng(
      BuildContext context, GlobalKey quoteAnimatedBoxKey) async {
    try {
      if (quoteAnimatedBoxKey.currentContext == null) {
        displaySnackBar(
            context, hasError: true, "The widget's context is not available.");
        return;
      }

      RenderRepaintBoundary? boundary = quoteAnimatedBoxKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        displaySnackBar(
            context, hasError: true, "Failed to find RenderRepaintBoundary.");
        return;
      }

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null && context.mounted) {
        displaySnackBar(
            context, hasError: true, "Failed to convert image to PNG.");
        return;
      }
      if (!context.mounted) return;
      await _saveImageLocally(byteData!, context);
    } catch (e) {
      if (!context.mounted) return;
      displaySnackBar(context, hasError: true, "Error: $e");
    }
  }

  static Future<void> _saveImageLocally(
      ByteData byteData, BuildContext context) async {
    final pngBytes = byteData.buffer.asUint8List();

    // Get the platform-specific directory
    final directory = Platform.isAndroid
        ? Directory('/storage/emulated/0/Pictures/$kAppName')
        : await getApplicationDocumentsDirectory();

    // Create directory if not exists (Android only, iOS doesn't need this for Documents)
    if (Platform.isAndroid) {
      await directory.create(recursive: true);
    }

    // Define the file path and save the image
    final imgFile = File('${directory.path}/quote${pngBytes.length}.png');

    try {
      await imgFile.writeAsBytes(pngBytes);
      if (context.mounted) {
        displaySnackBar(context, "File Saved: $imgFile");
      }
    } catch (e) {
      if (context.mounted) {
        displaySnackBar(context, "Failed to save image: $e");
      }
    }
  }
}
