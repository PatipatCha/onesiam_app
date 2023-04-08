import 'package:flutter/material.dart';
import 'package:onesiam_app/routers.dart';
import 'package:onesiam_app/themes/style.dart';

var userStep;


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //การบอกให้ main ทำงานได้แบบ async
  runApp(MyApp());
}

// extract ออกมา เพื่อเอาไว้ทำ hotreload
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
      routes: routes,
    );
  }
}
