class TaskModel {
  final String? id;
  final String title;
  final String description;
  final String? imagePath;
  final bool isCompleted;

  const TaskModel({
    this.id,
    required this.title,
    required this.description,
    this.imagePath,
    this.isCompleted = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id']?.toString() ?? json['_id']?.toString(),
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      imagePath: json['image']?.toString() ?? json['image_path']?.toString(),
      isCompleted: _parseBool(json['is_completed']) ??
          (json['status'] == 'completed') ??
          false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      if (imagePath != null) 'image': imagePath,
      'is_completed': isCompleted,
    };
  }

  static bool? _parseBool(dynamic value) {
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) return value.toLowerCase() == 'true' || value == '1';
    return null;
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imagePath,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}