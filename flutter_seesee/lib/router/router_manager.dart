import 'package:flutter_seesee/pages/home/home_page.dart';
import 'package:flutter_seesee/pages/main_page.dart';
import 'package:get/get.dart';

///路由名称
class Routers{

  static const String main = '/main';
  static const String home = '/home';

}

///路由管理者
class RouterManager{
  static final routes = [
    GetPage(name: Routers.main, page: () => const MainPage()),
    GetPage(name: Routers.home, page: () => const HomePage()),
  ];


}
