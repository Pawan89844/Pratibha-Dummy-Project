import 'package:flutter/material.dart';
import 'package:pratibha/main.dart';
import 'package:pratibha/model/signup_auth.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  Map<String, dynamic> _authData = {
    "email": "",
    "name": "",
    "phone": "",
    "password": "",
  };

  Future<void> _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      print('validated');
      _formKey.currentState!.save();
      await Provider.of<SignUpAuth>(context, listen: false).register(
          email: _authData["email"],
          name: _authData["name"],
          phone: _authData["phone"],
          password: _authData["password"]);
      showDialog(context: context, builder: (ctx) => Verification());
    }
    return;

    /* showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
            title: signUpCustomForm(
                text: 'Verification code',
                onSaved: (value) {
                  _authData["reg_code"] = value;
                }),
            content: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ElevatedButton(
                  onPressed: () {
                    Provider.of<SignUpAuth>(context)
                        .verifyEmail(_authData["re_code"]);
                  },
                  child: Text('Verify')),
            ))); */
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            //Email Text Field
            SizedBox(height: 30),
            signUpCustomForm(
                text: '* Email',
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
                  _authData["email"] = value!;
                  print(value);
                }),

            // Password TextField

            SizedBox(height: 20),
            signUpCustomForm(
                text: '* Name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _authData["name"] = value!;
                  print(value);
                }),
            SizedBox(height: 20),
            signUpCustomForm(
                text: '* Password',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 6) {
                    return 'make sure to enter 6 character long password';
                  }
                },
                onSaved: (value) {
                  _authData["password"] = value!;
                  print(value);
                }),
            SizedBox(height: 20),
            signUpCustomForm(
                text: '* Re-enter Password',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 6) {
                    return 'make sure to enter 6 character long password';
                  }
                },
                onSaved: (value) {
                  print(value);
                }),
            SizedBox(height: 20),
            signUpCustomForm(
                text: '* Mobile Number',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter mobile number';
                  }
                },
                onSaved: (value) {
                  _authData["phone"] = value!;
                  print(value);
                }),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 40,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Choose Photo'),
                  style: ButtonStyle(backgroundColor: kCustomButtonColor),
                ),
              ),
            ),

            //Security code
            SizedBox(height: 20),
            signUpCustomForm(text: 'Enter Security code shown above'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _onSubmit,
              child: Text('Submit'),
              style: ButtonStyle(backgroundColor: kCustomButtonColor),
            )
          ],
        ),
      ),
    );
  }

  Padding signUpCustomForm(
      {String? text,
      FormFieldSetter<String>? onSaved,
      FormFieldValidator<String>? validator}) {
    return Padding(
      padding: kTextFieldPadding,
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
          labelText: text,
          contentPadding: kTextFieldContPadding,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> _code = {
    "reg_code": "",
  };

  Future<void> _verficationSubmit() async {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      await Provider.of<SignUpAuth>(context, listen: false)
          .verifyEmail(verificationCode: _code["reg_code"]);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: kTextFieldPadding,
        child: Form(
          key: _formKey,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a verification code';
              }
              if (value.length < 5) {
                return 'error verification code minimum should be 6 digits';
              }
              return null;
            },
            onSaved: (value) {
              _code["reg_code"] = value;
              print('veification code is $value');
            },
            decoration: InputDecoration(
              labelText: 'Verify Email',
              contentPadding: kTextFieldContPadding,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: ElevatedButton(
            onPressed: _verficationSubmit, child: Text('Verify')),
      ),
    );
  }
}
