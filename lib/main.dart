import 'package:flutter/material.dart';
import 'package:phuoc_nguyen_covid/constants.dart';
import 'package:phuoc_nguyen_covid/screens/details_screen.dart';
import 'package:phuoc_nguyen_covid/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => HomeScreen(),
          DetailsScreen.routeNamed: (ctx) => DetailsScreen(),
        });
  }
}
