import 'dart:async';
import 'package:busyatra/helpers/colors.dart';
import 'package:busyatra/services/seatSelectionService.dart';
import 'package:busyatra/services/ticketOrderingService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CheckoutTimer extends StatefulWidget {

  Function onTimerDone;
  int seconds;

  CheckoutTimer({
    this.seconds = 10,
    @required this.onTimerDone
  });

  @override
  _CheckoutTimerState createState() => _CheckoutTimerState();
}

class _CheckoutTimerState extends State<CheckoutTimer> {

  Timer checkoutTimer;
 
  @override
  Widget build(BuildContext context) {

    TicketOrderingService ticketOrderingService = Provider.of<TicketOrderingService>(context, listen: false);
    SeatSelectionService seatService = Provider.of<SeatSelectionService>(context, listen: false);

    checkoutTimer = new Timer(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {

          if (widget.seconds == 0) {
            widget.onTimerDone();
            checkoutTimer.cancel();
            ticketOrderingService.resetOrder();
            seatService.resetSeatSelection();
            return;
          }

          widget.seconds--;
        });
      }
    });
    
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 100),
      child: Stack(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              valueColor: new AlwaysStoppedAnimation<Color>(BusColors.MAIN_RED),
            ),
          ),
          Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: BusColors.MAIN_RED,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Text('${widget.seconds.toString()}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 40)
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    checkoutTimer.cancel();
  }
}