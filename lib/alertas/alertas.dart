import 'package:flutter/material.dart';
import 'package:proyecto/alertas/palette_colors.dart';

SnackBar successToastAlertDialog(
  String message, {
  bool bottomMargin = false,
}) =>
    SnackBar(
      padding: const EdgeInsets.all(10),
      content: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Palette.blackPrimary.withAlpha(40),
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                    blurStyle: BlurStyle.normal,
                  )
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Palette.greenToastBackgroundDegrade1,
                    Palette.greenToastBackgroundDegrade2,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.check_circle,
                    color: Palette.whitePrimary,
                    size: 35,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Palette.blackPrimary,
                  fontFamily: 'Montserrat',
                  fontSize: 13.5,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Palette.greenToastBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color:
              Palette.greenToastColorLinea, // Cambiamos el color del contorno
          width: 1.5, // Ancho del contorno
        ),
      ),
      duration: const Duration(seconds: 6),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.startToEnd,
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: bottomMargin ? 90 : 20,
      ),
    );

SnackBar errorToastAlertDialog(
  String message, {
  bool bottomMargin = false,
}) =>
    SnackBar(
      padding: const EdgeInsets.all(10),
      content: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Palette.blackPrimary.withAlpha(40),
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                    blurStyle: BlurStyle.normal,
                  )
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Palette.redToastBackgroundDegrade1,
                    Palette.redToastBackgroundDegrade2,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.warning_rounded,
                    color: Palette.whitePrimary,
                    size: 35,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Palette.blackPrimary,
                  fontFamily: 'Montserrat',
                  fontSize: 13.5,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Palette.redToastBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Palette.redToastColorLinea, // Cambiamos el color del contorno
          width: 1.5, // Ancho del contorno
        ),
      ),
      duration: const Duration(seconds: 6),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.startToEnd,
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: bottomMargin ? 90 : 20,
      ),
    );

SnackBar informationToastAlertDialog(
  String message, {
  bool bottomMargin = false,
}) =>
    SnackBar(
      padding: const EdgeInsets.all(10),
      content: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Palette.blackPrimary.withAlpha(40),
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                    blurStyle: BlurStyle.normal,
                  )
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Palette.blueToastBackgroundDegrade1,
                    Palette.blueToastBackgroundDegrade2,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.info_sharp,
                    color: Palette.whitePrimary,
                    size: 35,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Palette.blackPrimary,
                  fontFamily: 'Montserrat',
                  fontSize: 13.5,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Palette.blueToastBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Palette.blueToastColorLinea, // Cambiamos el color del contorno
          width: 1.5, // Ancho del contorno
        ),
      ),
      duration: const Duration(seconds: 6),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.startToEnd,
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: bottomMargin ? 90 : 20,
      ),
    );

SnackBar warningToastAlertDialog(
  String message, {
  bool bottomMargin = false,
}) =>
    SnackBar(
      padding: const EdgeInsets.all(10),
      content: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Palette.blackPrimary.withAlpha(40),
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                    blurStyle: BlurStyle.normal,
                  )
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Palette.orangeToastBackgroundDegrade1,
                    Palette.orangeToastBackgroundDegrade2,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.warning_rounded,
                    color: Palette.whitePrimary,
                    size: 35,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Palette.blackPrimary,
                  fontFamily: 'Montserrat',
                  fontSize: 13.5,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Palette.orangeToastBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color:
              Palette.orangeToastColorLinea, // Cambiamos el color del contorno
          width: 1.5, // Ancho del contorno
        ),
      ),
      duration: const Duration(seconds: 6),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.startToEnd,
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: bottomMargin ? 90 : 20,
      ),
    );
