import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:task/Utils/AppDateUtils.dart';
import 'package:task/Widgets/TagWidget.dart';
import 'package:task/model/post.dart';
import 'package:url_launcher/url_launcher.dart';

class PostDetails extends StatefulWidget {
  final Post data;

  const PostDetails({Key key, this.data}) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.data.readable ? Colors.white70 : Colors.blueGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            widget.data.readable ? Colors.white70 : Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              elevation: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.data.readable = !widget.data.readable;
                          });
                        },
                        icon: Icon(
                          Icons.check_circle_rounded,
                          color:
                              widget.data.readable ? Colors.grey : Colors.blue,
                          size: 20,
                        ),
                      ),
                      Text(
                        'Readable',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(13),
                    child: Image.network(widget.data.image,fit: BoxFit.cover,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Wrap(
                      children: [
                        ...List.generate(
                          widget.data.tags.length,
                          (index) => TagWidget(
                            tagName: widget.data.tags[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Text(
                      widget.data.text,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                  ),
                  if(widget.data.link != null)
                  InkWell(
                    onTap: ()async{
                      await launch(widget.data.link);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        widget.data.link,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.lightBlue,
                            fontSize: 15),
                      ),
                    ),
                  ),

                  Center(
                    child: SizedBox(
                      height: 0.5,
                      width: 300,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              'images/like.png',
                            )),
                        Text(
                          '  ${widget.data.likes} Likes',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),

                        Spacer(),
                        Text(
                          AppDateUtils.getDateFormat(widget.data.publishDateTime),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
