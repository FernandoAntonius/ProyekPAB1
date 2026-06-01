// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get signIn => 'ログイン';

  @override
  String get signUp => '新規登録';

  @override
  String get signOut => 'ログアウト';

  @override
  String get email => 'メールアドレス';

  @override
  String get pleaseEnterValidEmail => '有効なメールアドレスを入力してください';

  @override
  String get password => 'パスワード';

  @override
  String get pleaseEnterPassword => 'パスワードを入力してください';

  @override
  String get passwordTooShort => 'パスワードは6文字以上で入力してください';

  @override
  String get confirmPassword => 'パスワードの確認';

  @override
  String get pleaseConfirmPassword => 'パスワードを確認してください';

  @override
  String get passwordsDoNotMatch => 'パスワードが一致しません';

  @override
  String get dontHaveAccount => 'アカウントをお持ちでないですか？';

  @override
  String get fullName => '氏名';

  @override
  String get pleaseEnterFullName => '氏名を入力してください';

  @override
  String get noUserFound => 'そのメールアドレスのユーザーが見つかりません';

  @override
  String get wrongPassword => 'パスワードが間違っています。もう一度お試しください。';

  @override
  String get weakPassword => '指定されたパスワードは弱すぎます。';

  @override
  String get emailAlreadyInUse => 'そのメールアドレスはすでに使用されています。';

  @override
  String get invalidEmail => 'メールアドレスの形式が正しくありません。';

  @override
  String get genericError => 'エラーが発生しました。もう一度お試しください。';

  @override
  String errorOccurred(Object error) {
    return 'エラーが発生しました: $error';
  }

  @override
  String get reportDetail => 'レポート詳細';

  @override
  String get viewFullImage => 'フル画像を表示';

  @override
  String get openInGoogleMaps => 'Google マップで開く';

  @override
  String get unableToOpenMaps => 'Google マップを開けません';

  @override
  String get filterCategory => 'カテゴリーで絞り込む';

  @override
  String get allCategories => 'すべてのカテゴリー';

  @override
  String get noReportsInThisCategory => 'このカテゴリーにレポートはありません。';

  @override
  String secondsAgo(Object count) {
    return '$count秒前';
  }

  @override
  String minutesAgo(Object count) {
    return '$count分前';
  }

  @override
  String hoursAgo(Object count) {
    return '$count時間前';
  }

  @override
  String get oneDayAgo => '1日前';

  @override
  String get genreAll => 'すべて';

  @override
  String get genreAdventure => 'アドベンチャー';

  @override
  String get genreRolePlay => 'ロールプレイング';

  @override
  String get genreShooting => 'シューティング';

  @override
  String get genrePlatformer => 'アクション';

  @override
  String get genrePuzzle => 'パズル';

  @override
  String get genreHackAndSlash => 'ハック＆スラッシュ';

  @override
  String get genreRealTimeStrategy => 'リアルタイムストラテジー';

  @override
  String get genreTurnBaseStrategy => 'ターン制ストラテジー';

  @override
  String get genreIndie => 'インディー';

  @override
  String get genreRacing => 'レーシング';

  @override
  String get genreSport => 'スポーツ';

  @override
  String get genreFighting => '格闘';

  @override
  String get genreArcade => 'アーケード';

  @override
  String get genreSimulator => 'シミュレーター';

  @override
  String get genrePointAndClick => 'ポイント＆クリック';

  @override
  String get addPost => '投稿を追加';

  @override
  String get takePicture => '写真を撮る';

  @override
  String get chooseFromGallery => 'ギャラリーから選ぶ';

  @override
  String get cancel => 'キャンセル';

  @override
  String get pleaseAddImageAndDescription => '画像と説明を追加してください。';

  @override
  String get userNotFoundPleaseSignIn => 'ユーザーが見つかりません。ログインしてください。';

  @override
  String get postUploadedSuccessfully => '投稿が正常にアップロードされました！';

  @override
  String failedToUploadPost(Object error) {
    return '投稿のアップロードに失敗しました: $error';
  }

  @override
  String get locationServicesDisabled => '位置情報サービスが無効になっています。';

  @override
  String get locationPermissionsDenied => '位置情報の許可が拒否されました。';

  @override
  String failedToRetrieveLocation(Object error) {
    return '位置情報の取得に失敗しました: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return '画像の選択に失敗しました: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return '画像の圧縮に失敗しました: $error';
  }

  @override
  String get generateAnotherDescription => '別の説明を生成する';

  @override
  String get addBriefDescription => '簡単な説明を追加...';

  @override
  String get post => '投稿する';

  @override
  String get notificationSent => '✅ 通知が正常に送信されました';

  @override
  String notificationFailed(Object error) {
    return '❌ 通知の送信に失敗しました: $error';
  }

  @override
  String get settings => '設定';

  @override
  String get language => '言語';

  @override
  String get unknownLanguage => '不明な言語';

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
  String get titleDeviceGenreRequired => 'タイトル、デバイス、ジャンルは必須です。';

  @override
  String get gameAdded => 'ゲームが正常に追加されました！';

  @override
  String failed(Object error) {
    return 'ゲームのアップロードに失敗しました: $error';
  }

  @override
  String get addGameTitle => 'ゲームを追加';

  @override
  String get titleField => 'タイトル';

  @override
  String get studioField => 'スタジオ';

  @override
  String get ratingExample => '評価（例：4.5）';

  @override
  String get releaseDateField => '発売日';

  @override
  String get priceExample => '価格（例：9.99）';

  @override
  String get deviceField => 'デバイス';

  @override
  String get genreField => 'ジャンル';

  @override
  String get descriptionField => '説明';

  @override
  String get screenshotImageUrlField => 'スクリーンショット画像URL';

  @override
  String get systemRequirements => '動作環境';

  @override
  String get thumbnailUrl => 'サムネイル URL';

  @override
  String get termsOfService => '利用規約';

  @override
  String get iUnderstand => '確認しました';

  @override
  String get minimum => '最低';

  @override
  String get osField => 'OS';

  @override
  String get processorField => 'プロセッサー';

  @override
  String get memoryField => 'メモリ';

  @override
  String get graphicsField => 'グラフィック';

  @override
  String get storageField => 'ストレージ';

  @override
  String get recommended => '推奨';

  @override
  String get addButton => '追加';

  @override
  String get home => 'ホーム';

  @override
  String get search => '検索';

  @override
  String get profile => 'プロフィール';

  @override
  String get appName => 'GamePedia';

  @override
  String get discoverTagline => 'お気に入りのゲームを見つけて、保存して、シェアしよう。';

  @override
  String get searchHint => 'ゲームを検索...';

  @override
  String get filterGamesTitle => 'ゲームを絞り込む';

  @override
  String get reset => 'リセット';

  @override
  String get genreLabel => 'ジャンル';

  @override
  String get deviceLabel => 'デバイス';

  @override
  String get sortByPrice => '価格順に並べ替え';

  @override
  String get applyFilters => 'フィルターを適用';

  @override
  String get noGamesMatchFilters => '選択したフィルターに一致するゲームがありません。';

  @override
  String get noGamesFound => 'ゲームが見つかりません。';

  @override
  String get popularGames => '人気ゲーム';

  @override
  String get newRelease => '新着';

  @override
  String get showAll => 'すべて表示';

  @override
  String get browseByGenre => 'ジャンルで探す';

  @override
  String get browseByDevice => 'デバイスで探す';

  @override
  String get deviceAll => 'すべてのデバイス';

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
  String get priceSortDefault => 'デフォルト';

  @override
  String get priceSortLowToHigh => '安い順';

  @override
  String get priceSortHighToLow => '高い順';

  @override
  String get releaseDate => '発売日';

  @override
  String get price => '価格';

  @override
  String get availableOn => '対応プラットフォーム';

  @override
  String get aboutThisGame => 'このゲームについて';

  @override
  String get screenshots => 'スクリーンショット';

  @override
  String get reviews => 'レビュー';

  @override
  String get addReview => 'レビューを追加';

  @override
  String get viewAll => 'すべて見る';

  @override
  String get noReviewsYet => 'まだレビューがありません';

  @override
  String gamesFound(Object count) {
    return '$count件のゲームが見つかりました';
  }

  @override
  String get userLabelUser => 'ユーザー';

  @override
  String get userLabelGuest => 'ゲスト';

  @override
  String get register => '登録';

  @override
  String get login => 'ログイン';

  @override
  String get welcomeMessage => 'おかえりなさい！';

  @override
  String get editProfile => 'プロフィールを編集';

  @override
  String get wishlist => 'ウィッシュリスト';

  @override
  String get termsOfServiceShort => '利用規約';

  @override
  String get logout => 'ログアウト';

  @override
  String get favoritesMigrated => 'お気に入りが正常に移行されました。';

  @override
  String get migrateFavorites => 'お気に入りを移行';

  @override
  String get copyright => '© 2026 GamePedia. 全著作権所有。';

  @override
  String get addReviewTitle => 'レビューを追加';

  @override
  String get writeYourReview => 'レビューを書く';

  @override
  String get yourName => 'お名前';

  @override
  String get game => 'ゲーム';

  @override
  String get selectGame => 'ゲームを選択';

  @override
  String get yourRating => 'あなたの評価';

  @override
  String get shareExperience => 'このゲームの感想を共有してください...';

  @override
  String get submit => '送信';

  @override
  String get reviewSubmittedSuccessfully => 'レビューが正常に送信されました！';

  @override
  String get fillAllFields => 'すべての項目を入力して評価を選択してください';

  @override
  String failedToSubmitReview(Object error) {
    return 'レビューの送信に失敗しました: $error';
  }

  @override
  String get allReviewsTitle => 'すべてのレビュー';

  @override
  String reviewsFor(Object gameName) {
    return '$gameNameのレビュー';
  }

  @override
  String get noReviewsYetMsg => 'まだレビューがありません';

  @override
  String failedToLoadGames(Object error) {
    return 'ゲームの読み込みに失敗しました: $error';
  }

  @override
  String gamesSaved(Object count) {
    return '$count個のゲームが保存されています。';
  }

  @override
  String get yourWishlistEmpty => 'ウィッシュリストが空です :(';

  @override
  String get startAddingGames => '興味のあるゲームを追加し始めましょう！';

  @override
  String get unableToLoadWishlistGames => 'ウィッシュリストのゲームを読み込めません。';

  @override
  String get welcomeToGamePedia => 'GamePediaへようこそ！';

  @override
  String get termsOfServiceDescription => 'GamePediaを使用する前に、これらの利用規約をよくお読みください。';

  @override
  String get tosTermsContent => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  String get sysReqOS => 'オペレーティングシステム';

  @override
  String get sysReqProcessor => 'プロセッサ';

  @override
  String get sysReqMemory => 'メモリ (RAM)';

  @override
  String get sysReqGraphics => 'グラフィックスカード';

  @override
  String get sysReqStorage => 'ストレージスペース';

  @override
  String get sysReqDirectX => 'DirectXバージョン';

  @override
  String get sysReqNetwork => 'ネットワーク';

  @override
  String get sysReqSoundCard => 'サウンドカード';
}
