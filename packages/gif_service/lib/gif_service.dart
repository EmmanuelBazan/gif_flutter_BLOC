import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class GifService {
  GifService();

  final http.Client _httpClient = http.Client();
  final String base_url = "api.giphy.com";
  final String endPoint = "/v1/gifs/trending";
  final String apiKey = "VY6mmiUfEQREPo7eLFPMg7SwHB0G1C6N";

  Future<List<String>> fetchGif() async {
    final uri = Uri.http(base_url, endPoint, {'api_key': apiKey});

    http.Response response;
    List body;

    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw Exception();
    }

    if (response.statusCode != 200) {
      throw HttpRequestException();
    }

    try {
      body = jsonDecode(response.body)['data'] as List;
    } on Exception {
      throw JsonDecodeException();
    }

    return body
        .map((item) => item['images']['original']['url'].toString())
        .toList();
  }
}

class HttpRequestException implements Exception {}

class JsonDecodeException implements Exception {}
