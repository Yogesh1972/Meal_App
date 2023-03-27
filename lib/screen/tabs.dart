import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import '../screen/categories_screen.dart';
import '../screen/favorites_screen.dart';
import '../widgets/drawer.dart';

class Tabs_Screen extends StatefulWidget {
  final List<meal> favorites;

  Tabs_Screen(this.favorites);
  @override
  State<Tabs_Screen> createState() => _Tabs_ScreenState();
}

class _Tabs_ScreenState extends State<Tabs_Screen> {
  late List<Map<String, Object>> pages;

  int selectedPage_index = 0;

  @override
  void initState() {
    pages = [
      {'page': CatogeriesScreen(), 'title': 'Catogaries'},
      {'page': Favorites(widget.favorites), 'title': 'Your Favorites'}
    ];
    // TODO: implement initState
    super.initState();
  }

  void _SelectPage(int index) {
    setState(() {
      selectedPage_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('meals'),
    //       bottom: TabBar(tabs: [
    //         Tab(
    //           icon: Icon(
    //             Icons.category,
    //           ),
    //           text: 'Category',
    //         ),
    //         Tab(
    //           icon: Icon(Icons.favorite),
    //           text: 'Favorites',
    //         ),
    //       ]),
    //     ),
    //     body: TabBarView(children: [CatogeriesScreen(), Favorites()]),
    //   ),
    // );
    //to make TAbs from default tabs in appbar

    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPage_index]['title'] as String),
      ),
      drawer: Drawer_Main(),
      body: (pages[selectedPage_index]['page'] as Widget),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _SelectPage,
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: selectedPage_index,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.category),
            label: 'category',
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.favorite),
              label: 'favorites')
        ],
      ),
    );
  }
}
