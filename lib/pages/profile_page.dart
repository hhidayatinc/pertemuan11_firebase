import 'package:firebase/pages/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  //  ProfilePage({
  //   Key key,
  //   this.user,
  // }) : super (key: key);

  // final User user;
  final kPrimaryColor = Color(0xFF6F35A5);
  final kPrimaryLightColor = Color(0xFFF1E6FF);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 80, 20, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Hello.",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      fontSize: 48),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Divider(
                    color: kPrimaryColor,
                    thickness: 3,
                  ),
                ),
                SizedBox(height: 60),
              ],
            ),
            Text(
              "Welcome Back",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 3,
                  fontSize: 36),
            ),
            // SizedBox(height: 70),
            // Text(
            //   user.email,
            //   style: TextStyle(
            //       color: kPrimaryColor,
            //       fontWeight: FontWeight.bold,
            //       letterSpacing: 1.5,
            //       fontSize: 36),
            // ),
            SizedBox(height: 300),
            Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              width: size.width * 0.8,
              
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                // ignore: deprecated_member_use
                child: FlatButton(
                  
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: kPrimaryColor,
                  onPressed: () {
                    signOutEmail();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }), ModalRoute.withName('/'));
                  },
                  child: Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
