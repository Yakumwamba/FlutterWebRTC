import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key key,
  }) : super(key: key);



  void navigate_to_home(BuildContext context)  {
 

         
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Container(
              height: 50,
              child: FacebookSignInButton(onPressed: () {
                navigate_to_home(context);
                //debugPrint("Clicked on it just now");
              }, borderRadius: 8.0 , textStyle: TextStyle(
                fontWeight: FontWeight.normal, 
                fontSize: 20, 
                color: Colors.white
                )),
              
            ),
            SizedBox(  height: 10),
            Container(
              height: 50,
              child: GoogleSignInButton(textStyle: TextStyle(fontWeight: FontWeight.normal, 
              fontSize: 20), 
              onPressed: () {}, borderRadius: 8.0 )
              
              ),
            SizedBox(  height: 30),
            Center(
              child: Container(
                width: 150,
                child: Column(
                  children: [
                    Opacity(
                      opacity: 0.4,
                                        child: Text("By continuing you agree with our", 
                      style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.white
                ),   textAlign: TextAlign.center, ),
                    ),
                     Opacity(
                      opacity: 0.6,
                                        child: Text("Terms and Conditions", 
                      style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                ),   textAlign: TextAlign.center, ),
                    ),
            
                  ],
                ),
              ),
            ),
          ],),
        ),
      
      ],
    );
  }


}