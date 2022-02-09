class VideoListResponse {
  List<VideoEntity> records;
  int total;
  int size;
  int current;
  bool optimizeCountSql;
  bool searchCount;
  int pages;

  VideoListResponse(
      {this.records,
        this.total,
        this.size,
        this.current,
        this.optimizeCountSql,
        this.searchCount,
        this.pages});

  VideoListResponse.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <VideoEntity>[];
      json['records'].forEach((v) {
        records.add(VideoEntity.fromJson(v));
      });
    }
    total = json['total'];
    size = json['size'];
    current = json['current'];
    optimizeCountSql = json['optimizeCountSql'];
    searchCount = json['searchCount'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (records != null) {
      data['records'] = records.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['size'] = size;
    data['current'] = current;
    data['optimizeCountSql'] = optimizeCountSql;
    data['searchCount'] = searchCount;
    data['pages'] = pages;
    return data;
  }
}

class VideoEntity {
  String id;
  String descs;
  String cover;
  String videoUrl;
  num seconds;
  num width;
  num height;
  String channel;
  String address;
  num longitude;
  num latitude;
  String ip;
  num memberId;
  String avatar;
  String nickname;
  int lickCount;
  int commentCount;
  int shareCount;
  int hasLiked;

  VideoEntity(
      {this.id,
        this.descs,
        this.cover,
        this.videoUrl,
        this.seconds,
        this.width,
        this.height,
        this.channel,
        this.address,
        this.longitude,
        this.latitude,
        this.ip,
        this.memberId,
        this.avatar,
        this.nickname,
        this.lickCount,
        this.commentCount,
        this.shareCount,
        this.hasLiked});

  VideoEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descs = json['descs'];
    cover = json['cover'];
    videoUrl = json['videoUrl'];
    seconds = json['seconds'];
    width = json['width'];
    height = json['height'];
    channel = json['channel'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    ip = json['ip'];
    memberId = json['memberId'];
    avatar = json['avatar'];
    nickname = json['nickname'];
    lickCount = json['lickCount'];
    commentCount = json['commentCount'];
    shareCount = json['shareCount'];
    hasLiked = json['hasLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['descs'] = descs;
    data['cover'] = cover;
    data['videoUrl'] = videoUrl;
    data['seconds'] = seconds;
    data['width'] = width;
    data['height'] = height;
    data['channel'] = channel;
    data['address'] = address;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['ip'] = ip;
    data['memberId'] = memberId;
    data['avatar'] = avatar;
    data['nickname'] = nickname;
    data['lickCount'] = lickCount;
    data['commentCount'] = commentCount;
    data['shareCount'] = shareCount;
    data['hasLiked'] = hasLiked;
    return data;
  }
}
