import 'package:busyatra/helpers/colors.dart';
import 'package:busyatra/Models/seatModel.dart';
import 'package:busyatra/services/seatSelectionService.dart';
import 'package:busyatra/services/ticketOrderingService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SeatWidget extends StatelessWidget {

  Seat seat;
  int seatRowIndex;

  SeatWidget({ this.seat, this.seatRowIndex });
  
  @override
  Widget build(BuildContext context) {
    
    SeatSelectionService seatSelection = Provider.of<SeatSelectionService>(context, listen: false);
    TicketOrderingService ticketService = Provider.of<TicketOrderingService>(context, listen: false);
    
    Color seatColor = seat.isSelected ? BusColors.MAIN_PINK :
      (seatRowIndex == seatSelection.auditorium.accessibleRow ? BusColors.ACCESSIBLESEAT : BusColors.MAIN_DARK_RED);

    return GestureDetector(
      onTap: () {
        if (seatSelection.selectedSeats.length < ticketService.getTotalNumberOfTickets()) {
          seatSelection.selectSeat(seat);
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                color: seatColor,
                width: 15,
                height: 40,
                margin: EdgeInsets.only(right: 1)
              ),
              Container(
                alignment: Alignment.center,
                color: seatColor,
                width: 35,
                height: 35,
                child: seatRowIndex == seatSelection.auditorium.accessibleRow ?
                Icon(Icons.accessible, color: Colors.white) : 
                Text(seat.seatLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)
                ) 
              ),
              Container(
                color: seatColor,
                width: 15,
                height: 40,
                margin: EdgeInsets.only(left: 1)
              )
            ],
          )
      ),
    );
  }

}