import 'dart:convert';

import 'package:flutter_opleiding_051120/data/speakers_data.dart';
import 'package:flutter_opleiding_051120/models/speakers.dart';
import 'package:http/http.dart' as http;

class SpeakersService {
  Future<List<Speaker>> getSpeakers() async {
    final http.Response response = await http
        .get('https://flutteropleiding-f66b7.firebaseio.com/speakers.json');

    Map<String, dynamic> fetchedData = json.decode(response.body);

    List<Speaker> speakers = [];

    fetchedData.forEach((String key, value) {
      Speaker speaker = Speaker.fromJson(value);
      speakers.add(speaker);
    });

    return speakers;
  }

  void populateFireBase() async {
    var speakers = await speakersMock;
    final Map<String, String> headers = {"Content-Type": "application/json"};
    for (Speaker speaker in speakers) {
      final http.Response response = await http.post(
          'https://flutteropleiding-f66b7.firebaseio.com/speakers.json',
          headers: headers,
          body: json.encode(speaker));
    }
  }
}
