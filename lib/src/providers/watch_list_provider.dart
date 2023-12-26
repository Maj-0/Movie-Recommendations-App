import 'package:flutter/material.dart';

class WatchListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _watchList = [];

  List<Map<String, dynamic>> get watchList => _watchList;

  void addToWatchList(Map<String, dynamic> movie) {
    _watchList.add(movie);
    notifyListeners();
  }

  void removeFromWatchList(Map<String, dynamic> movie) {
    _watchList.remove(movie);
    notifyListeners();
  }
}
