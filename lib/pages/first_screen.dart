import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_in.dart';

class FirstScreen extends StatelessWidget {
  final kPrimaryColor = Color(0xFF6F35A5);
  final kPrimaryLightColor = Color(0xFFF1E6FF);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                imageUrl,
              ),
              radius: 60,
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 40),
            Text(
              'Welcome Back',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor),
            ),
            Text(
              email,
              style: TextStyle(
                  fontSize: 25,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            // ignore: deprecated_member_use
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
                    signOutGoogle();
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
      )),
    );
  }
}
