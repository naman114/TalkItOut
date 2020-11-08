import 'package:flutter/material.dart';
import 'data.dart';
import 'main.dart';

class TopicComments extends StatefulWidget {
  final int selectedPostID;
  bool isHeart;

  TopicComments({this.selectedPostID, this.isHeart});

  @override
  _TopicCommentsState createState() => _TopicCommentsState();
}

class _TopicCommentsState extends State<TopicComments> {
  List<String> comments = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque at aliquet enim. Cras auctor, metus vitae porttitor egestas, risus odio facilisis dolor, et elementum nulla nunc non enim.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque at aliquet enim."
  ];

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop(widget.isHeart);
                },
              ),
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(alignment: Alignment.center, children: [
                  Image(
                    image: AssetImage(posts[widget.selectedPostID].imageURL),
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      SizedBox(height: 70),
                      Text(
                        posts[widget.selectedPostID].heading,
                        style: TextStyle(color: Colors.white, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              widget.isHeart
                                  ? Icons.favorite
                                  : Icons.favorite_outline_rounded,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                if (widget.isHeart) {
                                  widget.isHeart = false;
                                  posts[widget.selectedPostID].numberOfLikes--;
                                } else {
                                  widget.isHeart = true;
                                  posts[widget.selectedPostID].numberOfLikes++;
                                }
                              });
                            },
                          ),
                          Text(
                            '${posts[widget.selectedPostID].numberOfLikes}',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: myFont,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ]),
              ),
              expandedHeight: 176,
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications_outlined),
                  onPressed: () {},
                ),
              ],
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  unselectedLabelColor: Colors.grey[700],
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.pink,
                  ),
                  tabs: [
                    Container(
                      width: 50,
                      height: 20,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Top",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "New",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "My",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Counselor",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      ListView.separated(
                        separatorBuilder: (_, __) => SizedBox(
                          height: 15,
                        ),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index < comments.length) {
                            return Row(children: [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.person),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      comments[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: myFont,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                            ]);
                          }
                        },
                        itemCount: comments.length,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              controller: myController,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  hintText: "Write a comment...",
                                  contentPadding: EdgeInsets.all(20)),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_right_outlined),
                            onPressed: () {
                              setState(() {
                                comments.add(myController.text.toString());
                                myController.text = "";
                              });
                            },
                          ),
                        ]),
                      ),
                    ],
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
