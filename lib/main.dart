import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'screens/playground_detail_screen.dart';
import 'themes/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/payment_screen.dart';
import 'providers/theme_provider.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        // ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: PlaygroundBookingApp(),
    ),
  );
}

class PlaygroundBookingApp extends StatelessWidget {
  PlaygroundBookingApp({Key? key}) : super(key: key);

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
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          title: 'Playground Booking',
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: themeProvider.themeMode,
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            // Add localization delegates
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
        );
      },
    );
  }
}
