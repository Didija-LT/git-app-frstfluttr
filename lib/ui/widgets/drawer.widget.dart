import 'package:firstapflt/config/global.params.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.deepOrange
                      ]
                  )
              ),
              child:Center(
                 child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     CircleAvatar(
                       backgroundImage: AssetImage("images/logo.png") ,
                       radius: 30,
                     ),
                     CircleAvatar(
                       backgroundImage: AssetImage("images/profile.jpg") ,
                       radius: 50,
                     )
                   ],
                 ),
              )
          ),
         ...(GlobalParams.menus).map((item){
             return Column(
               children: [
                ListTile(
                   title: Text('${item['title']}', style: TextStyle(fontSize: 22),),
                   leading:item['icon'] ,
                   trailing: Icon(Icons.arrow_right,color: Colors.orange),
                   onTap: (){
                     Navigator.of(context).pop();
                      Navigator.pushNamed(context, "/gallery ");
                     },
                 ),
                 Divider(height: 4,color: Colors.deepOrange, ),


               ],
             );

          })

        ],
      ),
    );
  }
}