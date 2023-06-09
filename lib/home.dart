import 'package:flt_fooderlich/models/models.dart';
import 'package:flt_fooderlich/screens/explore_screen.dart';
import 'package:flt_fooderlich/screens/grocery_screen.dart';
import 'package:flt_fooderlich/screens/recipes_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Fooderlich',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: IndexedStack(
          index: tabManager.selectedTab,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            tabManager.goToTab(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To Buy',
            ),
          ],
        ),
      );
    });
  }
}
