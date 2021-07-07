import 'package:firstapflt/ui/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';




import '../../main.dart';

class MeteoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer() ,
      appBar: AppBar(title: Text('Meteo'),),
      body:Center(
        child: Text('Meteo Page',
          style:TextStyle(
              color: Colors.purple,
              fontSize: 30),
        ),
      ),
    );
  }
}