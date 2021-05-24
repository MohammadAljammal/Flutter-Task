class Post {
  String image;
  List<dynamic> tags;
  String text;
  String link;
  int likes;
  String publishDate;
  DateTime publishDateTime;
  bool readable = true;

  Post(
      {this.text,
      this.image,
      this.likes,
      this.link,
      this.tags,
      this.publishDate,
      this.publishDateTime,
      this.readable = true});

  factory Post.fromJson(Map<String, dynamic> jsonData) {
    return Post(
        text: jsonData['text'] as String,
        image: jsonData['image'] as String,
        likes: jsonData['likes'] as int,
        link: jsonData['link'] as String,
        tags: jsonData['tags'],
        publishDateTime: DateTime.parse(jsonData['publishDate']),
        publishDate: jsonData['publishDate'] as String);
  }
}

class Posts {
  List<dynamic> postList = [
    Post(
      text: 'text',
      image: 'image',
      likes: 0,
      link: 'link',
      tags: ['tags'],
      publishDate: 'publishDate',
    ),
  ];

  Posts({this.postList});

  factory Posts.fromJson(Map<String, dynamic> jsonData) {
    return Posts(
      postList: jsonData['postList'],
    );
  }
}
