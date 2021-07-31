import 'package:flutter/material.dart';
import 'package:pratibha/constants.dart';
import 'package:pratibha/model/signup_auth.dart';
import 'package:pratibha/screen/page/forgot_password.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _myformKey = GlobalKey<FormState>();

  Map<String, dynamic> _loginData = {"email": "", "password": ""};

  // _showDialog(String text) {}

  Future<void> _submitLogin() async {
    if (_myformKey.currentState!.validate()) {
      try {
        _myformKey.currentState!.save();
        Provider.of<SignUpAuth>(context, listen: false).signIn(
            email: _loginData["email"], password: _loginData["password"]);
      } catch (error) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('erro occurred'),
                  content: Text(error.toString()),
                ));
      }
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    var _buttonWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Form(
        key: _myformKey,
        child: Column(
          children: [
            //Email Text Field
            SizedBox(height: 30),
            Padding(
              padding: kTextFieldPadding,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email address to login';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter correct email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _loginData["email"] = value;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  contentPadding: kTextFieldContPadding,
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Password TextField

            SizedBox(height: 20),
            Padding(
              padding: kTextFieldPadding,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 6) {
                    return 'make sure to enter 6 character long password';
                  }
                  return null;
                },
                obscureText: true,
                onSaved: (value) {
                  _loginData["password"] = value;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  contentPadding: kTextFieldContPadding,
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Resend Code Button

            customTextButton(text: 'Re-Send Email Verification'),
            // Login Button
            Container(
              width: _buttonWidth / 1.1,
              child: ElevatedButton(
                onPressed: _submitLogin,
                child: Text('Login'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
              ),
            ),
            // Forgot password text button
            customTextButton(
                text: 'Forgot Password',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ForgotPassword()));
                }),

            //Column in don't have an account
            SizedBox(height: 30),
            Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 26),
                    child: Text('Don\'t have an account?')),
                customTextButton(
                    text: 'New User? Create Account', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container customTextButton(
      {required String text, void Function()? onPressed}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      child: TextButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
