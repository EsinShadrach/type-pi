import 'package:flutter/material.dart';

class HeadersProvider extends ChangeNotifier {
  final List<Map<String, String>> _headers = [
    {'content': 'appl'},
    {'data-2': 'cand'},
    {'': ''},
  ];

  debugPrintHeaders() {
    debugPrint(headers.toString());
    debugPrint('------------------');
  }

  List<Map<String, String>> get headers => _headers;

  void addRow() {
    _headers.add({'': ''});
    notifyListeners();
  }

  void removeRow(int index) {
    if (_headers.length == 1) {
      return;
    }
    _headers.removeAt(index);
    notifyListeners();
  }

  void clearHeaders() {
    _headers.clear();
    notifyListeners();
  }

  void updateHeaderKey(int index, String key) {
    final Map<String, String> updatedHeader = Map.from(_headers[index]);
    _headers[index] = {key: updatedHeader.values.first};
    notifyListeners();
  }

  void updateHeaderValue(int index, String value) {
    final Map<String, String> updatedHeader = Map.from(_headers[index]);
    _headers[index] = {updatedHeader.keys.first: value};
    notifyListeners();
  }
}
