
import 'dart:convert';

import 'package:firstapflt/ui/pages/home.page.dart';
import 'package:firstapflt/ui/widgets/drawer.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GitUsersPage extends StatefulWidget {
  @override
  _GitUsersPageState createState() => _GitUsersPageState();
}

class _GitUsersPageState extends State<GitUsersPage> {
  String query='';
  TextEditingController queryTextEditingController = TextEditingController();
  dynamic data;
  int curentPage=0;
  int totalPage=0;
  int pagesize=30;
  ScrollController scrollController = ScrollController();

  void _search(String query) {

    String url ='https://api.github.com/search/users?q=$query&per_page=$pagesize&page=$curentPage';
     http.get(Uri.parse(url))
        .then((response){
      setState(() {
        this.data=json.decode(response.body);
        if(data['total_count'] % pagesize ==0)
          totalPage=data['total_count']/pagesize;
        else
          totalPage=(data['total_count']/pagesize).floor() +1;
      });
    } )
        .catchError((onError){
      print(onError);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        setState(() {
          if(curentPage<=totalPage)
            ++curentPage;
        });
        _search(query);
      }
      if(scrollController.position.pixels==scrollController.position.minScrollExtent){
        setState(() {
          if(curentPage>0)
            --curentPage;
        });
        _search(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
      appBar: AppBar(title: Text('Git Users "$query"  Pages: $curentPage / $totalPage'),),
      body:Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      onChanged: (value){
                        setState(() {
                          this.query=value;
                        });
                      },
                      controller: queryTextEditingController,
                      decoration: InputDecoration(
                          suffixIcon:Icon(Icons.visibility) ,
                          contentPadding: EdgeInsets.only(left: 20),
                          border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              )
                          )
                      ),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: (){
                      setState((){
                        String query = queryTextEditingController.text;
                        _search(query);

                      });
                    }
                )
              ],
            ),
            Expanded(
              child: ListView.builder(

                controller: scrollController,
                itemCount: (data==null)?0 :data['items'].length,
                itemBuilder: (context,index){
                  return ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>GitRepositoriesPage(login:data['items'][index]['login'])));
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children:[
                            CircleAvatar(
                              backgroundImage:NetworkImage(data['items'][index]['avatar_url']),
                              radius: 40,
                            ),
                            SizedBox(width: 20,),
                            Text('${data['items'][index]['login']}'),
                          ],
                        ),
                        CircleAvatar(
                          child:Text('${data['items'][index]['score']}'),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),

    );
  }

}