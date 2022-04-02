import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String storyname;
  final String id;
  final String uid;
  final String picurl;
  final String authorname;
  final String detailsshort;
  final String fullstory;
  final  publishedDate;
  final List genere;
  final int? likes;
  final List? comments;

  Post(
     {
      required this.storyname,
    required this.id,
    required this.uid,
     required this.picurl,
     required this.authorname,
     required this.detailsshort,
     required this.fullstory,
     required this.publishedDate,
     required this.genere,
      this.likes,
      this.comments,
     }   );



     

   Map<String, dynamic> toJson() => {
        "shortdescription": detailsshort,
        "uid": id,
        "likes": likes,
        "username": authorname,
        "postId": id,
        "datePublished": publishedDate,
        'postUrl': picurl,
       'story':fullstory,
       'genere':genere,
       'storyname':storyname
      };
}
