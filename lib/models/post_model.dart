class PostModel {
  int? id;
  String? title;
  String? content;
  String? created;
  String? modified;
  String? slug;
  String? image;
  String? youtubeUrl;
  int? user;

  PostModel(
      {this.id,
      this.title,
      this.content,
      this.created,
      this.modified,
      this.slug,
      this.image,
      this.youtubeUrl,
      this.user});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    created = json['created'];
    modified = json['modified'];
    slug = json['slug'];
    image = json['image'];
    youtubeUrl = json['youtube_url'];
    user = json['user'];
  }
}
