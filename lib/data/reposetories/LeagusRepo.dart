import 'package:dio/dio.dart';
import 'package:sports_app/data/models/LeagueData.dart';

class LeaguesRepo {
  final Dio dio = Dio();

  Future<LeagueData> fetchLeaguesData(int countryKey) async {
    try {
      final response = await dio.get(
          'https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=cd41cc926b48a0bd5c94331afa54e0ba0cde5bad5da1aaa15e2a298fbea30cf9&countryId=$countryKey');
      if (response.statusCode == 200) {
        return LeagueData.fromJson(response.data);
      } else {
        throw Exception('Failed to load leagues data');
      }
    } catch (e) {
      throw Exception('Failed to load leagues data: $e');
    }
  }
}
