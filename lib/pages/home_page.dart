import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/widgets/product_list.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = [const ProductList(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomBarBubble(
        onSelect: (value) {
          setState(() {
            currentPage = value;
          });
        },
        selectedIndex: currentPage,
        color: Theme.of(context).colorScheme.primary,
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.shopping_cart),
        ],
      ),
    );
  }
}
