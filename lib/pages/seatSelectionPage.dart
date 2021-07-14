import 'package:busyatra/services/seatSelectionService.dart';
import 'package:busyatra/services/ticketOrderingService.dart';
import 'package:busyatra/widgets/buttomBar.dart';
import 'package:busyatra/widgets/roundButton.dart';
import 'package:busyatra/widgets/seatSelectionGrid.dart';
import 'package:busyatra/widgets/subtotalWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeatSelectionPage extends StatelessWidget {
  static const String idScreen ="seatSelectionPage";
  @override
  Widget build(BuildContext context) {

    TicketOrderingService ticketService = Provider.of<TicketOrderingService>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // header
          
                  // seat selection grid widget
                  SeatSelectionGrid(),

                  // subtotal widget (reusable)
                  SubTotalWidget()
                ],
              ),
            );
          

          // custom bottom nav bar, with another injected button widget
          // for navigating to checkout page
          // ignore: dead_code
          BottomBar(
            optionalButton: Consumer<SeatSelectionService>(
              builder: (context, seatService, child) {
                return seatService.selectedSeats.length == ticketService.getTotalNumberOfTickets() ? RoundButton(
                  label: 'CHECKOUT',
                  onTap: () {
                    // proceed to the seats selection page
                    Navigator.of(context).pushNamed('/checkout');
                  }) : SizedBox(width: 0);
              }
          ),
          );
        
      
    
  }


}