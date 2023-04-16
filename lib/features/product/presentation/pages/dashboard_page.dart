// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesiam_app/features/product/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:onesiam_app/injection.dart' as di;

class DashboardPage extends StatefulWidget {
  
  final ProductItemBloc productItemBloc;
  const DashboardPage({super.key, required this.productItemBloc});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  
  String _title = 'product';
  int _currentIndex = 0;

  final List<Widget> _children = [
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: di.locator<ProductItemBloc>())
      ],
      child: ProductHomePage(),
    ),
    SavedPage(),
    CartPage()
  ];

  void onTabChange(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          _title = 'product';
          break;
        case 1:
          _title = 'Saved';
          break;
        case 2:
          _title = 'cart';
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            _children[_currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          onTap:
              onTabChange, 
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
           
          ],
        ),
      );
  }
}
