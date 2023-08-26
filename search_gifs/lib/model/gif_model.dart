class GitModel {
  String gif;

  GitModel({
    required this.gif,
  });

  factory GitModel.fromMap(Map map) {
    return GitModel(gif: map['images']['fixed_height']['url']);
  }
}
