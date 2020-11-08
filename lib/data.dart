class Posts {
  int postID;
  String imageURL;
  String heading;
  int numberOfLikes;
  int numberOfComments;

  Posts({
    this.postID,
    this.imageURL,
    this.heading,
    this.numberOfLikes,
    this.numberOfComments,
  });
}

final posts = [
  Posts(
    postID: 0,
    imageURL: "assets/images/mental-health1.jpg",
    heading: "Do you overthink?\nShare your views/ experience.",
    numberOfLikes: 8,
    numberOfComments: 12,
  ),
  Posts(
    postID: 1,
    imageURL: "assets/images/mental-health2.jpg",
    heading: "What time of the day do you\nusually feel anxious or\ndepressed?",
    numberOfLikes: 7,
    numberOfComments: 15,
  ),
  Posts(
    postID: 2,
    imageURL: "assets/images/mental-health3.jpg",
    heading: "Can you share some of your\ntips to handle a bad mood?",
    numberOfLikes: 12,
    numberOfComments: 16,
  ),
];
