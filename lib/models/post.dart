class Post {
  int id;
  String link;
  String title;
  String excerpt;
  String content;
  String thumbnail;
  String getThumbnail;

  Post({
    this.id,
    this.link,
    this.title,
    this.excerpt,
    this.content,
    this.thumbnail,
    this.getThumbnail,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json["id"],
        link: json["link"],
        title: json["title"]["rendered"],
        excerpt: json["excerpt"]["rendered"],
        content: json["content"]["rendered"],
        //thumbnail: json["guid"]["rendered"],
        getThumbnail: json["_links"]["wp:attachment"][0]['href']);
  }
}
