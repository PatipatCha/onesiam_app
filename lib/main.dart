import 'package:flutter/material.dart';
import 'package:onesiam_app/routers.dart';
import 'package:onesiam_app/core/themes/style.dart';
import 'package:onesiam_app/injection.dart';
var userStep;


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/dashboard',
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}
