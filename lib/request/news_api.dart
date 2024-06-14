import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/news_data_model.dart';

class NewsApi {
  Future<NewsDataModel?> newsRequest({category}) async {
    String apiKey = "ceb7cad5812349c7aa2811315726730f";
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey";

    try {
      http.Response res = await http.get(
        Uri.parse(url),
      );

      if (res.statusCode == 200) {
        return NewsDataModel.fromJson(jsonDecode(res.body));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
