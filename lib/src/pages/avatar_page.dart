import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){},),
          // SizedBox(width: 10),

          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://scontent.fmvd4-1.fna.fbcdn.net/v/t1.0-9/12928427_967042366710648_4190853920142397361_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=QvRmMAi1lpEAX9Keby-&_nc_ht=scontent.fmvd4-1.fna&oh=d22f0cedd87969920593bf69cf27234f&oe=60748F4E'),
              // radius: 10.0,
            ),
            
          ),

          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text('JM')
              // backgroundColor: Colors.brown,
            ),
          ),
          // SizedBox(width: 10)
        ],
      ),


      body: Center(
        child: Text('Avatar Page'),
      ),

    );
  }
}