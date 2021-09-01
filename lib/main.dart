import 'package:drinking_water/state/water_state.dart';
import 'package:drinking_water/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WaterState>(
          create: (context) => WaterState(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ne Kadar Su İçtim?',
        home: HomePage(),
      ),
    );
  }
}
