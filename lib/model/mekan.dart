class Places {
  Info info;
  List<Mekan> places;

  Places({this.info, this.places});

  Places.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    if (json['places'] != null) {
      places = new List<Mekan>();
      json['places'].forEach((v) {
        places.add(new Mekan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    if (this.places != null) {
      data['places'] = this.places.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int currentPage;
  String pageLimit;
  int totalPage;
  String totalRecord;

  Info({this.currentPage, this.pageLimit, this.totalPage, this.totalRecord});

  Info.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    pageLimit = json['page_limit'];
    totalPage = json['total_page'];
    totalRecord = json['total_record'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['page_limit'] = this.pageLimit;
    data['total_page'] = this.totalPage;
    data['total_record'] = this.totalRecord;
    return data;
  }
}

class Mekan {
  String id;
  String lat;
  String long;
  String title;
  String content;
  String likeCount;
  String favCount;
  String thumb;

  Mekan(
      {this.id,
      this.lat,
      this.long,
      this.title,
      this.content,
      this.likeCount,
      this.favCount,
      this.thumb});

  Mekan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    long = json['long'];
    title = json['title'];
    content = json['content'];
    likeCount = json['like_count'];
    favCount = json['fav_count'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['title'] = this.title;
    data['content'] = this.content;
    data['like_count'] = this.likeCount;
    data['fav_count'] = this.favCount;
    data['thumb'] = this.thumb;
    return data;
  }
}
