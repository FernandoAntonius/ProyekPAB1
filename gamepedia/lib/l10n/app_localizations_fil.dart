// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get signIn => 'Mag-sign In';

  @override
  String get signUp => 'Mag-sign Up';

  @override
  String get signOut => 'Mag-sign Out';

  @override
  String get email => 'Email';

  @override
  String get pleaseEnterValidEmail => 'Mangyaring magpasok ng wastong email';

  @override
  String get password => 'Password';

  @override
  String get pleaseEnterPassword => 'Mangyaring ipasok ang iyong password';

  @override
  String get passwordTooShort => 'Ang password ay dapat na may hindi bababa sa 6 na karakter';

  @override
  String get confirmPassword => 'Kumpirmahin ang Password';

  @override
  String get pleaseConfirmPassword => 'Mangyaring kumpirmahin ang iyong password';

  @override
  String get passwordsDoNotMatch => 'Hindi magkatugma ang mga password';

  @override
  String get dontHaveAccount => 'Wala pang account?';

  @override
  String get fullName => 'Buong Pangalan';

  @override
  String get pleaseEnterFullName => 'Mangyaring ipasok ang iyong buong pangalan';

  @override
  String get noUserFound => 'Walang nahanap na user sa email na iyon';

  @override
  String get wrongPassword => 'Maling password. Pakisubukan muli.';

  @override
  String get weakPassword => 'Masyadong mahina ang ibinigay na password.';

  @override
  String get emailAlreadyInUse => 'Mayroon nang account para sa email na iyon.';

  @override
  String get invalidEmail => 'Hindi wasto ang email address.';

  @override
  String get genericError => 'May naganap na error. Pakisubukan muli.';

  @override
  String errorOccurred(Object error) {
    return 'May naganap na error: $error';
  }

  @override
  String get reportDetail => 'Detalye ng Ulat';

  @override
  String get viewFullImage => 'Tingnan ang buong larawan';

  @override
  String get openInGoogleMaps => 'Buksan sa Google Maps';

  @override
  String get unableToOpenMaps => 'Hindi mabuksan ang Google Maps';

  @override
  String get filterCategory => 'I-filter ang Kategorya';

  @override
  String get allCategories => 'Lahat ng Kategorya';

  @override
  String get noReportsInThisCategory => 'Walang ulat sa kategoryang ito.';

  @override
  String secondsAgo(Object count) {
    return '$count seg. nakaraon';
  }

  @override
  String minutesAgo(Object count) {
    return '$count min. nakaraon';
  }

  @override
  String hoursAgo(Object count) {
    return '$count oras nakaraon';
  }

  @override
  String get oneDayAgo => '1 araw nakaraon';

  @override
  String get genreAll => 'Lahat';

  @override
  String get genreAdventure => 'Adventure';

  @override
  String get genreRolePlay => 'Role Play';

  @override
  String get genreShooting => 'Shooting';

  @override
  String get genrePlatformer => 'Platformer';

  @override
  String get genrePuzzle => 'Puzzle';

  @override
  String get genreHackAndSlash => 'Hack and Slash';

  @override
  String get genreRealTimeStrategy => 'Real Time Strategy';

  @override
  String get genreTurnBaseStrategy => 'Turn Base Strategy';

  @override
  String get genreIndie => 'Indie';

  @override
  String get genreRacing => 'Racing';

  @override
  String get genreSport => 'Sports';

  @override
  String get genreFighting => 'Fighting';

  @override
  String get genreArcade => 'Arcade';

  @override
  String get genreSimulator => 'Simulator';

  @override
  String get genrePointAndClick => 'Point and Click';

  @override
  String get addPost => 'Magdagdag ng Post';

  @override
  String get takePicture => 'Kumuha ng larawan';

  @override
  String get chooseFromGallery => 'Pumili mula sa gallery';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get pleaseAddImageAndDescription => 'Mangyaring magdagdag ng larawan at paglalarawan.';

  @override
  String get userNotFoundPleaseSignIn => 'Hindi nahanap ang user. Mangyaring mag-sign in.';

  @override
  String get postUploadedSuccessfully => 'Matagumpay na na-upload ang post!';

  @override
  String failedToUploadPost(Object error) {
    return 'Nabigo ang pag-upload ng post: $error';
  }

  @override
  String get locationServicesDisabled => 'Naka-disable ang mga serbisyo ng lokasyon.';

  @override
  String get locationPermissionsDenied => 'Tinanggihan ang mga pahintulot sa lokasyon.';

  @override
  String failedToRetrieveLocation(Object error) {
    return 'Nabigo sa pagkuha ng lokasyon: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return 'Nabigo sa pagpili ng larawan: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return 'Nabigo sa pag-compress ng larawan: $error';
  }

  @override
  String get generateAnotherDescription => 'Gumawa ng isa pang paglalarawan';

  @override
  String get addBriefDescription => 'Magdagdag ng maikling paglalarawan...';

  @override
  String get post => 'I-post';

  @override
  String get notificationSent => '✅ Matagumpay na naipadala ang notification';

  @override
  String notificationFailed(Object error) {
    return '❌ Nabigo ang pagpapadala ng notification: $error';
  }

  @override
  String get settings => 'Mga Setting';

  @override
  String get language => 'Wika';

  @override
  String get unknownLanguage => 'Hindi kilalang Wika';

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
  String get titleDeviceGenreRequired => 'Ang pamagat, device, at genre ay kinakailangan.';

  @override
  String get gameAdded => 'Matagumpay na naidagdag ang laro!';

  @override
  String failed(Object error) {
    return 'Nabigo ang pag-upload ng laro: $error';
  }

  @override
  String get addGameTitle => 'Magdagdag ng Laro';

  @override
  String get titleField => 'Pamagat';

  @override
  String get studioField => 'Studio';

  @override
  String get ratingExample => 'Rating (hal. 4.5)';

  @override
  String get releaseDateField => 'Petsa ng Paglabas';

  @override
  String get priceExample => 'Presyo (hal. 9.99)';

  @override
  String get deviceField => 'Device';

  @override
  String get genreField => 'Genre';

  @override
  String get descriptionField => 'Paglalarawan';

  @override
  String get screenshotImageUrlField => 'URL ng Screenshot';

  @override
  String get systemRequirements => 'Mga Kinakailangan ng System';

  @override
  String get thumbnailUrl => 'URL ng Thumbnail';

  @override
  String get termsOfService => 'Mga Tuntunin ng Serbisyo';

  @override
  String get iUnderstand => 'Naiintindihan Ko';

  @override
  String get minimum => 'Minimum';

  @override
  String get osField => 'OS';

  @override
  String get processorField => 'Processor';

  @override
  String get memoryField => 'Memory';

  @override
  String get graphicsField => 'Graphics';

  @override
  String get storageField => 'Storage';

  @override
  String get recommended => 'Inirerekomenda';

  @override
  String get addButton => 'Idagdag';

  @override
  String get home => 'Home';

  @override
  String get search => 'Maghanap';

  @override
  String get profile => 'Profile';

  @override
  String get appName => 'GamePedia';

  @override
  String get discoverTagline => 'Tuklasin, i-save, at ibahagi ang iyong mga paboritong laro.';

  @override
  String get searchHint => 'Maghanap ng mga laro...';

  @override
  String get filterGamesTitle => 'I-filter ang mga Laro';

  @override
  String get reset => 'I-reset';

  @override
  String get genreLabel => 'Genre';

  @override
  String get deviceLabel => 'Device';

  @override
  String get sortByPrice => 'Ayusin ayon sa Presyo';

  @override
  String get applyFilters => 'Ilapat ang mga Filter';

  @override
  String get noGamesMatchFilters => 'Walang larong tumutugma sa mga napiling filter.';

  @override
  String get noGamesFound => 'Walang nahanap na laro.';

  @override
  String get popularGames => 'Mga Sikat na Laro';

  @override
  String get newRelease => 'Bagong Laro';

  @override
  String get showAll => 'Ipakita lahat';

  @override
  String get browseByGenre => 'Mag-browse ayon sa Genre';

  @override
  String get browseByDevice => 'Mag-browse ayon sa Device';

  @override
  String get deviceAll => 'Lahat ng Device';

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
  String get priceSortDefault => 'Default';

  @override
  String get priceSortLowToHigh => 'Mababa hanggang Mataas';

  @override
  String get priceSortHighToLow => 'Mataas hanggang Mababa';

  @override
  String get releaseDate => 'Petsa ng Paglabas';

  @override
  String get price => 'Presyo';

  @override
  String get availableOn => 'Available Sa';

  @override
  String get aboutThisGame => 'Tungkol sa larong ito';

  @override
  String get screenshots => 'Mga Screenshot';

  @override
  String get reviews => 'Mga Review';

  @override
  String get addReview => 'Magdagdag ng review';

  @override
  String get viewAll => 'Tingnan lahat';

  @override
  String get noReviewsYet => 'Wala pang mga review';

  @override
  String gamesFound(Object count) {
    return '$count larong nahanap';
  }

  @override
  String get userLabelUser => 'User';

  @override
  String get userLabelGuest => 'Bisita';

  @override
  String get register => 'Mag-register';

  @override
  String get login => 'Mag-login';

  @override
  String get welcomeMessage => 'Maligayang pagbabalik!';

  @override
  String get editProfile => 'I-edit ang Profile';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get termsOfServiceShort => 'Mga Tuntunin';

  @override
  String get logout => 'Mag-logout';

  @override
  String get favoritesMigrated => 'Matagumpay na na-migrate ang mga paborito.';

  @override
  String get migrateFavorites => 'I-migrate ang mga Paborito';

  @override
  String get copyright => '© 2026 GamePedia. Lahat ng karapatan ay nakalaan.';

  @override
  String get addReviewTitle => 'Magdagdag ng Review';

  @override
  String get writeYourReview => 'Isulat ang iyong review';

  @override
  String get yourName => 'Iyong pangalan';

  @override
  String get game => 'Laro';

  @override
  String get selectGame => 'Pumili ng laro';

  @override
  String get yourRating => 'Iyong rating';

  @override
  String get shareExperience => 'Ibahagi ang iyong karanasan sa laong ito...';

  @override
  String get submit => 'Isumite';

  @override
  String get reviewSubmittedSuccessfully => 'Matagumpay na naisumite ang review!';

  @override
  String get fillAllFields => 'Mangyaring punan ang lahat ng field at pumili ng rating';

  @override
  String failedToSubmitReview(Object error) {
    return 'Nabigo ang pagsusumite ng review: $error';
  }

  @override
  String get allReviewsTitle => 'Lahat ng Review';

  @override
  String reviewsFor(Object gameName) {
    return 'Mga review para sa $gameName';
  }

  @override
  String get noReviewsYetMsg => 'Wala pang mga review';

  @override
  String failedToLoadGames(Object error) {
    return 'Nabigo ang pag-load ng mga laro: $error';
  }

  @override
  String gamesSaved(Object count) {
    return '$count larong na-save.';
  }

  @override
  String get yourWishlistEmpty => 'Ang iyong wishlist ay walang laman :(';

  @override
  String get startAddingGames => 'Magsimulang magdagdag ng mga larong interesado ka!';

  @override
  String get unableToLoadWishlistGames => 'Hindi mabuksan ang mga laro sa wishlist.';

  @override
  String get welcomeToGamePedia => 'Maligayang pagdating sa GamePedia!';

  @override
  String get termsOfServiceDescription => 'Basahin ng mabuti ang mga Termino ng Serbisyo bago gamitin ang GamePedia.';

  @override
  String get tosTermsContent => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  String get sysReqOS => 'Operating System';

  @override
  String get sysReqProcessor => 'Processor';

  @override
  String get sysReqMemory => 'Memory (RAM)';

  @override
  String get sysReqGraphics => 'Graphics Card';

  @override
  String get sysReqStorage => 'Storage Space';

  @override
  String get sysReqDirectX => 'DirectX Version';

  @override
  String get sysReqNetwork => 'Network';

  @override
  String get sysReqSoundCard => 'Sound Card';
}
