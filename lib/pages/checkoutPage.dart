import 'package:busyatra/helpers/logo.dart';
import 'package:busyatra/widgets/buttomBar.dart';
import 'package:busyatra/widgets/circleButton.dart';
import 'package:busyatra/widgets/checkoutTimer.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static const String idScreen ="checkoutPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // whole middle section
          Expanded(
            child: Container(
              child: Column(
                children: [

                  // timer widget
                  CheckoutTimer(
                    seconds: 10, // number of seconds before the onTimeDone will be called
                    onTimerDone: () {
                      Navigator.of(context).popUntil((route) => route.settings.name == '/home');
                    },
                  ),

                  // friendly content
                  Text('Order will be cancelled in a few moments.\nPlease use the PIN Pad to complete your order',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25)
                  ),
                  Container(
                    margin: EdgeInsets.all(40),
                    child: Icon(BusIcon.handCard, color: Colors.white, size: 250),
                  ),
                  Text('To pay with credit card or AMC Gift Card,\nfollow directions on the PIN Pad to complete transaction',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25)
                  ),
                  SizedBox(height: 50),

                  // cancel custom circle button
                  CircleButton(
                    label: 'Cancel',
                    icon: Icons.clear,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            )
          ),

          // common bottom nav bar
          BottomBar()
        ]
      )
    );
  }

}