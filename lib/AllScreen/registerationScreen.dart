
import 'package:busyatra/AllScreen/loginScrenn.dart';
import 'package:busyatra/AllWidgets/progressDialog.dart';
import 'package:busyatra/map/map.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../main.dart';

class RegisterationScreen extends StatelessWidget 
{
  static const String idScreen ="register";
  final TextEditingController nameTextEditingController= TextEditingController();
  final TextEditingController emailTextEditingController= TextEditingController();
  final TextEditingController phoneTextEditingController= TextEditingController();
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
                "Register",
                style: TextStyle(fontSize: 24.0, fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 1.0,),
                    TextField(
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Name",
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
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
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
                            "Create Account",
                            style: TextStyle(fontSize: 18.0, fontFamily: "Band Bold"),
                          ),
                        ),
                        ),
                        
                        onPressed: ()
                        {
                          if (nameTextEditingController.text.length< 3)
                          {
                           displayToastMessage("Name must be atleast 3 character.", context);
                          } 
                          else if(!emailTextEditingController.text.contains("@"))
                          {
                            displayToastMessage("Email adress is not valid.", context);
                          }
                          else if(phoneTextEditingController.text.isEmpty)
                          {
                            displayToastMessage("Phone Number is mandatory.", context);
                          }
                          else if(passwordTextEditingController.text.length < 6 )
                          {
                            displayToastMessage("Password must be atleast 6 characters", context);
                          }
                          else
                          {
                          registerNewUser(context);
                          }
                        },
                    ),
                  ],
                ),
              ),
               TextButton(
                 onPressed: ( )
                 {
                   Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
                 },
                 child: Text(
                   "Already have an Account? Login Here.",
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }
  final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async
  {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context)
      {
        return ProgressDialog(message: "Registering, Please wait..",);
      }
    );
    final User firebaseUser= (await _firebaseAuth
     .createUserWithEmailAndPassword( 
       email: emailTextEditingController.text,
       password: passwordTextEditingController.text
       ).catchError(( errMsg){
         Navigator.pop(context);
         displayToastMessage("Error:" + errMsg.toString(), context);
       })).user; 

       if (firebaseUser !=null) //user created
       {
         // save usser to database
         
         Map userDataMap = {
           "name": nameTextEditingController.text.trim(),
           "email": emailTextEditingController.text.trim(),
           "phone": phoneTextEditingController.text.trim(),
         };
         usersRef.child(firebaseUser.uid).set(userDataMap);
        displayToastMessage("congratulation, your account have been created.", context);
        Navigator.pushNamedAndRemoveUntil(context, Maps.idScreen, (route) => false);
       }
       else
       {
         Navigator.pop(context);
         //error occured- display error message
         displayToastMessage("New user has not been created.", context);
       }
  }
}
displayToastMessage(String message,BuildContext context)
{
  Fluttertoast.showToast(msg: message);                       
}