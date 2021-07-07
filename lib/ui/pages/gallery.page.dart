
import 'package:firstapflt/ui/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';


class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(title: Text('Gallery Page')),
        body: Column(
          children: <Widget>[
            Container(child:TextField(
              style: TextStyle(fontSize: 22),
              onChanged: ,
            ),
              padding: EdgeInsets.all(10)
            ),
            Container(width: double.infinity , child: RaisedButton(
              onPressed: (){},
              color: Colors.deepPurple,
              padding: EdgeInsets.all(10),
              child: Text("Get image", style: TextStyle(fontSize: 22, color: Colors.white),),
            ),)
          ],
        )
    );
  }
}