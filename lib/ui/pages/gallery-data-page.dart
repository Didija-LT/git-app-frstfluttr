

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _GalleryState extends State<Gallery> {
  String keyword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange, title: Text('${keyword}')
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Key word'),
              onChanged: (value){
                setState((){ this.keyword=value; });
              },
              onSubmitted: (value){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>GalleryData(value)));
              },
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>GalleryData(this.keyword)));
                }, color: Colors.deepOrange,textColor: Colors.white,child: Text('Get Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }

class GalleryData extends StatefulWidget {
  String keyWord;
  GalleryData(this.keyWord);
  @override
  _GalleryDataState createState() => _GalleryDataState();
}

class _GalleryDataState extends State<GalleryData> {
  List<dynamic> data;
  int currentPage=1;int pageSize=10; int totalPages=0;
  ScrollController _scrollController=new ScrollController();
  dynamic dataGallery;
  List<dynamic> hits=new List();
  getData(url){
    http.get(url).then((resp){
      setState(() {
        dataGallery=json.decode(resp.body);
        hits.addAll(dataGallery['hits']);
        if(dataGallery['totalHits']%this.pageSize==0)
          this.totalPages=dataGallery['totalHits']~/this.pageSize;
        else this.totalPages=1+(dataGallery['totalHits']/this.pageSize).floor();
      });
    }).catchError((err){
      print(err);
    });
  }
  class GalleryData extends StatefulWidget {
  String keyWord;
  GalleryData(this.keyWord);
  @override
  _GalleryDataState createState() => _GalleryDataState();
  }
  class _GalleryDataState extends State<GalleryData> {
  List<dynamic> data;
  int currentPage=1;int pageSize=10; int totalPages=0;
  ScrollController _scrollController=new ScrollController();
  dynamic dataGallery;
  List<dynamic> hits=new List();
  getData(url){
  http.get(url).then((resp){
  setState(() {
  dataGallery=json.decode(resp.body);
  hits.addAll(dataGallery['hits']);
  if(dataGallery['totalHits']%this.pageSize==0)
  this.totalPages=dataGallery['totalHits']~/this.pageSize;
  else this.totalPages=1+(dataGallery['totalHits']/this.pageSize).floor();
  });
  }).catchError((err){
  print(err);
  });
  }