import 'package:flutter/material.dart';
import 'package:task/model/post.dart';
import 'package:task/pages/PostDetails.dart';

import 'TagWidget.dart';

class CardAllPost extends StatelessWidget {
  final Post data;

  const CardAllPost({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                child: Image.network(
                  data.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${(data.text.length < 25) ? data.text : (data.text.substring(0, 24) + '...')}'),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: [
                        ...List.generate(
                          data.tags.length,
                          (index) => TagWidget(
                            tagName: data.tags[index],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  'images/like.png',
                                )),
                            Text('  ${data.likes} Likes'),
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostDetails(
                                      data: data,
                                    )));
                          },
                          child: Text(
                            'Show post',
                            style: TextStyle(color: Colors.yellow.shade900),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
