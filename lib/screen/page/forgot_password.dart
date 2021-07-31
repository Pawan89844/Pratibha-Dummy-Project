import 'package:flutter/material.dart';

import '../../constants.dart';

enum ResetPassword { reset, changePassword }

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _forPassFormKey = GlobalKey<FormState>();
  

  Future<void> _submitEmail() async {
    _forPassFormKey.currentState!.save();
  }

  void _changePassword() {
    setState(() {
      _currentScree = ResetPassword.changePassword;
      print('button Pressed');
    });
  }

  ResetPassword _currentScree = ResetPassword.reset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: _currentScree == ResetPassword.reset
              ? Form(
                  key: _forPassFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Image.asset(
                          'assets/images/final.png',
                          scale: 2.5,
                        ),
                      ),

                      SizedBox(height: 100),

                      Text('Forgot Password', style: TextStyle(fontSize: 20)),

                      SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: TextFormField(
                          onSaved: (value) {
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            contentPadding: kTextFieldContPadding,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      //Submit button
                      Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: ElevatedButton(
                          onPressed: () {
                            _submitEmail();
                            _changePassword();
                          },
                          child: Text('Submit'),
                          style: ButtonStyle(
                              backgroundColor: kCustomButtonColor,
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                        ),
                      ),
                    ],
                  ),
                )
              : Form(
                  key: _forPassFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Image.asset(
                          'assets/images/final.png',
                          scale: 2.5,
                        ),
                      ),

                      SizedBox(height: 100),

                      Text('Reset Password', style: TextStyle(fontSize: 20)),

                      SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: TextFormField(
                          onSaved: (value) {},
                          decoration: InputDecoration(
                            labelText: 'Password',
                            contentPadding: kTextFieldContPadding,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: TextFormField(
                          onSaved: (value) {},
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            contentPadding: kTextFieldContPadding,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),
                      //Submit button
                      Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Submit'),
                          style: ButtonStyle(
                              backgroundColor: kCustomButtonColor,
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
