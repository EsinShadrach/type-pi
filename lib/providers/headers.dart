import 'package:flutter/material.dart';

class HeadersProvider extends ChangeNotifier {
  final List<Map<String, String>> _headers = [];

  List<Map<String, String>> get headers => _headers;

  void addHeader(String key, String value) {
    _headers.add({key: value});
    notifyListeners();
  }

  void removeHeader(String key) {
    _headers.removeWhere((element) => element.containsKey(key));
    notifyListeners();
  }

  void updateHeader(String key, String value) {
    _headers.removeWhere((element) => element.containsKey(key));
    _headers.add({key: value});
    notifyListeners();
  }

  void clearHeaders() {
    _headers.clear();
    notifyListeners();
  }
}
