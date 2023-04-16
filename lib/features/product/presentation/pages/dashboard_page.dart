// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:onesiam_app/features/product/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onesiam_app/themes/colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  String _title = 'product';
  int _currentIndex = 0;

  final List<Widget> _children = [
    ProductHomePage(),
    SavedPage(),
    CartPage()
  ];

  // สร้าง function สำหรับการเปลี่ยน tap (switch case, if else)
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

        //bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          onTap:
              onTabChange, //รับ param เดียว return param เดียว ไม่ต้องใส่ () ที่ function
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
