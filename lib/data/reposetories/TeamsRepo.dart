import 'package:dio/dio.dart';
import 'package:sports_app/data/models/TeamsData.dart';

class TeamsRepo {
  final Dio dio = Dio();

  Future<TeamsData> fetchTeamsData(int leagueId) async {
    try {
      final response = await dio.get(
          'https://apiv2.allsportsapi.com/football/?met=Teams&leagueId=$leagueId&APIkey=cd41cc926b48a0bd5c94331afa54e0ba0cde5bad5da1aaa15e2a298fbea30cf9');
      if (response.statusCode == 200) {
        return TeamsData.fromJson(response.data);
      } else {
        throw Exception('Failed to load teams data');
      }
    } catch (e) {
      throw Exception('Failed to load teams data: $e');
    }
  }
}
