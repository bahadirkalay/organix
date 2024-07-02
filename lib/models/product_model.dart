class ProductModel {
  num? id;
  String? title;
  String? content;
  String? created;
  String? modified;
  String? slug;
  String? image;
  num? pay;
  num? user;

  ProductModel(
      {this.id,
      this.title,
      this.content,
      this.created,
      this.modified,
      this.slug,
      this.image,
      this.pay,
      this.user});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    created = json['created'];
    modified = json['modified'];
    slug = json['slug'];
    image = json['image'];
    pay = json['pay'];
    user = json['user'];
  }
}
