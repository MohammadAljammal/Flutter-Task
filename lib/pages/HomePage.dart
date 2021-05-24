import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/Widgets/CardAllPost.dart';
import 'package:task/model/post.dart';
import 'package:task/provider/authprovider.dart';
import 'package:task/service/postapi.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    PostApi postApi =PostApi();
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              context.read<Auth>().signOut();
            },
          )
        ],
      ),
      backgroundColor: Colors.grey.shade200,

        body: FutureBuilder(
          future: postApi.fetchData(),
          builder: (context,snapshot){
            List<Post> data =  snapshot.data;
            return ListView.builder(
              itemCount: (snapshot.connectionState == ConnectionState.waiting)?1:data.length,
                itemBuilder:(context,index){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                          strokeWidth: 10,
                        ),
                      ),
                    );
                  }else {
                    return CardAllPost(data: data[index],);
                  }
                }
            );
          },
        ),

    );
  }
}


