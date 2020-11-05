import 'package:flutter/material.dart';
import 'package:flutter_opleiding_051120/screens/main_screen.dart';

class ButtonHomePage extends StatelessWidget {
  final String route;
  final IconData buttonIcon;
  final String buttonText;

  ButtonHomePage({this.buttonIcon, this.buttonText, this.route});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(route);
      },
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 120,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              buttonIcon,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              buttonText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
