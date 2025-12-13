import 'package:flutter/material.dart';
import 'package:gamepedia/screens/edit_game.dart';
import 'package:gamepedia/screens/home_screen.dart';
import 'package:gamepedia/screens/register.dart';
import 'package:gamepedia/screens/add_game.dart';
import 'package:gamepedia/screens/login.dart';
import 'package:gamepedia/screens/search_screen.dart';
import 'package:gamepedia/screens/profile_screen.dart';
import 'package:gamepedia/screens/terms_of_service.dart';
import 'package:gamepedia/screens/wishlist.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GamePedia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/terms': (context) => TermsOfServiceScreen(),
        '/wishlist': (context) =>  WishlistScreen(wishlist: [],),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Color(0xFF6A5AF9),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
        ),
      ),
    );
  }
}
