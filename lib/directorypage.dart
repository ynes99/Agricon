import 'package:firebasetest/Screens/user screens/blogpage/blog.dart';
import 'package:flutter/material.dart';
import 'package:firebasetest/constants/constants.dart';
import 'package:firebasetest/Screens/user screens/partenairespage/partenaires.dart';
import 'package:firebasetest/Screens/user screens/servicespage/services.dart';
import 'package:firebasetest/Screens/user screens/homepage/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebasetest/services/authenticationService.dart';

class Directory extends StatefulWidget {
  @override
  State<Directory> createState() => _DirectoryState();
}

class _DirectoryState extends State<Directory> {
  // 1
  User user;

  @override
  void initState() {
    setState(() {
      // 2
      user = context.read<AuthenticationService>().getUser();
    });
    super.initState();
  }

  int _selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screens = [
    Home(),
    Blog(),
    Partenaires(),
    Services(),
  ];
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            backgroundColor: kCouleurPrimaire,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article,
            ),
            label: 'Blog',
            backgroundColor: kCouleurPrimaire,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            label: 'Partenaires',
            backgroundColor: kCouleurPrimaire,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'Services',
            backgroundColor: kCouleurPrimaire,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kIconTapped,
        unselectedItemColor: kCouleurTexte,
        onTap: _onItemTapped,
        elevation: 10,
      ),
    );
  }
}
