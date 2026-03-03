


class Posts {
  final int userId;
  final int? id;
  final String title;
  final String body;

  Posts({
    required this.userId,
    this.id,
    required this.title,
    required this.body,
  });

  factory Posts.fromMap(Map<String, dynamic> jsonData) {
    return Posts(
      id: jsonData['id'],
      userId: jsonData['userId'],
      title: jsonData['title'],
      body: jsonData['body'],
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'userId':userId,
      'id':id,
      'title':title,
      'body':body
    };
  }

  static List<Posts> listOfPosts(List<dynamic>data){
    List<Posts> postList = [];
    for(final item in data ){
      final post = Posts.fromMap(item);
      postList.add(post);

    }
    return postList;

  }



}
