import 'package:flutter/material.dart';
import 'package:authentication_template/pages/my_home.dart';
import 'package:authentication_template/pages/auth_page.dart';

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