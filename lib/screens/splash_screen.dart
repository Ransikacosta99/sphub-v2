import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeMode == ThemeMode.dark
              ? ThemeData.dark()
              : ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.themeMode,
          home: Scaffold(
            backgroundColor: Colors.blue,
            body: Center(
              child: Column(
                // Use a Column to arrange Lottie and Text
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animations/splash1.json'),
                  SizedBox(height: 16), // Add some spacing
                  Text(
                    "SPORTSHUB",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 40, // Adjust font size as needed
                        fontWeight:
                            FontWeight.bold, // Adjust font weight as needed
                        color: Colors.white, // Adjust color as needed
                        letterSpacing: 8),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
