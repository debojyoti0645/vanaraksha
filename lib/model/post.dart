

class Post {
  final String id;
  final String title;
  final String location;
  final String description;
  final String imageUrl;
  final int likes;
  final int comments;
  final DateTime createdAt;
  final bool? isLiked;
  final String type;

  Post({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.createdAt,
    required this.type,
    this.isLiked,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      location: json['location'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      likes: json['likes'],
      comments: json['comments'],
      createdAt: DateTime.parse(json['createdAt']),
      type: json['type'],
      isLiked: json['isLiked'],
    );
  }
}

class Comment {
  final String commentId;
  final String userId;
  final DateTime createdAt;
  final String text;
  final String userName;
  final String userAvatar;

  Comment({
    required this.commentId,
    required this.userId,
    required this.createdAt,
    required this.text,
    required this.userName,
    required this.userAvatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'commentId': commentId,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'text': text,
      'userName': userName,
      'userAvatar': userAvatar,
    };
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentId: json['commentId'] ?? '',
      userId: json['userId'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      text: json['text'] ?? '',
      userName: json['userName'] ?? '',
      userAvatar: json['userAvatar'] ?? '',
    );
  }
}