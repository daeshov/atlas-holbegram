import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:holbegram/screens/Pages/feed.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

@override
  void initState() {
    _pageController = PageController(
      initialPage: _currentIndex,
    );
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          FeedPage(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavyBarItem(
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            icon: const Icon(Icons.home_outlined),
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Billabong',
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavyBarItem(
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            icon: const Icon(Icons.search),
            title: const Text(
              'Search',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Billabong',
                color: Colors.red,
                
              ),
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavyBarItem(
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            icon: const Icon(Icons.add),
            title: const Text(
              'Add',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Billabong',
                color: Colors.red,
                
              ),
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavyBarItem(
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            icon: const Icon(Icons.favorite_border_outlined),
            title: const Text(
              'Favorite',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Billabong',
                color: Colors.red,
                
              ),
              textAlign: TextAlign.center,
            ),
          ),
          BottomNavyBarItem(
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            icon: const Icon(Icons.person_2_outlined),
            title: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Billabong',
                color: Colors.red,
                
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}


