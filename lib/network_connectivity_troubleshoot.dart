library network_connectivity_troubleshoot;

import 'dart:io';
import 'package:flutter/material.dart';

class CheckInternetConnectivity {
  void checkInternetAndProceed(BuildContext context,
      {double? imageSize,
      bool? enableDrag,
      Color? barrierColor,
      bool? isDismissible,
      double? sheetTopRightRadius,
      double? sheetTopLeftRadius,
      double? sheetWidth,
      double? sheetHeight,
      Color? sheetColor,
      required String title,
      required String buttonText,
      Color? buttonBackgroundColor,
      Color? buttonTextColor}) async {
    bool flagConnected = false;
    try {
      final result =
          await InternetAddress.lookup('www.google.com').timeout(const Duration(
        seconds: 5,
      ));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // when connected

        flagConnected = true;
      }
    } catch (_) {
      print(_);
    }
    if (flagConnected) {
      print("internet available");
    } else {
      // when no internet
      _onNoInternet(context,
          imageSize: imageSize,
          enableDrag: enableDrag,
          barrierColor: barrierColor,
          isDismissible: isDismissible,
          sheetTopRightRadius: sheetTopRightRadius,
          sheetTopLeftRadius: sheetTopLeftRadius,
          sheetWidth: sheetWidth,
          sheetHeight: sheetHeight,
          sheetColor: sheetColor,
          title: title,
          buttonText: buttonText,
          buttonBackgroundColor: buttonBackgroundColor,
          buttonTextColor: buttonTextColor);
    }
  }

  void _onNoInternet(BuildContext context,
      {double? imageSize,
      bool? enableDrag,
      Color? barrierColor,
      bool? isDismissible,
      double? sheetTopRightRadius,
      double? sheetTopLeftRadius,
      double? sheetWidth,
      double? sheetHeight,
      Color? sheetColor,
      required String title,
      required String buttonText,
      Color? buttonBackgroundColor,
      Color? buttonTextColor}) {
    // print("#showModalBottomSheet");
    showModalBottomSheet<void>(
      clipBehavior: Clip.hardEdge,
      isDismissible: isDismissible ?? false,
      barrierColor: barrierColor ?? Colors.grey.withOpacity(0.3),
      context: context,
      enableDrag: enableDrag ?? false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sheetTopRightRadius ?? 0.0),
          topRight: Radius.circular(sheetTopRightRadius ?? 0.0),
        ),
      ),
      builder: (builderContext) => _buildNoInternetWgt(context, builderContext,
          imageSize: imageSize,
          enableDrag: enableDrag,
          barrierColor: barrierColor,
          isDismissible: isDismissible,
          sheetTopLeftRadius: sheetTopLeftRadius,
          sheetTopRightRadius: sheetTopRightRadius,
          sheetWidth: sheetWidth,
          sheetHeight: sheetHeight,
          sheetColor: sheetColor,
          title: title,
          buttonText: buttonText,
          buttonBackgroundColor: buttonBackgroundColor,
          buttonTextColor: buttonTextColor),
    );
  }

  Widget _buildNoInternetWgt(BuildContext context, BuildContext builderContext,
      {double? imageSize,
      bool? enableDrag,
      Color? barrierColor,
      bool? isDismissible,
      double? sheetTopLeftRadius,
      double? sheetTopRightRadius,
      double? sheetWidth,
      double? sheetHeight,
      Color? sheetColor,
      required String title,
      required String buttonText,
      Color? buttonBackgroundColor,
      Color? buttonTextColor}) {
    // print("#buildNoInternetWgt");
    const imgSize = 200.0;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      color: sheetColor ?? Colors.white,
      height: sheetHeight ?? MediaQuery.of(context).size.height / 2.5,
      //padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            width: imageSize ?? imgSize,
            height: imageSize ?? imgSize,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'packages/network_connectivity_troubleshoot/assets/images/no_internet.png'))),
          ),

          // Image.asset(
          //   'assets/images/no_internet.png',
          //   width: imageSize ?? imgSize,
          //   height: imageSize ?? imgSize,
          // ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(builderContext);
              checkInternetAndProceed(
                context,
                imageSize: imageSize,
                enableDrag: enableDrag,
                barrierColor: barrierColor,
                isDismissible: isDismissible,
                sheetTopLeftRadius: sheetTopLeftRadius,
                sheetTopRightRadius: sheetTopRightRadius,
                title: title,
                sheetWidth: sheetWidth,
                sheetHeight: sheetHeight,
                buttonText: buttonText,
                buttonTextColor: buttonTextColor,
                buttonBackgroundColor: buttonBackgroundColor,
              );
            },
            style: ElevatedButton.styleFrom(
              primary: buttonBackgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(buttonText),
            ),
          )
        ],
      ),
    );
  }
}
