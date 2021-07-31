import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SignUpAuth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _useerId;

  bool get isAuth {
    return _token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> register({
    required String email,
    required String name,
    required String phone,
    required String password,
  }) async {
    final url = "http://owlbridge.in/quiz/apis/register";

    final response = await http.post(Uri.parse(url), body: {
      "email": email,
      "name": name,
      "phone": phone,
      "password": password,
    } /* json.encode(<String, String>{
              "email": email,
              "name": name,
              "phone": phone,
              "password": password,
            }) */
        );
    print(json.encode(response.body));
    try {
      if (response.statusCode == 200) {
        print(json.encode(response.body));
      }
      if (response.statusCode == 400) {
        print('there\'s some error');
      }
      if (response.statusCode == 500) {
        print('server error');
      }
      return null;
    } catch (e) {
      print(e);
    }
  }

  Future<void> verifyEmail({required String verificationCode}) async {
    final verficationUrl = "http://owlbridge.in/quiz/apis/verifyEmail";

    final response = await http.post(Uri.parse(verficationUrl), body: {
      "reg_code": verificationCode,
    }).catchError((error) {
      print(error);
    });
    print(json.decode(response.body));
  }

  Future<void> signIn({required String email, required String password}) async {
    final signInUrl = "http://owlbridge.in/quiz/apis/login";

    try {
      final response = await http.post(Uri.parse(signInUrl), body: {
        "email": email,
        "password": password,
      });

      print(json.decode(response.body));
      final responseData = json.decode(response.body);

      _token = responseData["Token"];
      _useerId = responseData["Id"];
      notifyListeners();
    } catch (error) {}
  }

/*   Future<void> forgotPassword(String email) async {
    final forPass = "http://owlbridge.in/quiz/apis/forgetPassword";
    final response = await http.post(Uri.parse(forPass), body: {
      "Forgot": {
        "email": email,
      }
    }).catchError((error) {
      print(error);
    });
    print(json.decode(response.body));
  } */
}
