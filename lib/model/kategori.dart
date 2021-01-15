class Kategori {
  String id;
  String title;
  String content;
  String video;
  String thumb;
  List<String> medias;

  Kategori(
      {this.id, this.title, this.content, this.video, this.thumb, this.medias});

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    video = json['video'];
    thumb = json['thumb'];
    medias = json['medias'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['video'] = this.video;
    data['thumb'] = this.thumb;
    data['medias'] = this.medias;
    return data;
  }
}
