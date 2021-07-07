import 'package:firstapflt/ui/pages/counter.page.dart';
import 'package:firstapflt/ui/pages/gallery.page.dart';
import 'package:firstapflt/ui/pages/home.page.dart';
import 'package:firstapflt/ui/pages/meteo.page.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home":(context)=>HomePage(),

        "/gallery":(context)=>GalleryPage(),
        "/counter":(context)=> CounterPage(),
      },
      theme: ThemeData(
          accentColor: Colors.deepOrange
      ),
      initialRoute: "/home",
    );
  }
}