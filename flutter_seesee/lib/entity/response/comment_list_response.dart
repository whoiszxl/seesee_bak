class CommentListResponse {
  
  List<CommentEntity> records;
  num total;
  num size;
  num current;
  bool optimizeCountSql;
  bool searchCount;
  num pages;

  CommentListResponse(
      {this.records,
        this.total,
        this.size,
        this.current,
        this.optimizeCountSql,
        this.searchCount,
        this.pages});

  CommentListResponse.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <CommentEntity>[];
      json['records'].forEach((v) {
        records.add(CommentEntity.fromJson(v));
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

class CommentEntity {
  String id;
  String videoId;
  num memberId;
  num likeCount;
  num isLiked;
  String avatar;
  String nickname;
  String commentText;
  String commentImgs;
  String at;
  num parentId;
  String createdAt;

  CommentEntity(
      {this.id,
        this.videoId,
        this.likeCount,
        this.isLiked,
        this.memberId,
        this.avatar,
        this.nickname,
        this.commentText,
        this.commentImgs,
        this.at,
        this.parentId,
        this.createdAt});

  CommentEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoId = json['videoId'];
    likeCount = json['likeCount'];
    isLiked = json['isLiked'];
    memberId = json['memberId'];
    avatar = json['avatar'];
    nickname = json['nickname'];
    commentText = json['commentText'];
    commentImgs = json['commentImgs'];
    at = json['at'];
    parentId = json['parentId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['videoId'] = videoId;
    data['likeCount'] = likeCount;
    data['isLiked'] = isLiked;
    data['memberId'] = memberId;
    data['avatar'] = avatar;
    data['nickname'] = nickname;
    data['commentText'] = commentText;
    data['commentImgs'] = commentImgs;
    data['at'] = at;
    data['parentId'] = parentId;
    data['createdAt'] = createdAt;
    return data;
  }
}
