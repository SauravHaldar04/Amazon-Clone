import 'package:amazon_clone/constants/errorHandling.dart';
import 'package:amazon_clone/constants/globalvariables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: '',
          address: '',
          type: '',
          token: '');
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErroraHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account Created! Login with the same credentials');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
