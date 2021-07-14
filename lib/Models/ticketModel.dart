import 'package:busyatra/helpers/TicketsType.dart';

class TicketModel {

  TicketType type;
  int amount;
  double price;

  TicketModel({ this.type, this.amount, this.price });
}