import 'package:busyatra/helpers/colors.dart';
import 'package:busyatra/Models/seatModel.dart';
import 'package:busyatra/services/seatSelectionService.dart';
import 'package:busyatra/services/ticketOrderingService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedSeatsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    TicketOrderingService ticketService = Provider.of<TicketOrderingService>(context, listen: false);

    return Consumer<SeatSelectionService>(
      builder: (context, seatSelection, child) {

        List<Widget> selectedSeatsWidgets = [];

        seatSelection.selectedSeats.forEach((Seat seat) {
          selectedSeatsWidgets.add(
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: BusColors.MAIN_PINK
              ),
              width: 50,
              height: 50,
              child: Text(seat.seatLabel,
                style: TextStyle(color: Colors.white, fontSize: 20)
              )
            )
          );
        });

        return Visibility(
          visible: selectedSeatsWidgets.length > 0,
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 40),
            decoration: BoxDecoration(
              color: BusColors.MAIN_PINK.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50)
            ),
            child: Row(
              children: [
                Text('Selected Seats ' + '(' + '${selectedSeatsWidgets.length} of ${ticketService.getTotalNumberOfTickets()})',
                  style: TextStyle(color: Colors.white, fontSize: 20)
                ),
                SizedBox(width: 100),
                Row(children: selectedSeatsWidgets)
              ],
            )
          )
        );
      }
    );
  }

}