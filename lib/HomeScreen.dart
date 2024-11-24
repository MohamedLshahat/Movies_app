import 'package:flutter/material.dart';
import 'package:movies/browse_tab/BrowseTab.dart';
import 'package:movies/home_tab/HomeTab.dart';
import 'package:movies/search_tab/SearchTab.dart';
import 'package:movies/watchlist_tab/WatchListTab.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

   static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs=[HomeTab(),SearchTab(),BrowseTab(),WatchListTab()];

  int selectedTab=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[selectedTab],

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          selectedTab=index;

          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/Home icon.png')),label: 'HOME',backgroundColor: Colors.white10,),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/search icon.png')),label: 'SEARCH',backgroundColor: Colors.white10,),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/browse icon.png')),label: 'BROWSE',backgroundColor: Colors.white10,),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/watchlist icon.png')),label: 'WATCHLIST',backgroundColor: Colors.white10,),],
          currentIndex: selectedTab,

      ),
    );
  }
}
