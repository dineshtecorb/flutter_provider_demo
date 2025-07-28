import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider/count_provider.dart';
import 'package:provider_demo/provider/favourite_provider.dart';
import 'package:provider_demo/provider/slider_provider.dart';
import 'package:provider_demo/provider/theme_provider.dart';
import 'package:provider_demo/screens/counter_example.dart';
import 'package:provider_demo/screens/favourite/favourite_screen.dart';
import 'package:provider_demo/screens/slider_screen.dart';
import 'package:provider_demo/screens/theme_mode_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => SliderProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FavouriteProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          )
        ],
        child: Builder(builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              brightness: Brightness.light,
              appBarTheme: AppBarTheme(backgroundColor: Colors.red),
              //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              // useMaterial3: true,
              //primaryColor: Colors.red,
              //primarySwatch: Colors.red,
            ),
            themeMode: themeProvider.theme,
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                //primaryColor: Colors.amber,
                //primarySwatch: Colors.purple,
                appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
                iconTheme: IconThemeData(color: Colors.white)),
            debugShowCheckedModeBanner: false,
            home:
                const ThemeModeScreen(), //FavouriteScreen(), //const CounterExample(),
          );
        }));
  }
}
