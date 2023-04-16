import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesiam_app/app_bloc_observer.dart';
import 'package:onesiam_app/features/product/product.dart';

import 'package:onesiam_app/injection.dart' as di;

class RouterGenerator {
   static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => DashboardPage(productItemBloc: di.locator.get()));
      case '/productdetial':
        final args = settings.arguments as Map?;
        return MaterialPageRoute(builder: (_) => ProductDetailPage(product: args!['product']));
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text("No route"))));
    }
  }
  // static Route<dynamic>? generateRoute(RouteSettings settings) {
  //    Widget? page;
  //    Bloc.observer = AppBlocObserver();
  //   print(settings.name);
  //   switch (settings.name) {
  //     case '/':
  //       PageRouteBuilder(
  //         settings: settings,
  //         pageBuilder: (context, animation, secondaryAnimation) =>
  //             const CartPage(),
  //       );
  //     break;
  //   }
  //   // if (page != null) {
  //   //   return PageRouteBuilder(
  //   //     settings: settings,
  //   //     pageBuilder: (context, animation, secondaryAnimation) {
  //   //       return page;
  //   //     },
  //   //   );
  //   // }
  //   // return null;

  // }


}
// Map<String, WidgetBuilder> routes = {
//   '/dashboard': (BuildContext context){} => const DashboardPage(),
//   '/producthome': (BuildContext context) => const ProductHomePage(),
// };
