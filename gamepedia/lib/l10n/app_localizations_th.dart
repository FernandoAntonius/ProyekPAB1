// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get signIn => 'เข้าสู่ระบบ';

  @override
  String get signUp => 'สมัครสมาชิก';

  @override
  String get signOut => 'ออกจากระบบ';

  @override
  String get email => 'อีเมล';

  @override
  String get pleaseEnterValidEmail => 'กรุณากรอกอีเมลที่ถูกต้อง';

  @override
  String get password => 'รหัสผ่าน';

  @override
  String get pleaseEnterPassword => 'กรุณากรอกรหัสผ่านของคุณ';

  @override
  String get passwordTooShort => 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร';

  @override
  String get confirmPassword => 'ยืนยันรหัสผ่าน';

  @override
  String get pleaseConfirmPassword => 'กรุณายืนยันรหัสผ่านของคุณ';

  @override
  String get passwordsDoNotMatch => 'รหัสผ่านไม่ตรงกัน';

  @override
  String get dontHaveAccount => 'ยังไม่มีบัญชี?';

  @override
  String get fullName => 'ชื่อ-นามสกุล';

  @override
  String get pleaseEnterFullName => 'กรุณากรอกชื่อ-นามสกุลของคุณ';

  @override
  String get noUserFound => 'ไม่พบผู้ใช้ที่ใช้อีเมลนี้';

  @override
  String get wrongPassword => 'รหัสผ่านไม่ถูกต้อง กรุณาลองอีกครั้ง';

  @override
  String get weakPassword => 'รหัสผ่านที่ระบุอ่อนแอเกินไป';

  @override
  String get emailAlreadyInUse => 'มีบัญชีที่ใช้อีเมลนี้อยู่แล้ว';

  @override
  String get invalidEmail => 'ที่อยู่อีเมลไม่ถูกต้อง';

  @override
  String get genericError => 'เกิดข้อผิดพลาด กรุณาลองอีกครั้ง';

  @override
  String errorOccurred(Object error) {
    return 'เกิดข้อผิดพลาด: $error';
  }

  @override
  String get reportDetail => 'รายละเอียดรายงาน';

  @override
  String get viewFullImage => 'ดูภาพเต็ม';

  @override
  String get openInGoogleMaps => 'เปิดใน Google Maps';

  @override
  String get unableToOpenMaps => 'ไม่สามารถเปิด Google Maps ได้';

  @override
  String get filterCategory => 'กรองตามหมวดหมู่';

  @override
  String get allCategories => 'ทุกหมวดหมู่';

  @override
  String get noReportsInThisCategory => 'ไม่มีรายงานในหมวดหมู่นี้';

  @override
  String secondsAgo(Object count) {
    return '$count วินาทีที่แล้ว';
  }

  @override
  String minutesAgo(Object count) {
    return '$count นาทีที่แล้ว';
  }

  @override
  String hoursAgo(Object count) {
    return '$count ชั่วโมงที่แล้ว';
  }

  @override
  String get oneDayAgo => '1 วันที่แล้ว';

  @override
  String get genreAll => 'ทั้งหมด';

  @override
  String get genreAdventure => 'ผจญภัย';

  @override
  String get genreRolePlay => 'สวมบทบาท';

  @override
  String get genreShooting => 'ยิงปืน';

  @override
  String get genrePlatformer => 'แพลตฟอร์เมอร์';

  @override
  String get genrePuzzle => 'ปริศนา';

  @override
  String get genreHackAndSlash => 'แฮ็กแอนด์สแลช';

  @override
  String get genreRealTimeStrategy => 'วางแผนแบบเรียลไทม์';

  @override
  String get genreTurnBaseStrategy => 'วางแผนแบบผลัดตา';

  @override
  String get genreIndie => 'อินดี้';

  @override
  String get genreRacing => 'แข่งรถ';

  @override
  String get genreSport => 'กีฬา';

  @override
  String get genreFighting => 'ต่อสู้';

  @override
  String get genreArcade => 'อาร์เคด';

  @override
  String get genreSimulator => 'จำลองสถานการณ์';

  @override
  String get genrePointAndClick => 'ชี้แล้วคลิก';

  @override
  String get addPost => 'เพิ่มโพสต์';

  @override
  String get takePicture => 'ถ่ายรูป';

  @override
  String get chooseFromGallery => 'เลือกจากแกลเลอรี';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get pleaseAddImageAndDescription => 'กรุณาเพิ่มรูปภาพและคำอธิบาย';

  @override
  String get userNotFoundPleaseSignIn => 'ไม่พบผู้ใช้ กรุณาเข้าสู่ระบบ';

  @override
  String get postUploadedSuccessfully => 'อัปโหลดโพสต์สำเร็จ!';

  @override
  String failedToUploadPost(Object error) {
    return 'อัปโหลดโพสต์ไม่สำเร็จ: $error';
  }

  @override
  String get locationServicesDisabled => 'บริการระบุตำแหน่งถูกปิดใช้งาน';

  @override
  String get locationPermissionsDenied => 'ถูกปฏิเสธสิทธิ์การเข้าถึงตำแหน่ง';

  @override
  String failedToRetrieveLocation(Object error) {
    return 'ไม่สามารถดึงตำแหน่งได้: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return 'ไม่สามารถเลือกรูปภาพได้: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return 'ไม่สามารถบีบอัดรูปภาพได้: $error';
  }

  @override
  String get generateAnotherDescription => 'สร้างคำอธิบายใหม่';

  @override
  String get addBriefDescription => 'เพิ่มคำอธิบายสั้นๆ...';

  @override
  String get post => 'โพสต์';

  @override
  String get notificationSent => '✅ ส่งการแจ้งเตือนสำเร็จ';

  @override
  String notificationFailed(Object error) {
    return '❌ ส่งการแจ้งเตือนไม่สำเร็จ: $error';
  }

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get language => 'ภาษา';

  @override
  String get unknownLanguage => 'ภาษาไม่รู้จัก';

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
  String get titleDeviceGenreRequired => 'ต้องระบุชื่อ อุปกรณ์ และแนวเกม';

  @override
  String get gameAdded => 'เพิ่มเกมสำเร็จ!';

  @override
  String failed(Object error) {
    return 'อัปโหลดเกมไม่สำเร็จ: $error';
  }

  @override
  String get addGameTitle => 'เพิ่มเกม';

  @override
  String get titleField => 'ชื่อ';

  @override
  String get studioField => 'สตูดิโอ';

  @override
  String get ratingExample => 'คะแนน (เช่น 4.5)';

  @override
  String get releaseDateField => 'วันที่วางจำหน่าย';

  @override
  String get priceExample => 'ราคา (เช่น 9.99)';

  @override
  String get deviceField => 'อุปกรณ์';

  @override
  String get genreField => 'แนวเกม';

  @override
  String get descriptionField => 'คำอธิบาย';

  @override
  String get screenshotImageUrlField => 'URL ภาพหน้าจอ';

  @override
  String get systemRequirements => 'ความต้องการของระบบ';

  @override
  String get thumbnailUrl => 'URL รูปขนาดย่อ';

  @override
  String get termsOfService => 'ข้อกำหนดในการให้บริการ';

  @override
  String get iUnderstand => 'ฉันเข้าใจ';

  @override
  String get minimum => 'ขั้นต่ำ';

  @override
  String get osField => 'ระบบปฏิบัติการ';

  @override
  String get processorField => 'โปรเซสเซอร์';

  @override
  String get memoryField => 'หน่วยความจำ';

  @override
  String get graphicsField => 'การ์ดจอ';

  @override
  String get storageField => 'พื้นที่จัดเก็บ';

  @override
  String get recommended => 'แนะนำ';

  @override
  String get addButton => 'เพิ่ม';

  @override
  String get home => 'หน้าแรก';

  @override
  String get search => 'ค้นหา';

  @override
  String get profile => 'โปรไฟล์';

  @override
  String get appName => 'GamePedia';

  @override
  String get discoverTagline => 'ค้นพบ บันทึก และแชร์เกมโปรดของคุณ';

  @override
  String get searchHint => 'ค้นหาเกม...';

  @override
  String get filterGamesTitle => 'กรองเกม';

  @override
  String get reset => 'รีเซ็ต';

  @override
  String get genreLabel => 'แนวเกม';

  @override
  String get deviceLabel => 'อุปกรณ์';

  @override
  String get sortByPrice => 'เรียงตามราคา';

  @override
  String get applyFilters => 'ใช้ตัวกรอง';

  @override
  String get noGamesMatchFilters => 'ไม่มีเกมที่ตรงกับตัวกรองที่เลือก';

  @override
  String get noGamesFound => 'ไม่พบเกม';

  @override
  String get popularGames => 'เกมยอดนิยม';

  @override
  String get newRelease => 'เกมใหม่';

  @override
  String get showAll => 'ดูทั้งหมด';

  @override
  String get browseByGenre => 'เรียกดูตามแนวเกม';

  @override
  String get browseByDevice => 'เรียกดูตามอุปกรณ์';

  @override
  String get deviceAll => 'ทุกอุปกรณ์';

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
  String get priceSortDefault => 'ค่าเริ่มต้น';

  @override
  String get priceSortLowToHigh => 'ต่ำไปสูง';

  @override
  String get priceSortHighToLow => 'สูงไปต่ำ';

  @override
  String get releaseDate => 'วันที่วางจำหน่าย';

  @override
  String get price => 'ราคา';

  @override
  String get availableOn => 'ใช้งานได้บน';

  @override
  String get aboutThisGame => 'เกี่ยวกับเกมนี้';

  @override
  String get screenshots => 'ภาพหน้าจอ';

  @override
  String get reviews => 'รีวิว';

  @override
  String get addReview => 'เพิ่มรีวิว';

  @override
  String get viewAll => 'ดูทั้งหมด';

  @override
  String get noReviewsYet => 'ยังไม่มีรีวิว';

  @override
  String gamesFound(Object count) {
    return 'พบ $count เกม';
  }

  @override
  String get userLabelUser => 'ผู้ใช้';

  @override
  String get userLabelGuest => 'ผู้เยี่ยมชม';

  @override
  String get register => 'ลงทะเบียน';

  @override
  String get login => 'เข้าสู่ระบบ';

  @override
  String get welcomeMessage => 'ยินดีต้อนรับกลับมา!';

  @override
  String get editProfile => 'แก้ไขโปรไฟล์';

  @override
  String get wishlist => 'รายการที่อยากได้';

  @override
  String get termsOfServiceShort => 'ข้อกำหนด';

  @override
  String get logout => 'ออกจากระบบ';

  @override
  String get favoritesMigrated => 'ย้ายรายการโปรดสำเร็จ';

  @override
  String get migrateFavorites => 'ย้ายรายการโปรด';

  @override
  String get copyright => '© 2026 GamePedia. สงวนลิขสิทธิ์ทั้งหมด';

  @override
  String get addReviewTitle => 'เพิ่มรีวิว';

  @override
  String get writeYourReview => 'เขียนรีวิวของคุณ';

  @override
  String get yourName => 'ชื่อของคุณ';

  @override
  String get game => 'เกม';

  @override
  String get selectGame => 'เลือกเกม';

  @override
  String get yourRating => 'คะแนนของคุณ';

  @override
  String get shareExperience => 'แชร์ประสบการณ์ของคุณกับเกมนี้...';

  @override
  String get submit => 'ส่ง';

  @override
  String get reviewSubmittedSuccessfully => 'ส่งรีวิวสำเร็จ!';

  @override
  String get fillAllFields => 'กรุณากรอกข้อมูลทุกช่องและเลือกคะแนน';

  @override
  String failedToSubmitReview(Object error) {
    return 'ส่งรีวิวไม่สำเร็จ: $error';
  }

  @override
  String get allReviewsTitle => 'รีวิวทั้งหมด';

  @override
  String reviewsFor(Object gameName) {
    return 'รีวิวสำหรับ $gameName';
  }

  @override
  String get noReviewsYetMsg => 'ยังไม่มีรีวิว';

  @override
  String failedToLoadGames(Object error) {
    return 'โหลดเกมไม่สำเร็จ: $error';
  }

  @override
  String gamesSaved(Object count) {
    return '$count เกมที่บันทึกไว้ลำแน่';
  }

  @override
  String get yourWishlistEmpty => 'ลิสต์ที่อยากไดืของคุณว่างเปล่า :(';

  @override
  String get startAddingGames => 'เริ่มเพิ่มเกมที่คุณสนใจ!';

  @override
  String get unableToLoadWishlistGames => 'ไม่สามารถโหลดเกมลิสต์ที่อยากไดื';

  @override
  String get welcomeToGamePedia => 'ยินดีต้อนรับการเจอ กาเมฟัล!';

  @override
  String get termsOfServiceDescription => 'โปรดอ่านข้อกำหนดปันนิคนี้อย่างถี่่องถ้วจันหรือ ใช้ GamePedia';

  @override
  String get tosTermsContent => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  String get biography => 'ชีวประวัติ';

  @override
  String get birthDate => 'วันเกิด';

  @override
  String get location => 'สถานที่';

  @override
  String get save => 'บันทึก';

  @override
  String get profileSaved => 'โปรไฟล์บันทึกสำเร็จ!';

  @override
  String errorSavingProfile(Object error) {
    return 'ล้มเหลวในการบันทึกโปรไฟล์: $error';
  }

  @override
  String get locateMe => 'ค้นหาตำแหน่งของฉัน';

  @override
  String get locationPermissionDenied => 'ปฏิเสธการอนุญาตสถานที่';

  @override
  String get enableLocationServices => 'โปรดเปิดใช้งานบริการสถานที่';

  @override
  String get locationUpdatedSuccessfully => 'อัปเดตตำแหน่งสำเร็จแล้ว';

  @override
  String get memory => 'หน่วยความจำ';

  @override
  String get os => 'ระบบปฏิบัติการ';

  @override
  String get graphics => 'กราฟิกส์';

  @override
  String get storage => 'พื้นที่จัดเก็บ';

  @override
  String get processor => 'โปรเซสเซอร์';
}
