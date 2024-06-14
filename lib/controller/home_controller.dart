import 'package:flutter/material.dart';
import 'package:newsapp/model/news_data_model.dart';
import 'package:newsapp/request/news_api.dart';

class HomeController extends ChangeNotifier {
  String selectedCategory = "business";
  NewsDataModel? newsDataModel;
  NewsApi newsApi = NewsApi();
  bool isLoading = false;

  set loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set updateSelectedCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  fetchNews() async {
    loading = true;
    newsDataModel = null;
    newsDataModel = await newsApi.newsRequest(category: selectedCategory);
    loading = false;
  }
}
