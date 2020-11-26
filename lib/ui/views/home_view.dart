import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/ui/views/souce_view.dart';

import 'headline_view.dart';
import 'search_view.dart';
import 'about.view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: <Widget>[
            //Headline News
            HeadlineView(),
            SourceView(),
            SearchView(),
            SettingsView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(_currentIndex);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            activeColor: Colors.blueGrey,
            title: Text('Headlines'),
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavyBarItem(
            activeColor: Colors.blueGrey,
            title: Text('Sources'),
            icon: Icon(
              Icons.select_all,
            ),
          ),
          BottomNavyBarItem(
            activeColor: Colors.blueGrey,
            title: Text('Search'),
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavyBarItem(
            activeColor: Colors.blueGrey,
            title: Text('About'),
            icon: Icon(
              Icons.info,
            ),
          ),
        ],
      ),
    );
  }
}
