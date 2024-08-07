import 'package:dio/dio.dart';
import 'package:sports_app/data/models/CountriesData.dart';

class CountriesRepo {
  Dio dio = Dio();

  Future<CountriesData> fetchCountriesData() async {
    try {
      final response = await dio.get(
        'https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=cd41cc926b48a0bd5c94331afa54e0ba0cde5bad5da1aaa15e2a298fbea30cf9',
      );

      if (response.statusCode == 200) {
        return CountriesData.fromJson(response.data);
      } else {
        throw Exception('Failed to load countries data');
      }
    } catch (e) {
      throw Exception('');
    }
  }
}
