import 'dart:ui';

enum NewsStatus { closed, responsed, pendingResponse, unknown }

extension NewsStatusExtension on NewsStatus {
  String get rawValue {
    switch (this) {
      case NewsStatus.closed:
        return "closed";
      case NewsStatus.pendingResponse:
        return "pending response";
      case NewsStatus.responsed:
        return "responded";
      case NewsStatus.unknown:
        return "unknown";
      default:
        return "n/a";
    }
  }

  Color get foregroundColor {
    switch (this) {
      case NewsStatus.closed:
        return const Color.fromARGB(255, 203, 236, 208);
      case NewsStatus.responsed:
        return const Color.fromARGB(255, 181, 231, 244);
      case NewsStatus.pendingResponse:
        return const Color.fromARGB(255, 236, 214, 203);
      default:
        return const Color.fromARGB(255, 255, 255, 255);
    }
  }

  Color get backgroundColor {
    switch (this) {
      case NewsStatus.closed:
        return const Color.fromARGB(255, 48, 200, 71);
      case NewsStatus.responsed:
        return const Color.fromARGB(255, 20, 133, 161);
      case NewsStatus.pendingResponse:
        return const Color.fromARGB(255, 200, 66, 48);
      default:
        return Color.fromARGB(255, 255, 255, 255);
    }
  }
}
