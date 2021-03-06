import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:chance_app/src/models/cards_model.dart';

class CardProvider {

  String _token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InJvbGUiOiJBRE1JTl9ST0xFIiwic3RhdHVzIjp0cnVlLCJnb29nbGUiOmZhbHNlLCJhcHBsZSI6ZmFsc2UsIl9pZCI6IjVmODI1ZjRhYWFjMGE2MDAxN2Y1Mjg2MyIsImZpcnN0bmFtZSI6IkFsZWphbmRybyIsImxhc3RuYW1lIjoiR2FyY2lhIiwiZW1haWwiOiJtb25va2FpLmd0QGdtYWlsLmNvbSIsInVwZGF0ZWRfYXQiOiIyMDIwLTEwLTExVDAxOjI2OjM0LjMxNloiLCJjcmVhdGVkX2F0IjoiMjAyMC0xMC0xMVQwMToyNjozNC4zMTZaIiwiX192IjowfSwiaWF0IjoxNjAyNjM2OTMzLCJleHAiOjE2MDI4MDk3MzN9.gj48UUpZ3ov3KIpdh7wylQ9boV_0ZGbCyGjs4_7LSas';
  String _url = 'chance-app-api-rest-v1.herokuapp.com';

  Future<List<Cards>> getCards () async {

    final url = Uri.https(_url, '/card');

    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'token': _token
    });
    final data = json.decode( response.body );
    final cards = new Results.fromJsonList( data['card']);
    return cards.items;

  }

}