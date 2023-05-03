import 'package:flutter/material.dart';
import 'package:movie/Screen/Movie/View/search_screen.dart';
import 'package:provider/provider.dart';
import 'Screen/Movie/Provider/home_provider.dart';
import 'Screen/Movie/View/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) =>HomeScreen(),
          'search':(context) =>SearchScreen(),
        },
      ),
    ),
  );
}