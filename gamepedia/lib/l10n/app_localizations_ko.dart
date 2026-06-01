// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get signIn => '로그인';

  @override
  String get signUp => '가입하기';

  @override
  String get signOut => '로그아웃';

  @override
  String get email => '이메일';

  @override
  String get pleaseEnterValidEmail => '유효한 이메일 주소를 입력하세요.';

  @override
  String get password => '비밀번호';

  @override
  String get pleaseEnterPassword => '비밀번호를 입력하세요';

  @override
  String get passwordTooShort => '비밀번호가 너무 짧습니다';

  @override
  String get confirmPassword => '비밀번호 확인';

  @override
  String get pleaseConfirmPassword => '비밀번호를 확인해 주세요';

  @override
  String get passwordsDoNotMatch => '비밀번호가 일치하지 않습니다';

  @override
  String get dontHaveAccount => '계정이 없으신가요?';

  @override
  String get fullName => '성명';

  @override
  String get pleaseEnterFullName => '성명을 모두 입력해 주세요.';

  @override
  String get noUserFound => '사용자를 찾을 수 없습니다.';

  @override
  String get wrongPassword => '잘못된 비밀번호';

  @override
  String get weakPassword => '취약한 비밀번호';

  @override
  String get emailAlreadyInUse => '이미 사용 중인 이메일입니다.';

  @override
  String get invalidEmail => '잘못된 이메일 주소입니다.';

  @override
  String get genericError => '일반 오류';

  @override
  String errorOccurred(Object error) {
    return '오류가 발생했습니다 : $error';
  }

  @override
  String get reportDetail => '보고서 세부 정보';

  @override
  String get viewFullImage => '전체 이미지 보기';

  @override
  String get openInGoogleMaps => '구글 지도에서 열기';

  @override
  String get unableToOpenMaps => '구글 지도를 열 수 없습니다';

  @override
  String get filterCategory => '필터 카테고리';

  @override
  String get allCategories => '모든 카테고리';

  @override
  String get noReportsInThisCategory => '이 카테고리에는 응답이 없습니다.';

  @override
  String secondsAgo(Object count) {
    return '$count 두 번째 전';
  }

  @override
  String minutesAgo(Object count) {
    return '$count 몇 분 전';
  }

  @override
  String hoursAgo(Object count) {
    return '$count 몇 시간 전';
  }

  @override
  String get oneDayAgo => '하루 전';

  @override
  String get genreAll => '모두';

  @override
  String get genreAdventure => '모험';

  @override
  String get genreRolePlay => '역할극';

  @override
  String get genreShooting => '촬영';

  @override
  String get genrePlatformer => '플랫폼 게임';

  @override
  String get genrePuzzle => '퍼즐';

  @override
  String get genreHackAndSlash => '핵 앤 슬래시';

  @override
  String get genreRealTimeStrategy => '실시간 전략';

  @override
  String get genreTurnBaseStrategy => '턴 기반 전략';

  @override
  String get genreIndie => '인디';

  @override
  String get genreRacing => '경마';

  @override
  String get genreSport => '스포츠';

  @override
  String get genreFighting => '화이팅';

  @override
  String get genreArcade => '아케이드';

  @override
  String get genreSimulator => '모의 실험 장치';

  @override
  String get genrePointAndClick => '포인트 앤 클릭';

  @override
  String get addPost => '게시물 추가';

  @override
  String get takePicture => '사진 찍다';

  @override
  String get chooseFromGallery => '갤러리에서 선택하세요';

  @override
  String get cancel => '취소';

  @override
  String get pleaseAddImageAndDescription => '이미지와 설명을 추가해 주세요.';

  @override
  String get userNotFoundPleaseSignIn => '사용자를 찾을 수 없습니다. 로그인하십시오.';

  @override
  String get postUploadedSuccessfully => '게시물이 성공적으로 업로드되었습니다!';

  @override
  String failedToUploadPost(Object error) {
    return '업로드 실패: $error';
  }

  @override
  String get locationServicesDisabled => '위치 서비스 비활성화';

  @override
  String get locationPermissionsDenied => '위치 권한이 거부되었습니다.';

  @override
  String failedToRetrieveLocation(Object error) {
    return '위치 정보를 가져오는 데 실패했습니다: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return '이미지 선택 실패: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return '이미지 압축에 실패했습니다: $error';
  }

  @override
  String get generateAnotherDescription => '다른 설명을 생성하세요';

  @override
  String get addBriefDescription => '간략한 설명을 추가하세요...';

  @override
  String get post => '우편';

  @override
  String get notificationSent => '✅ 알림이 전송되었습니다';

  @override
  String notificationFailed(Object error) {
    return '❌ 알림 실패: $error';
  }

  @override
  String get settings => '설정';

  @override
  String get language => '언어';

  @override
  String get unknownLanguage => '알 수 없는 언어';

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
  String get titleDeviceGenreRequired => '제목, 기기 및 장르는 필수입니다.';

  @override
  String get gameAdded => '게임이 성공적으로 추가되었습니다!';

  @override
  String failed(Object error) {
    return '게임 업로드에 실패했습니다: $error';
  }

  @override
  String get addGameTitle => '게임 추가';

  @override
  String get titleField => '제목';

  @override
  String get studioField => '스튜디오';

  @override
  String get ratingExample => '평점 (예: 4.5)';

  @override
  String get releaseDateField => '출시일';

  @override
  String get priceExample => '가격 (예: 9.99)';

  @override
  String get deviceField => '기기';

  @override
  String get genreField => '장르';

  @override
  String get descriptionField => '설명';

  @override
  String get screenshotImageUrlField => '스크린샷 이미지 URL';

  @override
  String get systemRequirements => '시스템 요구 사항';

  @override
  String get thumbnailUrl => '썸네일 URL';

  @override
  String get termsOfService => '서비스 약관';

  @override
  String get iUnderstand => '이해했습니다';

  @override
  String get minimum => '최소';

  @override
  String get osField => '운영체제';

  @override
  String get processorField => '프로세서';

  @override
  String get memoryField => '메모리';

  @override
  String get graphicsField => '그래픽';

  @override
  String get storageField => '저장 공간';

  @override
  String get recommended => '권장';

  @override
  String get addButton => '추가';

  @override
  String get home => '홈';

  @override
  String get search => '검색';

  @override
  String get profile => '프로필';

  @override
  String get appName => 'GamePedia';

  @override
  String get discoverTagline => '좋아하는 게임을 발견하고 저장하고 공유하세요.';

  @override
  String get searchHint => '게임 검색...';

  @override
  String get filterGamesTitle => '게임 필터';

  @override
  String get reset => '재설정';

  @override
  String get genreLabel => '장르';

  @override
  String get deviceLabel => '기기';

  @override
  String get sortByPrice => '가격순 정렬';

  @override
  String get applyFilters => '필터 적용';

  @override
  String get noGamesMatchFilters => '선택한 필터에 일치하는 게임이 없습니다.';

  @override
  String get noGamesFound => '게임을 찾을 수 없습니다.';

  @override
  String get popularGames => '인기 게임';

  @override
  String get newRelease => '새로운 릴리스';

  @override
  String get showAll => '모두 보기';

  @override
  String get browseByGenre => '장르별 탐색';

  @override
  String get browseByDevice => '기기별 탐색';

  @override
  String get deviceAll => '모든 기기';

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
  String get priceSortDefault => '기본';

  @override
  String get priceSortLowToHigh => '낮은 가격 순';

  @override
  String get priceSortHighToLow => '높은 가격 순';

  @override
  String get releaseDate => '출시일';

  @override
  String get price => '가격';

  @override
  String get availableOn => '사용 가능한 플랫폼';

  @override
  String get aboutThisGame => '이 게임에 대해';

  @override
  String get screenshots => '스크린샷';

  @override
  String get reviews => '리뷰';

  @override
  String get addReview => '리뷰 추가';

  @override
  String get viewAll => '모두 보기';

  @override
  String get noReviewsYet => '아직 리뷰가 없습니다';

  @override
  String gamesFound(Object count) {
    return '$count개의 게임이 검색됨';
  }

  @override
  String get userLabelUser => '사용자';

  @override
  String get userLabelGuest => '게스트';

  @override
  String get register => '가입';

  @override
  String get login => '로그인';

  @override
  String get welcomeMessage => '다시 오신 것을 환영합니다!';

  @override
  String get editProfile => '프로필 수정';

  @override
  String get wishlist => '위시리스트';

  @override
  String get termsOfServiceShort => '약관';

  @override
  String get logout => '로그아웃';

  @override
  String get favoritesMigrated => '즐겨찾기가 성공적으로 이전되었습니다.';

  @override
  String get migrateFavorites => '즐겨찾기 이전';

  @override
  String get copyright => '© 2026 GamePedia. 모든 권리 보유.';

  @override
  String get addReviewTitle => '리뷰 추가';

  @override
  String get writeYourReview => '리뷰 작성';

  @override
  String get yourName => '이름';

  @override
  String get game => '게임';

  @override
  String get selectGame => '게임 선택';

  @override
  String get yourRating => '평점';

  @override
  String get shareExperience => '이 게임에 대한 경험을 공유하세요...';

  @override
  String get submit => '제출';

  @override
  String get reviewSubmittedSuccessfully => '리뷰가 성공적으로 제출되었습니다!';

  @override
  String get fillAllFields => '모든 필드를 입력하고 평점을 선택하세요';

  @override
  String failedToSubmitReview(Object error) {
    return '리뷰 제출 실패: $error';
  }

  @override
  String get allReviewsTitle => '모든 리뷰';

  @override
  String reviewsFor(Object gameName) {
    return '$gameName의 리뷰';
  }

  @override
  String get noReviewsYetMsg => '아직 리뷰가 없습니다';

  @override
  String failedToLoadGames(Object error) {
    return '게임 로드 실패: $error';
  }

  @override
  String gamesSaved(Object count) {
    return '$count개의 게임이 저장되었습니다.';
  }

  @override
  String get yourWishlistEmpty => '위시리스트가 비어있습니다 :(';

  @override
  String get startAddingGames => '관심 있는 게임을 추가하기 시작하세요!';

  @override
  String get unableToLoadWishlistGames => '위시리스트 게임을 로드할 수 없습니다.';

  @override
  String get welcomeToGamePedia => 'GamePedia에 오신 것을 환영합니다!';

  @override
  String get termsOfServiceDescription => 'Please read these Terms of Service carefully before using GamePedia.';

  @override
  String get tosTermsContent => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  String get sysReqOS => '운영 제제';

  @override
  String get sysReqProcessor => '프로세서';

  @override
  String get sysReqMemory => '메모리(RAM)';

  @override
  String get sysReqGraphics => '그래픽 카드';

  @override
  String get sysReqStorage => '스토리지 공간';

  @override
  String get sysReqDirectX => 'DirectX 버전';

  @override
  String get sysReqNetwork => '네트워크';

  @override
  String get sysReqSoundCard => '사운드 카드';
}
