import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sportshub/screens/notification_screen.dart'; // Import your notification screen
import 'package:sportshub/screens/splash_screen.dart';

import 'screens/playground_detail_screen.dart';
import 'themes/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/payment_screen.dart';
import 'providers/theme_provider.dart';
//import 'providers/auth_provider.dart'; // Uncomment if you have auth

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        // ChangeNotifierProvider(create: (_) => AuthProvider()), // Uncomment if you have auth
      ],
      child: PlaygroundBookingApp(),
    ),
  );
}

class PlaygroundBookingApp extends StatefulWidget {
  PlaygroundBookingApp({Key? key}) : super(key: key);

  @override
  State<PlaygroundBookingApp> createState() => _PlaygroundBookingAppState();
}

class _PlaygroundBookingAppState extends State<PlaygroundBookingApp> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Simulate app initialization (replace with your logic)
    await Future.delayed(Duration(seconds: 5)); // Example: 2-second delay

    // Example: Load theme from preferences (if you have persistence)
    // await Provider.of<ThemeProvider>(context, listen: false).loadTheme();

    setState(() {
      _isLoading = false;
    });
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => SearchScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: '/playground/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return PlaygroundDetailsScreen(playgroundId: id);
        },
      ),
      GoRoute(
        path: '/booking/:playgroundId',
        builder: (context, state) {
          final playgroundId = state.pathParameters['playgroundId']!;
          return BookingScreen(playgroundId: playgroundId);
        },
      ),
      GoRoute(
        path: '/payment',
        builder: (context, state) => PaymentScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => NotificationScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SplashScreen()
        : Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp.router(
                title: 'Playground Booking',
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                themeMode: themeProvider.themeMode,
                routerConfig: _router,
                debugShowCheckedModeBanner: false,
                // Add localization delegates if needed
                // localizationsDelegates: const [ ... ],
                // supportedLocales: const [ ... ],
              );
            },
          );
  }
}
