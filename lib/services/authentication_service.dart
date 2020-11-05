import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthenticationService {
  Future<Map<String, dynamic>> register(String email, String password) async {
    bool hasError = false;
    String message = "";

    final Map<String, String> headers = {"Content-Type": "application/json"};
    Map<String, dynamic> authData = {
      "email": email,
      "password": password,
      "returnSecureToken": true
    };

    var response = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyC51rcu50ENTPmS_QUPEHgdfyIGIdMGRpo',
        headers: headers,
        body: json.encode(authData));

    Map<String, dynamic> responsebody = json.decode(response.body);

    if (responsebody.containsKey('idToken')) {
      message = "Account created";
    } else {
      message = "Account failed to create";
      hasError = true;
    }

    return {"message": message, "hasError": hasError};
  }
}
