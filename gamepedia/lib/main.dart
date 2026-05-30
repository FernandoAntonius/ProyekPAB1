import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamepedia/l10n/app_localizations.dart';
import 'package:gamepedia/firebase_options.dart';
import 'package:gamepedia/screens/add_game.dart';
import 'package:gamepedia/screens/add_review_screen.dart';
import 'package:gamepedia/screens/all_riview_screen.dart';
import 'package:gamepedia/screens/edit_profile.dart';
import 'package:gamepedia/screens/home_screen.dart';
import 'package:gamepedia/screens/setting_screen.dart';
import 'package:gamepedia/screens/splash.dart';
import 'package:gamepedia/screens/register.dart';
import 'package:gamepedia/screens/login.dart';
import 'package:gamepedia/screens/search_screen.dart';
import 'package:gamepedia/screens/profile_screen.dart';
import 'package:gamepedia/screens/terms_of_service.dart';
import 'package:gamepedia/screens/wishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gamepedia/data/favorites_service.dart';
import 'package:provider/provider.dart';
import 'package:gamepedia/helper/locale_provider.dart';
import 'package:gamepedia/data/review_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // One-time migration: if user is signed in and local favorites haven't been migrated,
  // copy SharedPreferences favorites into Firestore.
  try {
    final prefs = await SharedPreferences.getInstance();
    final migrated = prefs.getBool('favorites_migrated') ?? false;
    final signedIn = prefs.getBool('isSignedIn') ?? false;
    final username = prefs.getString('username') ?? '';
    if (!migrated && signedIn && username.isNotEmpty) {
      await FavoritesService.migrateLocalFavoritesFromPrefs(username);
      await prefs.setBool('favorites_migrated', true);
    }
  } catch (e) {
    // ignore errors; migration is optional and will be retried later.
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ReviewProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      title: 'GamePedia',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: provider.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Quicksand',
      ),
      home: const AllReviewScreen(),
      initialRoute: '/',
      routes: {
        '/main': (context) => const MainScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/terms': (context) => TermsOfServiceScreen(),
        '/wishlist': (context) => const WishlistScreen(),
        '/edit_profile': (context) => EditProfileScreen(),
        '/add_game': (context) => AddGameScreen(),
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
    final loc = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.black,
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(
          context,
        ).copyWith(canvasColor: const Color.fromARGB(255, 6, 2, 26)),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: loc.home),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: loc.search,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: loc.profile,
            ),
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
