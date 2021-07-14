import 'package:busyatra/pages/checkoutPage.dart';
import 'package:busyatra/pages/seatSelectionPage.dart';
import 'package:busyatra/pages/ticketSelectionPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AllScreen/loginScrenn.dart';
import 'AllScreen/registerationScreen.dart';
import 'DataHandler/appData.dart';
import 'map/map.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppData(),
        child: MaterialApp(
        title: 'Yatra',
        theme: ThemeData(
          fontFamily: "Band Bold",
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: LoginScreen.idScreen,
        routes: 
        {
          
          RegisterationScreen.idScreen: (context) => RegisterationScreen(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          Maps.idScreen: (context) => Maps(),
          TicketSelectionPage.idScreen: (context) => TicketSelectionPage(),
          SeatSelectionPage.idScreen: (context) => SeatSelectionPage(),
          CheckoutPage.idScreen: (context) => CheckoutPage(),
          
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

