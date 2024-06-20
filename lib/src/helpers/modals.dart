import 'package:flutter/material.dart';

enum ModalDirection { left, right, top, bottom }

class KModal {
  static Future<dynamic> show({
    required Widget body,
    required BuildContext context,
    double? width,
    double? height,
    String barrierLabel = "Modal",
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x66000000),
    double sheetBorderRadius = 0,
    Color sheetColor = Colors.white,
    Duration transitionDuration = const Duration(milliseconds: 300),
    ModalDirection direction = ModalDirection.right,
  }) async {
    dynamic data = await _showSheetSide(
      body: body,
      width: width,
      height: height,
      direction: direction,
      context: context,
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      sheetBorderRadius: sheetBorderRadius,
      sheetColor: sheetColor,
      transitionDuration: transitionDuration,
    );
    if (data == null) return '';
    return data;
  }

  static _showSheetSide({
    required Widget body,
    required ModalDirection direction,
    double? width,
    double? height,
    required BuildContext context,
    required String barrierLabel,
    required bool barrierDismissible,
    required Color barrierColor,
    required double sheetBorderRadius,
    required Color sheetColor,
    required Duration transitionDuration,
  }) {
    BorderRadius borderRadius = BorderRadius.only(
      topLeft: direction == ModalDirection.right ||
              direction == ModalDirection.bottom
          ? Radius.circular(sheetBorderRadius)
          : Radius.zero,
      topRight:
          direction == ModalDirection.left || direction == ModalDirection.bottom
              ? Radius.circular(sheetBorderRadius)
              : Radius.zero,
      bottomLeft:
          direction == ModalDirection.right || direction == ModalDirection.top
              ? Radius.circular(sheetBorderRadius)
              : Radius.zero,
      bottomRight:
          direction == ModalDirection.left || direction == ModalDirection.top
              ? Radius.circular(sheetBorderRadius)
              : Radius.zero,
    );

    return showGeneralDialog(
      barrierLabel: barrierLabel,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: _getAlignment(direction),
          child: Material(
            elevation: 15,
            color: Colors.transparent,
            borderRadius: borderRadius,
            child: Container(
              decoration: BoxDecoration(
                color: sheetColor,
                borderRadius: borderRadius,
              ),
              height: _getHeight(direction, context, width, height),
              width: _getWidth(direction, context, width, height),
              child: body,
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        var begin = _getOffset(direction);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Alignment _getAlignment(ModalDirection direction) {
    switch (direction) {
      case ModalDirection.right:
        return Alignment.centerRight;
      case ModalDirection.left:
        return Alignment.centerLeft;
      case ModalDirection.top:
        return Alignment.topCenter;
      case ModalDirection.bottom:
        return Alignment.bottomCenter;
    }
  }

  static double _getHeight(ModalDirection direction, BuildContext context,
      double? width, double? height) {
    if (direction == ModalDirection.top || direction == ModalDirection.bottom) {
      return height ?? MediaQuery.of(context).size.height * 0.3;
    }
    return double.infinity;
  }

  static double _getWidth(ModalDirection direction, BuildContext context,
      double? width, double? height) {
    // if (direction == ModalDirection.left || direction == ModalDirection.right) {
    //   return width ?? MediaQuery.of(context).size.width * 0.3;
    // }
    return double.infinity;
  }

  static Offset _getOffset(ModalDirection direction) {
    switch (direction) {
      case ModalDirection.right:
        return const Offset(1.0, 0.0);
      case ModalDirection.left:
        return const Offset(-1.0, 0.0);
      case ModalDirection.top:
        return const Offset(0.0, -1.0);
      case ModalDirection.bottom:
        return const Offset(0.0, 1.0);
    }
  }
}
