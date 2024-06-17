import 'package:flutter/material.dart';

class StatusManager {
  static Color getColor(String? status) {
    switch (status) {
      case "EM_ABERTO":
        return const Color.fromARGB(255, 255, 119, 7);
      case "EM_PRODUCAO":
        return const Color.fromARGB(255, 218, 255, 7);
      case "FINALIZADO":
        return const Color.fromARGB(255, 89, 131, 94);
      case "CANCELADO":
        return const Color.fromARGB(255, 192, 49, 49);
      default:
        return Colors.grey;
    }
  }

  static int getStep(String? status) {
    switch (status) {
      case "EM_ABERTO":
        return 1;
      case "EM_PRODUCAO":
        return 2;
      case "FINALIZADO":
        return 3;
      case "CANCELADO":
        return 3;
      default:
        return 0;
    }
  }

  static Widget getDescr(String? status) {
    switch (status) {
      case "EM_ABERTO":
        return const Text("EA");
      case "EM_PRODUCAO":
        return const Text("EP");
      case "FINALIZADO":
        return const Icon(
          Icons.check,
          color: Color.fromARGB(255, 89, 131, 94),
        );
      case "CANCELADO":
        return const Icon(
          Icons.close,
          color: Color.fromARGB(255, 192, 49, 49),
        );
      default:
        return const Text("EA");
    }
  }
}
