import 'package:busyatra/helpers/colors.dart';
import 'package:busyatra/services/ticketOrderingService.dart';
import 'package:busyatra/widgets/buttomBar.dart';
import 'package:busyatra/widgets/roundButton.dart';
import 'package:busyatra/widgets/subtotalWidget.dart';
import 'package:busyatra/widgets/ticketSelectionTypes.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class TicketSelectionPage extends StatelessWidget {
  static const String idScreen ="ticketSelectionPage";
  @override
  Widget build(BuildContext context) {
      return Scaffold();                 
                      
                      // ticket row title
                     
                       // ignore: dead_code
                       Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.confirmation_num, color: BusColors.MAIN_RED, size: 40),
                              SizedBox(width: 10),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: 'How many tickets? ',
                                        style: TextStyle(color: Colors.white, fontSize: 30)
                                    ),
                                    TextSpan(text: '(max. 15)',
                                        style: TextStyle(color: Colors.white, fontSize: 20)
                                    ),
                                  ]
                                )
                              ) 
                            ],
                      );
                      
                      SizedBox(height: 40);
                      
                      // ticket selection type widget
                      TicketSelectionTypes();
                      
                      // subtotal widget (reusable)
                      SubTotalWidget();
                    
                  
                
              
              
              // common bottom bar, with the ability
              // to inject custom buttons in its layout for flexible navigation
              BottomBar(
                optionalButton: Consumer<TicketOrderingService>(
                  builder: (context, tService, child) {
                    return tService.getTotalNumberOfTickets() > 0 ? RoundButton(
                      label: 'SELECT SEATS',
                      onTap: () {
                        // proceed to the seats selection page
                        Navigator.of(context).pushNamed('/seatselection');
                      }) : SizedBox(width: 0);
                  }
              ),
              );
            
      
    
  }

}