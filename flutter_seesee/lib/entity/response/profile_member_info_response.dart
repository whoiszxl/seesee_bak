class ProfileMemberInfoResponse {
  String memberId;
  String username;
  String avatar;
  String nickname;
  num gender;
  String birthday;
  String countryCode;
  String country;
  String province;
  String city;
  String district;
  String school;
  num followerCount;
  num attentionCount;
  num likesCount;

  ProfileMemberInfoResponse(
      {this.memberId,
        this.username,
        this.avatar,
        this.nickname,
        this.gender,
        this.birthday,
        this.countryCode,
        this.country,
        this.province,
        this.city,
        this.district,
        this.school,
        this.followerCount,
        this.attentionCount,
        this.likesCount});

  ProfileMemberInfoResponse.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    username = json['username'];
    avatar = json['avatar'];
    nickname = json['nickname'];
    gender = json['gender'];
    birthday = json['birthday'];
    countryCode = json['countryCode'];
    country = json['country'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
    school = json['school'];
    followerCount = json['followerCount'];
    attentionCount = json['attentionCount'];
    likesCount = json['likesCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['memberId'] = memberId;
    data['username'] = username;
    data['avatar'] = avatar;
    data['nickname'] = nickname;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['countryCode'] = countryCode;
    data['country'] = country;
    data['province'] = province;
    data['city'] = city;
    data['district'] = district;
    data['school'] = school;
    data['followerCount'] = followerCount;
    data['attentionCount'] = attentionCount;
    data['likesCount'] = likesCount;
    return data;
  }
}
