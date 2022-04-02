class Post {
  final String storyname;
  final String id;
  final String picurl;
  final String authorname;
  final String detailsshort;
  final String fullstory;
  final String published_date;
  final String Genere;
  final int likes;
  final List? comments;

  Post(
      this.storyname,
      this.id,
      this.picurl,
      this.authorname,
      this.detailsshort,
      this.fullstory,
      this.published_date,
      this.Genere,
      this.likes,
      this.comments);
}
