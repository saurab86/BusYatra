
import 'package:busyatra/AllScreen/registerationScreen.dart';
import 'package:busyatra/AllWidgets/progressDialog.dart';
import 'package:busyatra/map/map.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


import '../main.dart';

class LoginScreen extends StatelessWidget
 {
    static const String idScreen ="login";
   final TextEditingController emailTextEditingController= TextEditingController();
    final TextEditingController passwordTextEditingController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 35.0,),
              Image(
                image: AssetImage("images/logo.png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(height: 1.0,),
              Text(
                "Login",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    
                    SizedBox(height: 1.0,),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                       SizedBox(height: 1.0,),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Pasword",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    
                    SizedBox(height: 10.0,),
                    ElevatedButton(
                     
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 18.0, fontFamily: "Band Bold"),
                          ),
                        ),
                        ),
                        
                        onPressed: ()
                        {
                          if(!emailTextEditingController.text.contains("@"))
                          {
                            displayToastMessage("Email adress is not valid.", context);
                          }
                          if(passwordTextEditingController.text.isEmpty )
                          {
                            displayToastMessage("Please enter password", context);
                          }
                          else
                          {
                            loginAndAuthenticateUser(context);
                          }
                        },
                    ),
                  ],
                ),
              ),
               TextButton(
                 onPressed: ( )
                 {
                   Navigator.pushNamedAndRemoveUntil(context, RegisterationScreen.idScreen, (route) => false);
                 },
                 child: Text(
                   "Do not have an Account? Register Here.",
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async
  {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context)
      {
        return ProgressDialog(message: "Authenticating, Please wait..",);
      }
    );
    final User firebaseUser= (await _firebaseAuth
     .signInWithEmailAndPassword( 
       email: emailTextEditingController.text,
       password: passwordTextEditingController.text
       ).catchError(( errMsg){
         Navigator.pop(context);
         displayToastMessage("Error:" + errMsg.toString(), context);
       })).user;
       if (firebaseUser !=null) //user created
       {
         usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap){
           if (snap.value !=null)
           {
              Navigator.pushNamedAndRemoveUntil(context, Maps.idScreen, (route) => false);
              displayToastMessage("You are logged in.", context);
           }
           else
           {
              Navigator.pop(context);
             _firebaseAuth.signOut();
             displayToastMessage("No record exits for this user. Please create new account", context);

           }
         });  
        }
        else
        {
           Navigator.pop(context);
          //error occured- display error message
          displayToastMessage("Error occured, can not sign in .", context);
        }
  }
}