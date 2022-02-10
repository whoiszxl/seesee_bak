import 'dart:collection';

import 'package:flutter_seesee/entity/response/member_info_response.dart';
import 'package:flutter_seesee/http/api_urls.dart';
import 'package:flutter_seesee/http/http_manager.dart';
import 'package:get/get.dart';

///会员接口服务
class MemberApiService extends GetxService {

  ///会员登录接口
  Future<String> login(String username, String password) async {
    Map<String, String> params = HashMap();
    params['username'] = username;
    params['password'] = password;
    var result = await HttpManager.getInstance().post(url: ApiUrls.login, data: params);
    return result;
  }

  ///获取会员详细信息
  Future<MemberInfoResponse> getMemberInfo() async {
    var result = await HttpManager.getInstance().get(url: ApiUrls.memberDetail);
    return MemberInfoResponse.fromJson(result);
  }

  ///会员注册接口
  Future<bool> register(String username, String password) async {
    Map<String, String> params = HashMap();
    params['username'] = username;
    params['password'] = password;
    var result = await HttpManager.getInstance().post(url: ApiUrls.register, data: params);
    return result;
  }

}