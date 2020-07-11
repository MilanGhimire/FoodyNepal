import 'package:flutter/material.dart';

// pages
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  bool _toggleVisibility = false;

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your email or username",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
          icon: _toggleVisibility
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              _toggleVisibility = !_toggleVisibility;
            });
          },
        ),
      ),
      obscureText: _toggleVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign In",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            SizedBox(height: 100.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Forget Password", style: TextStyle(fontSize: 18.0, color: Colors.blueAccent),),
              ],
            ),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(height: 20.0,),
                    _buildPasswordTextField(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Center(
                  child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),)
              ),
            ),
            Divider(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?", style: TextStyle(color: Color(0xFFBDC2CB), fontSize: 18.0),),
                SizedBox(width: 10.0,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                  },
                  child: Text("Sign up", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 18.0,),)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
