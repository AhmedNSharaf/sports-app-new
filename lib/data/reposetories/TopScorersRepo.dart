import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:sports_app/data/models/TopScorersData.dart';

class TopScorersRepo {
  Future<TopScorersData> fetchTopScorersData(int leagueId) async {
    final url =
        'https://apiv2.allsportsapi.com/football/?met=Topscorers&leagueId=$leagueId&APIkey=cd41cc926b48a0bd5c94331afa54e0ba0cde5bad5da1aaa15e2a298fbea30cf9';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return TopScorersData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load top scorers data');
    }
  }
}
