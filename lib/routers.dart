import 'package:flutter/material.dart';
import 'package:onesiam_app/features/product/presentation/pages/page.dart';

Map<String, WidgetBuilder> routes = {
  '/dashboard': (BuildContext context) => const DashboardPage(),
  '/producthome': (BuildContext context) => const ProductHomePage(),
};
