import 'package:flutter_seesee/pages/city/city_page.dart';
import 'package:flutter_seesee/pages/home/home_page.dart';
import 'package:flutter_seesee/pages/login/login_page.dart';
import 'package:flutter_seesee/pages/login/register_page.dart';
import 'package:flutter_seesee/pages/main_page.dart';
import 'package:flutter_seesee/pages/member/edit_member_page.dart';
import 'package:flutter_seesee/pages/member/member_page.dart';
import 'package:flutter_seesee/pages/member/qrcode_page.dart';
import 'package:flutter_seesee/pages/message/message_page.dart';
import 'package:flutter_seesee/pages/profile/profile_page.dart';
import 'package:flutter_seesee/pages/search/search_page.dart';
import 'package:flutter_seesee/pages/settings/settings_page.dart';
import 'package:flutter_seesee/pages/video_add/video_add_page.dart';
import 'package:flutter_seesee/pages/video_detail/video_detail_page.dart';
import 'package:get/get.dart';

///路由名称
class Routers{

  static const String main = '/main';
  static const String home = '/home';
  static const String friend = '/friend';
  static const String addVideo = '/addVideo';
  static const String message = '/friend';
  static const String member = '/member';
  static const String editMember = '/editMember';
  static const String profile = '/profile';
  static const String settings = '/settings';

  static const String search = '/search';
  static const String login = '/login';
  static const String register = '/register';

  static const String qrcode = '/qrcode';

  static const String videoDetail = '/videoDetail';

}

///路由管理者
class RouterManager{
  static final routes = [
    GetPage(name: Routers.main, page: () => const MainPage()),
    GetPage(name: Routers.home, page: () => const HomePage()),
    GetPage(name: Routers.friend, page: () => const CityPage()),
    GetPage(name: Routers.addVideo, page: () => const VideoAddPage()),
    GetPage(name: Routers.message, page: () => const MessagePage()),
    GetPage(name: Routers.member, page: () => MemberPage()),
    GetPage(name: Routers.profile, page: () => const ProfilePage()),
    GetPage(name: Routers.search, page: () => const SearchPage()),
    GetPage(name: Routers.login, page: () => const LoginPage()),
    GetPage(name: Routers.register, page: () => const RegisterPage()),
    GetPage(name: Routers.settings, page: () => const SettingsPage()),
    GetPage(name: Routers.qrcode, page: () => const QrcodePage()),
    GetPage(name: Routers.editMember, page: () => const EditMemberPage()),
    GetPage(name: Routers.videoDetail, page: () => const VideoDetailPage()),
  ];


}
