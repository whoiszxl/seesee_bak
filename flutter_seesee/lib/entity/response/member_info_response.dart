class MemberInfoResponse {
  num memberId;
  String username;
  String password;
  String avatar;
  String nickname;
  String googleKey;
  num googleStatus;
  String realName;
  String email;
  String phone;
  num online;
  num gender;
  String birthday;
  String countryCode;
  String country;
  String province;
  String city;
  String district;
  String school;
  String gradeLevel;
  num loginCount;
  num loginErrorCount;
  String lastLogin;

  MemberInfoResponse(
      {this.memberId,
        this.username,
        this.password,
        this.avatar,
        this.nickname,
        this.googleKey,
        this.googleStatus,
        this.realName,
        this.email,
        this.phone,
        this.online,
        this.gender,
        this.birthday,
        this.countryCode,
        this.country,
        this.province,
        this.city,
        this.district,
        this.school,
        this.gradeLevel,
        this.loginCount,
        this.loginErrorCount,
        this.lastLogin});

  MemberInfoResponse.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    username = json['username'];
    password = json['password'];
    avatar = json['avatar'];
    nickname = json['nickname'];
    googleKey = json['googleKey'];
    googleStatus = json['googleStatus'];
    realName = json['realName'];
    email = json['email'];
    phone = json['phone'];
    online = json['online'];
    gender = json['gender'];
    birthday = json['birthday'];
    countryCode = json['countryCode'];
    country = json['country'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
    school = json['school'];
    gradeLevel = json['gradeLevel'];
    loginCount = json['loginCount'];
    loginErrorCount = json['loginErrorCount'];
    lastLogin = json['lastLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['memberId'] = memberId;
    data['username'] = username;
    data['password'] = password;
    data['avatar'] = avatar;
    data['nickname'] = nickname;
    data['googleKey'] = googleKey;
    data['googleStatus'] = googleStatus;
    data['realName'] = realName;
    data['email'] = email;
    data['phone'] = phone;
    data['online'] = online;
    data['gender'] = gender;
    data['birthday'] = birthday;
    data['countryCode'] = countryCode;
    data['country'] = country;
    data['province'] = province;
    data['city'] = city;
    data['district'] = district;
    data['school'] = school;
    data['gradeLevel'] = gradeLevel;
    data['loginCount'] = loginCount;
    data['loginErrorCount'] = loginErrorCount;
    data['lastLogin'] = lastLogin;
    return data;
  }
}
