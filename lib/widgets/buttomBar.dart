import 'package:busyatra/map/map.dart';
import 'package:busyatra/services/seatSelectionService.dart';
import 'package:busyatra/services/ticketOrderingService.dart';
import 'package:busyatra/widgets/roundButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BottomBar extends StatelessWidget {

  Widget optionalButton;

  BottomBar({ this.optionalButton });

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    TicketOrderingService ticketOrderingService = Provider.of<TicketOrderingService>(context, listen: false);
    SeatSelectionService seatService = Provider.of<SeatSelectionService>(context, listen: false);
    
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundButton(
              isBackButton: true,
              label: 'BACK',
             onTap: () {
               Navigator.pushNamedAndRemoveUntil(context, Maps.idScreen, (route) => false);
              }
            ),
             Row(
              children: [
                this.optionalButton != null ? this.optionalButton : SizedBox(width: 0),
                SizedBox(width: 20),
                RoundButton(
                label: 'PAY',
                onTap: () {
                            if (_formKey.currentState.validate()) {
                              calculate();
                                                          }
                                              
                                            
                                              }
                                          ),
                                          Row(
                                            children: [
                                              this.optionalButton != null ? this.optionalButton : SizedBox(width: 0),
                                              SizedBox(width: 20),
                                              RoundButton(
                                              label: 'QUIT',
                                              onTap: () {
                                                ticketOrderingService.resetOrder();
                                                seatService.resetSeatSelection();
                                                Navigator.of(context).popUntil((route) => route.settings.name == '/home');
                                              }
                                            ),
                                            ],
                                          )
                                        ],
                                      )
                                        ]
                                      )
                                    );
                                }
                              
                              }
                              
                              void calculate() {
}