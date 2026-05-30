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
  String get english => '영어';

  @override
  String get indonesian => '인도네시아';

  @override
  String get korean => '한국인';

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
}
