import 'package:TalkItOut/data.dart';
import 'package:TalkItOut/main.dart';
import 'package:TalkItOut/topic_comments.dart';
import 'package:flutter/material.dart';

class Topics extends StatefulWidget {
  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  Set isLiked = new Set();

  @override
  void initState() {
    super.initState();
    isLiked.add(-1);
    //Since contains method cannot be called on an empty set
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "TalkItOut",
          style: TextStyle(
            color: Colors.black,
            fontFamily: myFont,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        //to change the default icon color of appBar icons
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Trending",
              style: TextStyle(color: Colors.pink, fontSize: 18),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 4.0, bottom: 4.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: 16.0 / 9.0,
                          child: Image(
                            image: AssetImage(posts[index % 3].imageURL),
                          ),
                        ),
                        Text(
                          posts[index % 3].heading,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: myFont,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(children: [
                          IconButton(
                            icon: Icon(
                              isLiked.contains(index)
                                  ? Icons.favorite
                                  : Icons.favorite_outline_rounded,
                              color:
                                  isLiked.contains(index) ? Colors.pink : null,
                            ),
                            onPressed: () {
                              setState(() {
                                if (isLiked.contains(index)) {
                                  isLiked.remove(index);
                                  posts[index % 3].numberOfLikes--;
                                } else {
                                  isLiked.add(index);
                                  posts[index % 3].numberOfLikes++;
                                }
                              });
                            },
                          ),
                          Text(
                            '${posts[index % 3].numberOfLikes}',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: myFont,
                            ),
                          ),
                        ]),
                        Row(children: [
                          IconButton(
                            icon: Icon(Icons.chat_outlined),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (_) => TopicComments(
                                            selectedPostID: index % 3,
                                            isHeart: isLiked.contains(index),
                                          )))
                                  .then((value) {
                                setState(() {
                                  if (value) {
                                    isLiked.add(index);
                                  } else {
                                    isLiked.remove(index);
                                  }
                                });
                              });
                            },
                          ),
                          Text(
                            '${posts[index % 3].numberOfComments}',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: myFont,
                            ),
                          ),
                        ])
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
