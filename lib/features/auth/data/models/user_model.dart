class userModel{
  String? id;
  String? imagePath;
  String? username;

  userModel({this.id, this.imagePath, this.username});
  userModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    imagePath = json['image_path'];
  }
}