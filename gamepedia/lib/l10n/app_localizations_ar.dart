// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get pleaseEnterValidEmail => 'يرجى إدخال بريد إلكتروني صحيح';

  @override
  String get password => 'كلمة المرور';

  @override
  String get pleaseEnterPassword => 'يرجى إدخال كلمة المرور';

  @override
  String get passwordTooShort => 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get pleaseConfirmPassword => 'يرجى تأكيد كلمة المرور';

  @override
  String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get pleaseEnterFullName => 'يرجى إدخال الاسم الكامل';

  @override
  String get noUserFound => 'لم يتم العثور على مستخدم بهذا البريد الإلكتروني';

  @override
  String get wrongPassword => 'كلمة المرور غير صحيحة. حاول مرة أخرى.';

  @override
  String get weakPassword => 'كلمة المرور ضعيفة جدًا.';

  @override
  String get emailAlreadyInUse => 'يوجد حساب بالفعل لهذا البريد الإلكتروني.';

  @override
  String get invalidEmail => 'عنوان البريد الإلكتروني غير صالح.';

  @override
  String get genericError => 'حدث خطأ. يرجى المحاولة مرة أخرى.';

  @override
  String errorOccurred(Object error) {
    return 'حدث خطأ: $error';
  }

  @override
  String get reportDetail => 'تفاصيل التقرير';

  @override
  String get viewFullImage => 'عرض الصورة كاملة';

  @override
  String get openInGoogleMaps => 'افتح في خرائط جوجل';

  @override
  String get unableToOpenMaps => 'تعذر فتح خرائط جوجل';

  @override
  String get filterCategory => 'فئة التصفية';

  @override
  String get allCategories => 'جميع الفئات';

  @override
  String get noReportsInThisCategory => 'لا توجد تقارير في هذه الفئة.';

  @override
  String secondsAgo(Object count) {
    return 'منذ $count ثانية';
  }

  @override
  String minutesAgo(Object count) {
    return 'منذ $count دقيقة';
  }

  @override
  String hoursAgo(Object count) {
    return 'منذ $count ساعة';
  }

  @override
  String get oneDayAgo => 'منذ يوم واحد';

  @override
  String get genreAll => 'الكل';

  @override
  String get genreAdventure => 'مغامرة';

  @override
  String get genreRolePlay => 'لعب أدوار';

  @override
  String get genreShooting => 'إطلاق نار';

  @override
  String get genrePlatformer => 'منصات';

  @override
  String get genrePuzzle => 'ألغاز';

  @override
  String get genreHackAndSlash => 'هاك آند سلاش';

  @override
  String get genreRealTimeStrategy => 'استراتيجية في الوقت الفعلي';

  @override
  String get genreTurnBaseStrategy => 'استراتيجية بالأدوار';

  @override
  String get genreIndie => 'إندي';

  @override
  String get genreRacing => 'سباق';

  @override
  String get genreSport => 'رياضة';

  @override
  String get genreFighting => 'قتال';

  @override
  String get genreArcade => 'أركيد';

  @override
  String get genreSimulator => 'محاكاة';

  @override
  String get genrePointAndClick => 'أشر وانقر';

  @override
  String get addPost => 'إضافة منشور';

  @override
  String get takePicture => 'التقاط صورة';

  @override
  String get chooseFromGallery => 'اختر من المعرض';

  @override
  String get cancel => 'إلغاء';

  @override
  String get pleaseAddImageAndDescription => 'يرجى إضافة صورة ووصف.';

  @override
  String get userNotFoundPleaseSignIn => 'لم يتم العثور على المستخدم. يرجى تسجيل الدخول.';

  @override
  String get postUploadedSuccessfully => 'تم رفع المنشور بنجاح!';

  @override
  String failedToUploadPost(Object error) {
    return 'فشل رفع المنشور: $error';
  }

  @override
  String get locationServicesDisabled => 'خدمات الموقع معطّلة.';

  @override
  String get locationPermissionsDenied => 'تم رفض أذونات الموقع.';

  @override
  String failedToRetrieveLocation(Object error) {
    return 'فشل الحصول على الموقع: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return 'فشل اختيار الصورة: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return 'فشل ضغط الصورة: $error';
  }

  @override
  String get generateAnotherDescription => 'إنشاء وصف آخر';

  @override
  String get addBriefDescription => 'أضف وصفًا مختصرًا...';

  @override
  String get post => 'نشر';

  @override
  String get notificationSent => '✅ تم إرسال الإشعار بنجاح';

  @override
  String notificationFailed(Object error) {
    return '❌ فشل إرسال الإشعار: $error';
  }

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get unknownLanguage => 'لغة غير معروفة';

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
  String get titleDeviceGenreRequired => 'العنوان والجهاز والنوع مطلوبة.';

  @override
  String get gameAdded => 'تمت إضافة اللعبة بنجاح!';

  @override
  String failed(Object error) {
    return 'فشل رفع اللعبة: $error';
  }

  @override
  String get addGameTitle => 'إضافة لعبة';

  @override
  String get titleField => 'العنوان';

  @override
  String get studioField => 'الاستوديو';

  @override
  String get ratingExample => 'التقييم (مثال: 4.5)';

  @override
  String get releaseDateField => 'تاريخ الإصدار';

  @override
  String get priceExample => 'السعر (مثال: 9.99)';

  @override
  String get deviceField => 'الجهاز';

  @override
  String get genreField => 'النوع';

  @override
  String get descriptionField => 'الوصف';

  @override
  String get screenshotImageUrlField => 'رابط صورة لقطة الشاشة';

  @override
  String get systemRequirements => 'متطلبات النظام';

  @override
  String get thumbnailUrl => 'رابط الصورة المصغرة';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get iUnderstand => 'أنا أفهم';

  @override
  String get minimum => 'الحد الأدنى';

  @override
  String get osField => 'نظام التشغيل';

  @override
  String get processorField => 'المعالج';

  @override
  String get memoryField => 'الذاكرة';

  @override
  String get graphicsField => 'الرسومات';

  @override
  String get storageField => 'التخزين';

  @override
  String get recommended => 'الموصى به';

  @override
  String get addButton => 'إضافة';

  @override
  String get home => 'الرئيسية';

  @override
  String get search => 'بحث';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get appName => 'GamePedia';

  @override
  String get discoverTagline => 'اكتشف ألعابك المفضلة واحفظها وشاركها.';

  @override
  String get searchHint => 'ابحث عن الألعاب...';

  @override
  String get filterGamesTitle => 'تصفية الألعاب';

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get genreLabel => 'النوع';

  @override
  String get deviceLabel => 'الجهاز';

  @override
  String get sortByPrice => 'ترتيب حسب السعر';

  @override
  String get applyFilters => 'تطبيق الفلاتر';

  @override
  String get noGamesMatchFilters => 'لا توجد ألعاب تطابق الفلاتر المحددة.';

  @override
  String get noGamesFound => 'لم يتم العثور على ألعاب.';

  @override
  String get popularGames => 'الألعاب الشائعة';

  @override
  String get newRelease => 'إصدار جديد';

  @override
  String get showAll => 'عرض الكل';

  @override
  String get browseByGenre => 'تصفح حسب النوع';

  @override
  String get browseByDevice => 'تصفح حسب الجهاز';

  @override
  String get deviceAll => 'جميع الأجهزة';

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
  String get priceSortDefault => 'افتراضي';

  @override
  String get priceSortLowToHigh => 'من الأقل إلى الأعلى';

  @override
  String get priceSortHighToLow => 'من الأعلى إلى الأقل';

  @override
  String get releaseDate => 'تاريخ الإصدار';

  @override
  String get price => 'السعر';

  @override
  String get availableOn => 'متوفر على';

  @override
  String get aboutThisGame => 'حول هذه اللعبة';

  @override
  String get screenshots => 'لقطات الشاشة';

  @override
  String get reviews => 'المراجعات';

  @override
  String get addReview => 'إضافة مراجعة';

  @override
  String get viewAll => 'عرض الكل';

  @override
  String get noReviewsYet => 'لا توجد مراجعات بعد';

  @override
  String gamesFound(Object count) {
    return 'تم العثور على $count لعبة';
  }

  @override
  String get userLabelUser => 'مستخدم';

  @override
  String get userLabelGuest => 'ضيف';

  @override
  String get register => 'تسجيل';

  @override
  String get login => 'دخول';

  @override
  String get welcomeMessage => 'مرحبًا بعودتك!';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get wishlist => 'قائمة الأمنيات';

  @override
  String get termsOfServiceShort => 'الشروط';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get favoritesMigrated => 'تم نقل المفضلة بنجاح.';

  @override
  String get migrateFavorites => 'نقل المفضلة';

  @override
  String get copyright => '© 2026 GamePedia. جميع الحقوق محفوظة.';

  @override
  String get addReviewTitle => 'إضافة مراجعة';

  @override
  String get writeYourReview => 'اكتب مراجعتك';

  @override
  String get yourName => 'اسمك';

  @override
  String get game => 'اللعبة';

  @override
  String get selectGame => 'اختر لعبة';

  @override
  String get yourRating => 'تقييمك';

  @override
  String get shareExperience => 'شارك تجربتك مع هذه اللعبة...';

  @override
  String get submit => 'إرسال';

  @override
  String get reviewSubmittedSuccessfully => 'تم إرسال المراجعة بنجاح!';

  @override
  String get fillAllFields => 'يرجى ملء جميع الحقول واختيار تقييم';

  @override
  String failedToSubmitReview(Object error) {
    return 'فشل إرسال المراجعة: $error';
  }

  @override
  String get allReviewsTitle => 'جميع المراجعات';

  @override
  String reviewsFor(Object gameName) {
    return 'مراجعات $gameName';
  }

  @override
  String get noReviewsYetMsg => 'لا توجد مراجعات بعد';

  @override
  String failedToLoadGames(Object error) {
    return 'فشل تحميل الألعاب: $error';
  }

  @override
  String gamesSaved(Object count) {
    return '$count لعبة محفوظة.';
  }

  @override
  String get yourWishlistEmpty => 'قائمة الأمنيات الخاصة بك فارغة :(';

  @override
  String get startAddingGames => 'ابدأ في إضافة الألعاب التي تهتم بها!';

  @override
  String get unableToLoadWishlistGames => 'تعذر تحميل ألعاب قائمة الأمنيات.';

  @override
  String get welcomeToGamePedia => 'أهلا وسهلا بك في GamePedia!';

  @override
  String get termsOfServiceDescription => 'يرجى قراءة شروط الخدمة هذه بعناية قبل استخدام GamePedia.';

  @override
  String get tosTermsContent => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  String get biography => 'السيرة الذاتية';

  @override
  String get birthDate => 'تاريخ الميلاد';

  @override
  String get location => 'الموقع';

  @override
  String get save => 'حفظ';

  @override
  String get profileSaved => 'تم حفظ الملف الشخصي بنجاح!';

  @override
  String errorSavingProfile(Object error) {
    return 'فشل حفظ الملف الشخصي: $error';
  }

  @override
  String get locateMe => 'حدد موقعي';

  @override
  String get locationPermissionDenied => 'تم رفض إذن الموقع';

  @override
  String get enableLocationServices => 'يرجى تفعيل خدمات الموقع';

  @override
  String get locationUpdatedSuccessfully => 'تم تحديث الموقع بنجاح';

  @override
  String get memory => 'الذاكرة';

  @override
  String get os => 'نظام التشغيل';

  @override
  String get graphics => 'الرسومات';

  @override
  String get storage => 'التخزين';

  @override
  String get processor => 'المعالج';
}
