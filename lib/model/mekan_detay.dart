class MekanDetay {
  String id;
  List<Categories> categories;
  String likeCount;
  Null comCount;
  String favCount;
  String title;
  String content;
  String thumb;
  List<String> medias;
  bool points;

  MekanDetay(
      {this.id,
      this.categories,
      this.likeCount,
      this.comCount,
      this.favCount,
      this.title,
      this.content,
      this.thumb,
      this.medias,
      this.points});

  MekanDetay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    likeCount = json['like_count'];
    comCount = json['com_count'];
    favCount = json['fav_count'];
    title = json['title'];
    content = json['content'];
    thumb = json['thumb'];
    medias = json['medias'].cast<String>();
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    data['like_count'] = this.likeCount;
    data['com_count'] = this.comCount;
    data['fav_count'] = this.favCount;
    data['title'] = this.title;
    data['content'] = this.content;
    data['thumb'] = this.thumb;
    data['medias'] = this.medias;
    data['points'] = this.points;
    return data;
  }
}

class Categories {
  String id;
  String title;

  Categories({this.id, this.title});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}
