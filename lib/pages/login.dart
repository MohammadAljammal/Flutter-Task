import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/pages/SignUp.dart';
import 'package:task/provider/authprovider.dart';

import '../main.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Container(
          width: 300,
          height: 350,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //
                        ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    context.read<Auth>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuthenticationWrapper()));
                  },
                  child: Text("Sign in"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  height: 17,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text('Sign Up INSTEAD'),
                    elevation: 0,
                    textColor: Colors.black,
                    color: Colors.transparent,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
