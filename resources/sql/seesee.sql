-- 会员中心

DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`(
    `id`                        bigint(11) NOT NULL COMMENT '主键ID',
    `username`                  varchar(16) NOT NULL COMMENT '会员名',
    `password`                  varchar(100) NOT NULL COMMENT '密码',
    `avatar`                    varchar(200) NOT NULL COMMENT '头像',
    `nickname`                  varchar(100) DEFAULT '' COMMENT '昵称',
    `google_key`                varchar(32) DEFAULT '' COMMENT '谷歌验证码',
    `google_status`             int(1) DEFAULT '0' COMMENT '谷歌验证码是否开启，默认0不开启, 1开启',
    `real_name`                 varchar(16) DEFAULT '' COMMENT '真实姓名',
    `email`                     varchar(50) DEFAULT '' COMMENT '邮箱',
    `phone`                     varchar(16) DEFAULT '' COMMENT '手机',
    `online`                    tinyint(2) DEFAULT 1 COMMENT '是否在线(0：离线 1：在线)',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uni_idx_username` (`username`),
    UNIQUE KEY `uni_idx_phone` (`phone`),
    INDEX `idx_nickname_phone` (`nickname`, `phone`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '会员表';


DROP TABLE IF EXISTS `ums_member_info`;
CREATE TABLE `ums_member_info`(
    `member_id`                 bigint(11) NOT NULL COMMENT '用户ID',
    `gender`                    tinyint(1) DEFAULT 0 COMMENT '性别(0:未知 1:男；2:女)',
    `birthday`                  datetime DEFAULT NULL COMMENT '生日',
    `country_code`              varchar(5) DEFAULT '' COMMENT '国家码',
    `country`                   varchar(100) DEFAULT '' COMMENT '国家',
    `province`                  varchar(100) DEFAULT '' COMMENT '省份',
    `city`                      varchar(30) DEFAULT '' COMMENT '城市',
    `district`                  varchar(200) DEFAULT '' COMMENT '区域',
    `school`                    varchar(200) DEFAULT '' COMMENT '学校',
    `grade_level`               varchar(255) DEFAULT '' COMMENT '会员等级',
    `login_count`               bigint(11) NOT NULL DEFAULT 0 COMMENT '会员登录次数',
    `login_error_count`         bigint(11) NOT NULL DEFAULT 0 COMMENT '会员登录错误次数',
    `last_login`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`member_id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '会员详情表';


DROP TABLE IF EXISTS `ums_member_blacklist`;
CREATE TABLE `ums_member_blacklist` (
    `id`                        bigint(11) NOT NULL COMMENT '主键ID',
    `member_id`                 bigint(11) NOT NULL COMMENT '会员ID',
    `black_member_id`           bigint(11) NOT NULL COMMENT '黑名单会员ID',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员黑名单表';


DROP TABLE IF EXISTS `ums_member_follower`;
CREATE TABLE `ums_member_follower`(
    `id`                        bigint(11) NOT NULL COMMENT '主键ID',
    `member_id`                 bigint(11) NOT NULL COMMENT '用户ID',
    `follower_id`               bigint(11) NOT NULL COMMENT '粉丝ID',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uni_idx_member_id` (`member_id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '会员粉丝表';

DROP TABLE IF EXISTS `ums_member_attention`;
CREATE TABLE `ums_member_attention`(
    `id`                        bigint(11) NOT NULL COMMENT '主键ID',
    `member_id`                 bigint(11) NOT NULL COMMENT '用户ID',
    `attention_id`              bigint(11) NOT NULL COMMENT '被关注者ID',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uni_idx_member_id` (`member_id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '会员关注表';

DROP TABLE IF EXISTS `ums_member_report`;
CREATE TABLE `ums_member_report`(
    `id`                        bigint(11) NOT NULL COMMENT '主键ID',
    `member_id`                 bigint(11) NOT NULL COMMENT '举报人的用户ID',
    `report_member_id`          bigint(11) NOT NULL COMMENT '被举报的用户ID',
    `report_video_id`           bigint(11) NOT NULL COMMENT '被举报的视频ID',
    `report_comment_id`         bigint(11) NOT NULL COMMENT '被举报的评论ID',
    `title`                     varchar(100) NOT NULL COMMENT '举报标题',
    `content`                   varchar(200) NOT NULL COMMENT '举报内容',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '会员举报表';




DROP TABLE IF EXISTS `vms_video`;
CREATE TABLE `vms_video`(
    `id`                        bigint(11) NOT NULL COMMENT '视频主键ID',
    `member_id`                 bigint(11) NOT NULL COMMENT '会员ID',
    `descs`                     varchar(140) NOT NULL COMMENT '文字内容',
    `cover`                     varchar(300) NOT NULL COMMENT '视频封面',
    `video_url`                 varchar(300) NOT NULL COMMENT '视频文件地址',
    `seconds`                   float(6,2) DEFAULT NULL COMMENT '视频秒数',
    `width`                     int(6) DEFAULT NULL COMMENT '视频宽度',
    `height`                    int(6) DEFAULT NULL COMMENT '视频高度',
    `watch_type`                tinyint(1) DEFAULT 1 COMMENT '观看类型：（1:所有人 2:私密 3:好友可见 4:部分可见 5:对谁不可见）',
    `can_watch_member`          varchar(1024) DEFAULT '' COMMENT '可见用户的id列表，使用逗号 , 分隔',
    `cannot_watch_member`       varchar(1024) DEFAULT '' COMMENT '不可见用户的id列表，使用逗号 , 分隔',
    `channel`                   varchar(10) NOT NULL DEFAULT '' COMMENT '来自什么渠道',
    `address`                   varchar(100) NOT NULL DEFAULT '' COMMENT '定位地址',
    `longitude`                 decimal(10,7) NOT NULL DEFAULT 0 COMMENT '经度',
    `latitude`                  decimal(10,7) NOT NULL DEFAULT 0 COMMENT '纬度',
    `ip`                        varchar(30) NOT NULL DEFAULT '' COMMENT 'ip地址',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '视频表';

DROP TABLE IF EXISTS `vms_video_comment`;
CREATE TABLE `vms_video_comment`(
    `id`                        bigint(11) NOT NULL COMMENT '评论主键ID',
    `video_id`                  bigint(11) NOT NULL COMMENT '视频ID',
    `member_id`                 bigint(11) NOT NULL COMMENT '会员ID',
    `comment_text`              varchar(140) NOT NULL COMMENT '评论内容',
    `comment_imgs`              varchar(150) NOT NULL COMMENT '评论图片',
    `at`                        varchar(150) NOT NULL DEFAULT '' COMMENT '@了谁，下划线分割',
    `parent_id`                 bigint(11) NOT NULL DEFAULT 0 COMMENT '评论父ID，为0则是主评论',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '视频评论表';

DROP TABLE IF EXISTS `vms_bgmusic`;
CREATE TABLE `vms_bgmusic`(
    `id`                        bigint(11) NOT NULL COMMENT '背景音乐主键ID',
    `music_name`                varchar(100) NOT NULL COMMENT '音乐名',
    `singer`                    varchar(100) NOT NULL COMMENT '歌手',
    `cover`                     varchar(255) NOT NULL COMMENT '音乐封面',
    `music_composer`            varchar(100) NOT NULL COMMENT '作曲者',
    `music_lyricist`            varchar(100) NOT NULL COMMENT '作词者',
    `music_copyright`           varchar(255) NOT NULL COMMENT '音乐版权',
    `music_seconds`             float(6,2) DEFAULT NULL COMMENT '视频秒数',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '背景音乐表';

DROP TABLE IF EXISTS `vms_video_counter`;
CREATE TABLE `vms_video_counter`(
    `video_id`                  bigint(11) NOT NULL COMMENT '视频ID，也是主键ID',
    `counter_type`              tinyint(2) NOT NULL DEFAULT 1 COMMENT '计数类型： 1:观看量 2:转发量 3:评论量 4:点赞量',
    `counter_value`             bigint(11) NOT NULL DEFAULT 1 COMMENT '计数值',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`video_id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '视频计数表';

DROP TABLE IF EXISTS `vms_member_like`;
CREATE TABLE `vms_member_like`(
    `like_type`                 tinyint(2) NOT NULL DEFAULT 1 COMMENT '点赞类型： 1:短视频 2:评论',
    `like_id`                   bigint(11) NOT NULL DEFAULT 1 COMMENT '点赞类型相关记录的主键ID',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`video_id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '视频计数表';



DROP TABLE IF EXISTS `vms_video_watch_history`;
CREATE TABLE `vms_video_watch_history`(
  `id` bigint(11) NOT NULL COMMENT '主键ID',
  `member_id` bigint(11) NOT NULL COMMENT '会员ID',
  `video_id` bigint(11) NOT NULL COMMENT '视频ID',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '浏览历史表';



DROP TABLE IF EXISTS `search_history`;
CREATE TABLE `search_history`(
    `id`                        bigint(11) NOT NULL COMMENT '主键ID',
    `member_id`                 bigint(11) NOT NULL COMMENT '会员ID',
    `search_content`            varchar(255) NOT NULL COMMENT '搜索内容',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT '搜索历史表';

DROP TABLE IF EXISTS `fms_file`;
CREATE TABLE `fms_file` (
    `id`                        bigint(11) NOT NULL COMMENT '主键ID',
    `oss_type`                  tinyint(3) DEFAULT NULL COMMENT 'OSS类型 1:阿里云 2:腾讯云 3:七牛云',
    `biz_id`                    bigint(11) DEFAULT NULL COMMENT '业务ID',
    `biz_type`                  tinyint(3) DEFAULT NULL COMMENT '业务类型 1:视频 2:头像 3:背景音乐 4:隐私协议 5:banner图 6:视频cover 7:个人中心背景图',
    `data_type`                 tinyint(3) DEFAULT NULL COMMENT '数据类型 1:目录 2:图片 3:视频 4:音频 5:文档 6:其他',
    `origin_name`               varchar(255) DEFAULT '' COMMENT '原始文件名',
    `relative_path`             varchar(255) DEFAULT '' COMMENT '文件相对路径',
    `url`                       varchar(255) DEFAULT '' COMMENT '文件完整访问链接',
    `file_md5`                  varchar(255) DEFAULT NULL COMMENT '文件md5值',
    `context_type`              varchar(255) DEFAULT '' COMMENT '文件上传类型',
    `filename`                  varchar(255) DEFAULT '' COMMENT '唯一文件名',
    `ext`                       varchar(64) DEFAULT '' COMMENT '后缀',
    `size`                      bigint(20) DEFAULT '0' COMMENT '大小',
    `create_month`              varchar(10) DEFAULT NULL COMMENT '创建年月\n格式：yyyy-MM 用于统计',
    `create_week`               varchar(10) DEFAULT NULL COMMENT '创建时处于当年的第几周\nyyyy-ww 用于统计',
    `create_day`                varchar(12) DEFAULT NULL COMMENT '创建年月日\n格式： yyyy-MM-dd 用于统计',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件表';











---------------------------------------------------
--------------系统管理员模块------------------------
---------------------------------------------------
DROP TABLE IF EXISTS `sys_admin`;
CREATE TABLE `sys_admin`(
    `id` int(7)                 NOT NULL AUTO_INCREMENT COMMENT '主键',
    `username`                  varchar(32) NOT NULL COMMENT '账号',
    `password`                  varchar(256) NOT NULL COMMENT '密码',
    `fullname`                  varchar(32) DEFAULT NULL COMMENT '姓名',
    `mobile`                    varchar(16) DEFAULT NULL COMMENT '手机号',
    `email`                     varchar(128) DEFAULT NULL COMMENT '邮箱',
    `google_code`               varchar(32) DEFAULT '' COMMENT '谷歌验证码',
    `google_status`             int(1) DEFAULT '0' COMMENT '谷歌验证码是否开启，默认不开启 0-不开启； 1-开启',
    `last_login_time`           datetime COMMENT '最后登录时间',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT = '管理员表' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `sys_admin_role`;
CREATE TABLE `sys_admin_role`(
  `id` int(7) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(7) NOT NULL COMMENT '角色ID',
  `admin_id` int(7) NOT NULL COMMENT '管理员ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT = '管理员&角色关联表' ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`(
    `id`                        int(7) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`                      varchar(32) NOT NULL COMMENT '角色名称',
    `code`                      varchar(32) NOT NULL COMMENT '角色代码',
    `description`               varchar(128) DEFAULT NULL COMMENT '角色描述',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT = '角色' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `sys_role_authority`;
CREATE TABLE `sys_role_authority`(
  `id`              int(7) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id`         int(7) NOT NULL COMMENT '角色ID',
  `authority_type`  tinyint(1) NOT NULL COMMENT '权限类型 1:菜单 2:权限',
  `authority_id`    int(7) NOT NULL COMMENT '权限或菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT = '角色&(权限|菜单)关联表' ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`(
    `id`                        int(7) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `parent_id`                 int(7) NULL DEFAULT NULL COMMENT '上级菜单ID',
    `name`                      varchar(64) NOT NULL COMMENT '名称',
    `description`               varchar(256) DEFAULT NULL COMMENT '描述',
    `target_url`                varchar(128) DEFAULT NULL COMMENT '目标地址',
    `sort`                      int(7) NULL DEFAULT NULL COMMENT '排序索引',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT = '系统菜单' ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `sys_privilege`;
CREATE TABLE `sys_privilege`(
    `id`                        int(7) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `menu_id`                   int(7) NULL DEFAULT NULL COMMENT '所属菜单Id',
    `name`                      varchar(128) DEFAULT NULL COMMENT '权限名称',
    `code`                      varchar(128) DEFAULT NULL COMMENT '权限编码',
    `description`               varchar(255) DEFAULT NULL COMMENT '功能描述',
    `url`                       varchar(255) DEFAULT NULL COMMENT '请求接口URL',
    `method`                    varchar(255) DEFAULT NULL COMMENT '接口HTTP请求方式',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `unq_name`(`name`)
) ENGINE = InnoDB CHARSET = utf8mb4 COMMENT = '权限配置' ROW_FORMAT = Dynamic;



DROP TABLE IF EXISTS `sys_admin_login_log`;
CREATE TABLE `sys_admin_login_log` (
    `id`                        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `request_ip`                varchar(50) DEFAULT '' COMMENT '操作IP',
    `admin_id`                  bigint(20) DEFAULT NULL COMMENT '登录人ID',
    `admin_name`                varchar(50) DEFAULT NULL COMMENT '登录人姓名',
    `account`                   varchar(30) DEFAULT '' COMMENT '登录人账号',
    `description`               varchar(255) DEFAULT '' COMMENT '登录描述',
    `login_date`                date DEFAULT NULL COMMENT '登录时间',
    `ua`                        varchar(500) DEFAULT '0' COMMENT '浏览器请求头',
    `browser`                   varchar(100) DEFAULT NULL COMMENT '浏览器名称',
    `browser_version`           varchar(255) DEFAULT NULL COMMENT '浏览器版本',
    `operating_system`          varchar(100) DEFAULT NULL COMMENT '操作系统',
    `location`                  varchar(50) DEFAULT '' COMMENT '登录地点',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IDX_BROWSER` (`browser`) USING BTREE,
  KEY `IDX_OPERATING` (`operating_system`) USING BTREE,
  KEY `IDX_LOGIN_DATE` (`login_date`,`account`) USING BTREE,
  KEY `IDX_ACCOUNT_IP` (`account`,`request_ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='登录日志';


DROP TABLE IF EXISTS `sys_admin_opt_log`;
CREATE TABLE `sys_admin_opt_log` (
    `id`                        bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `request_ip`                varchar(50) DEFAULT '' COMMENT '操作IP',
    `type`                      varchar(5) DEFAULT 'OPT' COMMENT '日志类型\n#LogType{OPT:操作类型;EX:异常类型}',
    `admin_name`                varchar(50) DEFAULT '' COMMENT '操作人',
    `description`               varchar(255) DEFAULT '' COMMENT '操作描述',
    `class_path`                varchar(255) DEFAULT '' COMMENT '类路径',
    `action_method`             varchar(50) DEFAULT '' COMMENT '请求方法',
    `request_uri`               varchar(50) DEFAULT '' COMMENT '请求地址',
    `http_method`               varchar(10) DEFAULT 'GET' COMMENT '请求类型\n#HttpMethod{GET:GET请求;POST:POST请求;PUT:PUT请求;DELETE:DELETE请求;PATCH:PATCH请求;TRACE:TRACE请求;HEAD:HEAD请求;OPTIONS:OPTIONS请求;}',
    `params`                    longtext COMMENT '请求参数',
    `result`                    longtext COMMENT '返回值',
    `ex_desc`                   longtext COMMENT '异常详情信息',
    `ex_detail`                 longtext COMMENT '异常描述',
    `start_time`                timestamp NULL DEFAULT NULL COMMENT '开始时间',
    `finish_time`               timestamp NULL DEFAULT NULL COMMENT '完成时间',
    `consuming_time`            bigint(20) DEFAULT '0' COMMENT '消耗时间',
    `ua`                        varchar(500) DEFAULT '' COMMENT '浏览器',
    `version`                   bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`                    tinyint(3) DEFAULT 0 COMMENT '业务状态',
    `is_deleted`                tinyint(3) DEFAULT 0 COMMENT '逻辑删除 1: 已删除， 0: 未删除',
    `created_by`                varchar(50) NOT NULL COMMENT '创建者',
    `updated_by`                varchar(50) NOT NULL COMMENT '更新者',
    `created_at`                datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at`                datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_type` (`type`) USING BTREE COMMENT '日志类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统日志';