import 'package:flutter_opleiding_051120/data/speakers_data.dart';
import 'package:flutter_opleiding_051120/models/speakers.dart';

class SpeakersService {
  Future<List<Speaker>> getSpeakers() async {
    return await speakersMock;
  }
}
