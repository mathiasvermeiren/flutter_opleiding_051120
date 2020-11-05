import 'package:flutter/material.dart';
import 'package:flutter_opleiding_051120/services/authentication_service.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool _obscurePassword = true;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign up',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (String value) {
                            _email = value;
                          },
                          validator: (String value) {
                            String errorMessage;

                            if (value.isEmpty) {
                              errorMessage = 'email cannot be emty';
                            }

                            return errorMessage;
                          },
                          decoration: InputDecoration(
                              hintText: 'Your email',
                              hintStyle: TextStyle(color: Colors.black26)),
                        ),
                        TextFormField(
                          onSaved: (String value) {
                            _password = value;
                          },
                          validator: (String value) {
                            String errorMessage;

                            if (value.isEmpty) {
                              errorMessage = 'password cannot be emty';
                            }

                            return errorMessage;
                          },
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.black26),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: _obscurePassword
                                  ? Icon(Icons.visibility,
                                      color: Theme.of(context).accentColor)
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.black26,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  onSubmit();
                },
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 40),
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    AuthenticationService _authService = new AuthenticationService();
    var validationSucces = _formKey.currentState.validate();

    if (validationSucces) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext bc) {
            return AlertDialog(
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 10),
                  Text('Loading ...')
                ],
              ),
            );
          });

      _formKey.currentState.save();

      _authService.register(_email, _password).then((final response) {
        Navigator.of(context).pop();

        _scaffoldKey.currentState.showSnackBar(SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Theme.of(context).accentColor,
          content: Text(response["message"]),
        ));
      });
    }
  }
}
