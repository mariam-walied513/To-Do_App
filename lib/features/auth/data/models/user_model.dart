class userModel {
  String? id;
  String? imagePath;
  String? username;

  userModel({this.id, this.imagePath, this.username});

  userModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString(); 
    username = json['username']?.toString();
    imagePath = json['image_path']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['image_path'] = imagePath;
    return data;
  }
}