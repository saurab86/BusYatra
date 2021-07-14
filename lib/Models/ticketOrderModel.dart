import 'package:busyatra/helpers/TicketsType.dart';
import 'package:busyatra/Models/ticketModel.dart';

class TicketOrderModel {
  List<TicketModel> tickets;

  TicketOrderModel() {
    tickets = [];
    tickets.add(TicketModel(
      type: TicketType.Adult,
      amount: 0,
      price: 13.69
    ));
    tickets.add(TicketModel(
      type: TicketType.Child,
      amount: 0,
      price: 10.69
    ));
    tickets.add(TicketModel(
      type: TicketType.Senior,
      amount: 0,
      price: 12.19
    ));
  }
}