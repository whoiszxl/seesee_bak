class ApiUrls {

  static const String baseUrl = 'http://192.168.4.153';

  ///首页获取推荐视频
  static const String homeRecommendVideoList = "/video/video/recommend/feed/list";

  ///查询自己的视频列表
  static const String myVideoList = "/video/video/list";
  static const String videoLike = "/video/video/like";
  static const String videoDislike = "/video/video/dislike";


  ///获取评论列表
  static const String commentList = "/video/comment/list";
  static const String commentPublish = "/video/comment/publish";
  static const String commentLike = "/video/comment/like";
  static const String commentDislike = "/video/comment/dislike";

  static const String login = "/member/member/login";
  static const String register = "/member/member/register";
  static const String memberDetail = "/member/member/detail";
}