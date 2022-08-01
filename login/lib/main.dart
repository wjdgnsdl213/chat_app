import 'package:flutter/material.dart';
import 'package:login/pages/auth_page.dart';
import 'package:login/pages/my_home.dart';
import 'package:login/provider/page_notifier.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>PageNotifier())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<PageNotifier>(
          builder:(context, pageNotifier, chlid){
            return Navigator(
              pages: [
                MaterialPage(
                    key: ValueKey(MyHomePage.pageName),
                    child: MyHomePage(title: 'Flutter Demo Home Page')),
                if (pageNotifier.currentPage == AuthPage.pageName)AuthPage(),
              ],
              onPopPage: (route, result){
                if(!route.didPop(result)) {
                  return false;
                }
                return true;
              },
            );
          },
        ),
      ),
    );
  }
}

