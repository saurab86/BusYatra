import 'package:busyatra/helpers/TicketsType.dart';

class Utils {
  static String getStringFromTicketType(TicketType type) {

    switch(type) {
      case TicketType.Adult:
        return 'ADULT';
      case TicketType.Child:
        return 'CHILD 2-12 yrs';
      case TicketType.Senior:
        return 'SENIOR';
      default:
        return 'NONE';
    }
  }
}