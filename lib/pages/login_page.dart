import 'package:firebase/pages/profile_page.dart';
import 'package:firebase/pages/register_page.dart';
import 'package:firebase/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'first_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final kPrimaryColor = Color(0xFF6F35A5);
  final kPrimaryLightColor = Color(0xFFF1E6FF);
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool _isHidePass = true;
  String _email;
  String _password;

  void _togglePasswordvisibility() {
    setState(() {
      _isHidePass = !_isHidePass;
    });
  }

  Future<void> _loginWithEmail() async {
    await Firebase.initializeApp();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      print("User : $userCredential");
    } on FirebaseAuthException catch (e) {
      print("Error : $e");
    } catch (e) {
      print("Error : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(40, 60, 40, 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          SvgPicture.asset(
            "icons/login.svg",
            height: 150,
          ),
          //SizedBox(height: size.height * 0.03),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextField(
              onChanged: (value) {
                _email = value;
              },
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                icon: Icon(Icons.people, color: kPrimaryColor),
                hintText: "Username",
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextField(
              onChanged: (value) {
                _password = value;
              },
              controller: _passController,
              obscureText: _isHidePass,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Password",
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    _togglePasswordvisibility();
                  },
                  child: Icon(
                    _isHidePass ? Icons.visibility_off : Icons.visibility,
                    color: _isHidePass ? kPrimaryColor : kPrimaryColor,
                  ),
                ),
                isDense: true,
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              // ignore: deprecated_member_use
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: kPrimaryColor,
                onPressed: () {
                  _loginWithEmail();
                //signInWithEmail(email: _email, pass: _password);
                 Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProfilePage();
                          }));
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(width: 20),
              Text(
                "OR",
                style: TextStyle(color: kPrimaryColor),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
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
                  signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return FirstScreen();
                      }));
                    }
                  });
                },
                child: Text(
                  "Sign in With Google",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Don’t have account ?",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      "Register here",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}
