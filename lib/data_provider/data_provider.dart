import 'dart:convert';
import 'package:covid19tracker/models/countries_model.dart';
import 'package:covid19tracker/models/global_model.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  static const String countryUlr = 'https://covid19.mathdro.id/api/countries';

  static Future<List> getCountries() async {
    try {
      final response = await http.get(countryUlr);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map;
        return data['countries'];
      } else {
        throw Exception('Cant\' get county name');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<CountriesModel> getCountriesCases(String countryName) async {
    try {
      final response =
          await http.get(countryUlr + "/${countryName.toLowerCase()}");
      if (response.statusCode == 200) {
        return CountriesModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('ERROR: can\'t fetch Countries model data');
      }
    } catch (e) {
      throw Exception('ERROR: ' + e.toString());
    }
  }

  static Future<GlobalModel> getGlobalData() async {
    try {
      final response = await http.get('https://covid19.mathdro.id/api');
      if (response.statusCode == 200) {
        return GlobalModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('ERROR: can\'t fetch global model data');
      }
    } catch (e) {
      throw Exception('ERROR: ' + e.toString());
    }
  }
}
