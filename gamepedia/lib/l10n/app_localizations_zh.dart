// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get signIn => '登录';

  @override
  String get signUp => '注册';

  @override
  String get signOut => '退出登录';

  @override
  String get email => '电子邮件';

  @override
  String get pleaseEnterValidEmail => '请输入有效的电子邮件地址';

  @override
  String get password => '密码';

  @override
  String get pleaseEnterPassword => '请输入您的密码';

  @override
  String get passwordTooShort => '密码至少需要6个字符';

  @override
  String get confirmPassword => '确认密码';

  @override
  String get pleaseConfirmPassword => '请确认您的密码';

  @override
  String get passwordsDoNotMatch => '两次输入的密码不一致';

  @override
  String get dontHaveAccount => '还没有账号？';

  @override
  String get fullName => '全名';

  @override
  String get pleaseEnterFullName => '请输入您的全名';

  @override
  String get noUserFound => '未找到使用该邮箱的用户';

  @override
  String get wrongPassword => '密码错误，请重试。';

  @override
  String get weakPassword => '所提供的密码强度太弱。';

  @override
  String get emailAlreadyInUse => '该邮箱已被注册。';

  @override
  String get invalidEmail => '电子邮件地址无效。';

  @override
  String get genericError => '发生错误，请重试。';

  @override
  String errorOccurred(Object error) {
    return '发生错误：$error';
  }

  @override
  String get reportDetail => '报告详情';

  @override
  String get viewFullImage => '查看完整图片';

  @override
  String get openInGoogleMaps => '在 Google 地图中打开';

  @override
  String get unableToOpenMaps => '无法打开 Google 地图';

  @override
  String get filterCategory => '筛选类别';

  @override
  String get allCategories => '所有类别';

  @override
  String get noReportsInThisCategory => '该类别暂无报告。';

  @override
  String secondsAgo(Object count) {
    return '$count 秒前';
  }

  @override
  String minutesAgo(Object count) {
    return '$count 分钟前';
  }

  @override
  String hoursAgo(Object count) {
    return '$count 小时前';
  }

  @override
  String get oneDayAgo => '1 天前';

  @override
  String get genreAll => '全部';

  @override
  String get genreAdventure => '冒险';

  @override
  String get genreRolePlay => '角色扮演';

  @override
  String get genreShooting => '射击';

  @override
  String get genrePlatformer => '平台';

  @override
  String get genrePuzzle => '益智';

  @override
  String get genreHackAndSlash => '砍杀';

  @override
  String get genreRealTimeStrategy => '即时战略';

  @override
  String get genreTurnBaseStrategy => '回合制战略';

  @override
  String get genreIndie => '独立';

  @override
  String get genreRacing => '竞速';

  @override
  String get genreSport => '运动';

  @override
  String get genreFighting => '格斗';

  @override
  String get genreArcade => '街机';

  @override
  String get genreSimulator => '模拟';

  @override
  String get genrePointAndClick => '点击冒险';

  @override
  String get addPost => '添加帖子';

  @override
  String get takePicture => '拍照';

  @override
  String get chooseFromGallery => '从相册选择';

  @override
  String get cancel => '取消';

  @override
  String get pleaseAddImageAndDescription => '请添加图片和描述。';

  @override
  String get userNotFoundPleaseSignIn => '未找到用户，请登录。';

  @override
  String get postUploadedSuccessfully => '帖子上传成功！';

  @override
  String failedToUploadPost(Object error) {
    return '帖子上传失败：$error';
  }

  @override
  String get locationServicesDisabled => '位置服务已禁用。';

  @override
  String get locationPermissionsDenied => '位置权限被拒绝。';

  @override
  String failedToRetrieveLocation(Object error) {
    return '获取位置失败：$error';
  }

  @override
  String failedToPickImage(Object error) {
    return '选择图片失败：$error';
  }

  @override
  String failedToCompressImage(Object error) {
    return '压缩图片失败：$error';
  }

  @override
  String get generateAnotherDescription => '生成其他描述';

  @override
  String get addBriefDescription => '添加简短描述...';

  @override
  String get post => '发布';

  @override
  String get notificationSent => '✅ 通知发送成功';

  @override
  String notificationFailed(Object error) {
    return '❌ 通知发送失败：$error';
  }

  @override
  String get settings => '设置';

  @override
  String get language => '语言';

  @override
  String get unknownLanguage => '未知语言';

  @override
  String get english => 'English';

  @override
  String get indonesian => 'Bahasa Indonesia';

  @override
  String get korean => 'Korean';

  @override
  String get chinese => 'China';

  @override
  String get thai => 'Thailand';

  @override
  String get spanish => 'Spanish';

  @override
  String get filipino => 'Tagalog';

  @override
  String get russian => 'Russian';

  @override
  String get japanese => 'Japanese';

  @override
  String get arabic => 'Arabic';

  @override
  String get titleDeviceGenreRequired => '标题、设备和类型为必填项。';

  @override
  String get gameAdded => '游戏添加成功！';

  @override
  String failed(Object error) {
    return '游戏上传失败：$error';
  }

  @override
  String get addGameTitle => '添加游戏';

  @override
  String get titleField => '标题';

  @override
  String get studioField => '工作室';

  @override
  String get ratingExample => '评分（如 4.5）';

  @override
  String get releaseDateField => '发布日期';

  @override
  String get priceExample => '价格（如 9.99）';

  @override
  String get deviceField => '设备';

  @override
  String get genreField => '类型';

  @override
  String get descriptionField => '描述';

  @override
  String get screenshotImageUrlField => '截图图片 URL';

  @override
  String get systemRequirements => '系统要求';

  @override
  String get thumbnailUrl => '缩略图 URL';

  @override
  String get termsOfService => '服务条款';

  @override
  String get iUnderstand => '我已了解';

  @override
  String get minimum => '最低配置';

  @override
  String get osField => '操作系统';

  @override
  String get processorField => '处理器';

  @override
  String get memoryField => '内存';

  @override
  String get graphicsField => '显卡';

  @override
  String get storageField => '存储';

  @override
  String get recommended => '推荐配置';

  @override
  String get addButton => '添加';

  @override
  String get home => '首页';

  @override
  String get search => '搜索';

  @override
  String get profile => '个人资料';

  @override
  String get appName => 'GamePedia';

  @override
  String get discoverTagline => '发现、收藏并分享您喜爱的游戏。';

  @override
  String get searchHint => '搜索游戏...';

  @override
  String get filterGamesTitle => '筛选游戏';

  @override
  String get reset => '重置';

  @override
  String get genreLabel => '类型';

  @override
  String get deviceLabel => '设备';

  @override
  String get sortByPrice => '按价格排序';

  @override
  String get applyFilters => '应用筛选';

  @override
  String get noGamesMatchFilters => '没有符合所选筛选条件的游戏。';

  @override
  String get noGamesFound => '未找到游戏。';

  @override
  String get popularGames => '热门游戏';

  @override
  String get newRelease => '新发布';

  @override
  String get showAll => '查看全部';

  @override
  String get browseByGenre => '按类型浏览';

  @override
  String get browseByDevice => '按设备浏览';

  @override
  String get deviceAll => '所有设备';

  @override
  String get deviceWindows => 'Windows';

  @override
  String get devicePlayStation => 'PlayStation';

  @override
  String get deviceXbox => 'Xbox';

  @override
  String get deviceNintendoSwitch => 'Nintendo Switch';

  @override
  String get deviceAndroid => 'Android';

  @override
  String get deviceiOS => 'iOS';

  @override
  String get deviceMac => 'Mac';

  @override
  String get deviceLinux => 'Linux';

  @override
  String get priceSortDefault => '默认';

  @override
  String get priceSortLowToHigh => '从低到高';

  @override
  String get priceSortHighToLow => '从高到低';

  @override
  String get releaseDate => '发布日期';

  @override
  String get price => '价格';

  @override
  String get availableOn => '适用平台';

  @override
  String get aboutThisGame => '关于此游戏';

  @override
  String get screenshots => '截图';

  @override
  String get reviews => '评测';

  @override
  String get addReview => '添加评测';

  @override
  String get viewAll => '查看全部';

  @override
  String get noReviewsYet => '暂无评测';

  @override
  String gamesFound(Object count) {
    return '找到 $count 款游戏';
  }

  @override
  String get userLabelUser => '用户';

  @override
  String get userLabelGuest => '访客';

  @override
  String get register => '注册';

  @override
  String get login => '登录';

  @override
  String get welcomeMessage => '欢迎回来！';

  @override
  String get editProfile => '编辑资料';

  @override
  String get wishlist => '心愿单';

  @override
  String get termsOfServiceShort => '条款';

  @override
  String get logout => '退出登录';

  @override
  String get favoritesMigrated => '收藏夹迁移成功。';

  @override
  String get migrateFavorites => '迁移收藏夹';

  @override
  String get copyright => '© 2026 GamePedia。保留所有权利。';

  @override
  String get addReviewTitle => '添加评测';

  @override
  String get writeYourReview => '撰写您的评测';

  @override
  String get yourName => '您的姓名';

  @override
  String get game => '游戏';

  @override
  String get selectGame => '选择游戏';

  @override
  String get yourRating => '您的评分';

  @override
  String get shareExperience => '分享您对这款游戏的体验...';

  @override
  String get submit => '提交';

  @override
  String get reviewSubmittedSuccessfully => '评测提交成功！';

  @override
  String get fillAllFields => '请填写所有字段并选择评分';

  @override
  String failedToSubmitReview(Object error) {
    return '评测提交失败：$error';
  }

  @override
  String get allReviewsTitle => '所有评测';

  @override
  String reviewsFor(Object gameName) {
    return '$gameName 的评测';
  }

  @override
  String get noReviewsYetMsg => '暂无评测';

  @override
  String failedToLoadGames(Object error) {
    return '游戏加载失败：$error';
  }

  @override
  String gamesSaved(Object count) {
    return '$count个游戏已保存。';
  }

  @override
  String get yourWishlistEmpty => '您的愿望清单是空的 :(';

  @override
  String get startAddingGames => '开始添加您感兴趣的游戏！';

  @override
  String get unableToLoadWishlistGames => '无法加载愿望清单游戏。';

  @override
  String get welcomeToGamePedia => '欢迎来到 GamePedia！';

  @override
  String get termsOfServiceDescription => '在使用 GamePedia 之前，请仔细阅读这些服务条款。';

  @override
  String get tosTermsContent => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  String get biography => '个人简介';

  @override
  String get birthDate => '出生日期';

  @override
  String get location => '位置';

  @override
  String get save => '保存';

  @override
  String get profileSaved => '个人资料保存成功!';

  @override
  String errorSavingProfile(Object error) {
    return '保存个人资料失败: $error';
  }

  @override
  String get locateMe => '定位我';

  @override
  String get locationPermissionDenied => '位置权限被拒绝';

  @override
  String get enableLocationServices => '请启用位置服务';

  @override
  String get locationUpdatedSuccessfully => '位置已成功更新';

  @override
  String get memory => '内存';

  @override
  String get os => '操作系统';

  @override
  String get graphics => '显卡';

  @override
  String get storage => '存储空间';

  @override
  String get processor => '处理器';

  @override
  String get deviceMacOS => 'MacOS';

  @override
  String get deviceIOS => 'iOS';
}
