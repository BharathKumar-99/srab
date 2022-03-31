class AddUser {
  final String fullName;
  final String email;
  final String password;
  final String uid;
  final List? followers;
  final List? following;
  final List? post;
  final String? picurl;


  AddUser(
    this.fullName,
    this.email,
    this.password,
    this.uid,
    this.followers,
    this.following,
    this.post,
    this.picurl,
  );

  Map<String ,dynamic> toJson()=>{
    "username":fullName,
    "uid":uid,
    "email":email,
    "password":password,
    "followers":followers,
    "following":following,
    "photo":picurl,
  };
}