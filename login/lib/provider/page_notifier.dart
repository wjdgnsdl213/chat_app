import 'package:flutter/material.dart';
import 'package:login/pages/my_home.dart';

class PageNotifier extends ChangeNotifier{
  String _currentPage = MyHomePage.pageName;

  String get currentPage => _currentPage;

  void goToMain(){
    _currentPage = MyHomePage.pageName;
    notifyListeners();
  }

  void goToOtherPage(String name) {
    _currentPage = name;
    notifyListeners();
  }
}