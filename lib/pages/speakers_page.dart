import 'package:flutter/material.dart';
import 'package:flutter_opleiding_051120/models/speakers.dart';
import 'package:flutter_opleiding_051120/services/speakers_service.dart';

class SpeakersPage extends StatelessWidget {
  var speakersService = SpeakersService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: speakersService.getSpeakers(),
      builder: (BuildContext context, AsyncSnapshot<List<Speaker>> snapshot) {
        Widget widget;

        if (snapshot.hasData) {
          widget = ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext listviewContext, int index) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        'assets/images/haxx_logo.png',
                        height: 70,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${snapshot.data[index].firstName} ${snapshot.data[index].lastName}',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(snapshot.data[index].competence)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          widget = Center(
            child: CircularProgressIndicator(),
          );
        }
        return widget;
      },
    );
  }
}
