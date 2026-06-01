import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_th.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('fil'),
    Locale('id'),
    Locale('ja'),
    Locale('ko'),
    Locale('ru'),
    Locale('th'),
    Locale('zh')
  ];

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @pleaseEnterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get pleaseEnterValidEmail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterPassword;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordTooShort;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @pleaseConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get pleaseConfirmPassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @pleaseEnterFullName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your full name'**
  String get pleaseEnterFullName;

  /// No description provided for @noUserFound.
  ///
  /// In en, this message translates to:
  /// **'No user found with that email'**
  String get noUserFound;

  /// No description provided for @wrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong password. Please try again.'**
  String get wrongPassword;

  /// No description provided for @weakPassword.
  ///
  /// In en, this message translates to:
  /// **'The password provided is too weak.'**
  String get weakPassword;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'The account already exists for that email.'**
  String get emailAlreadyInUse;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'The email address is not valid.'**
  String get invalidEmail;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again.'**
  String get genericError;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred: {error}'**
  String errorOccurred(Object error);

  /// No description provided for @reportDetail.
  ///
  /// In en, this message translates to:
  /// **'Report Detail'**
  String get reportDetail;

  /// No description provided for @viewFullImage.
  ///
  /// In en, this message translates to:
  /// **'View full image'**
  String get viewFullImage;

  /// No description provided for @openInGoogleMaps.
  ///
  /// In en, this message translates to:
  /// **'Open in Google Maps'**
  String get openInGoogleMaps;

  /// No description provided for @unableToOpenMaps.
  ///
  /// In en, this message translates to:
  /// **'Unable to open Google Maps'**
  String get unableToOpenMaps;

  /// No description provided for @filterCategory.
  ///
  /// In en, this message translates to:
  /// **'Filter Category'**
  String get filterCategory;

  /// No description provided for @allCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get allCategories;

  /// No description provided for @noReportsInThisCategory.
  ///
  /// In en, this message translates to:
  /// **'No reports in this category.'**
  String get noReportsInThisCategory;

  /// No description provided for @secondsAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} secs ago'**
  String secondsAgo(Object count);

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} mins ago'**
  String minutesAgo(Object count);

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} hrs ago'**
  String hoursAgo(Object count);

  /// No description provided for @oneDayAgo.
  ///
  /// In en, this message translates to:
  /// **'1 day ago'**
  String get oneDayAgo;

  /// No description provided for @genreAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get genreAll;

  /// No description provided for @genreAdventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get genreAdventure;

  /// No description provided for @genreRolePlay.
  ///
  /// In en, this message translates to:
  /// **'Role Play'**
  String get genreRolePlay;

  /// No description provided for @genreShooting.
  ///
  /// In en, this message translates to:
  /// **'Shooting'**
  String get genreShooting;

  /// No description provided for @genrePlatformer.
  ///
  /// In en, this message translates to:
  /// **'Platformer'**
  String get genrePlatformer;

  /// No description provided for @genrePuzzle.
  ///
  /// In en, this message translates to:
  /// **'Puzzle'**
  String get genrePuzzle;

  /// No description provided for @genreHackAndSlash.
  ///
  /// In en, this message translates to:
  /// **'Hack And Slash'**
  String get genreHackAndSlash;

  /// No description provided for @genreRealTimeStrategy.
  ///
  /// In en, this message translates to:
  /// **'Real Time Strategy'**
  String get genreRealTimeStrategy;

  /// No description provided for @genreTurnBaseStrategy.
  ///
  /// In en, this message translates to:
  /// **'Turn Base Strategy'**
  String get genreTurnBaseStrategy;

  /// No description provided for @genreIndie.
  ///
  /// In en, this message translates to:
  /// **'Indie'**
  String get genreIndie;

  /// No description provided for @genreRacing.
  ///
  /// In en, this message translates to:
  /// **'Racing'**
  String get genreRacing;

  /// No description provided for @genreSport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get genreSport;

  /// No description provided for @genreFighting.
  ///
  /// In en, this message translates to:
  /// **'Fighting'**
  String get genreFighting;

  /// No description provided for @genreArcade.
  ///
  /// In en, this message translates to:
  /// **'Arcade'**
  String get genreArcade;

  /// No description provided for @genreSimulator.
  ///
  /// In en, this message translates to:
  /// **'Simulator'**
  String get genreSimulator;

  /// No description provided for @genrePointAndClick.
  ///
  /// In en, this message translates to:
  /// **'Point And Click'**
  String get genrePointAndClick;

  /// No description provided for @addPost.
  ///
  /// In en, this message translates to:
  /// **'Add Post'**
  String get addPost;

  /// No description provided for @takePicture.
  ///
  /// In en, this message translates to:
  /// **'Take a picture'**
  String get takePicture;

  /// No description provided for @chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get chooseFromGallery;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @pleaseAddImageAndDescription.
  ///
  /// In en, this message translates to:
  /// **'Please add an image and description.'**
  String get pleaseAddImageAndDescription;

  /// No description provided for @userNotFoundPleaseSignIn.
  ///
  /// In en, this message translates to:
  /// **'User not found. Please sign in.'**
  String get userNotFoundPleaseSignIn;

  /// No description provided for @postUploadedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Post uploaded successfully!'**
  String get postUploadedSuccessfully;

  /// No description provided for @failedToUploadPost.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload the post: {error}'**
  String failedToUploadPost(Object error);

  /// No description provided for @locationServicesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled.'**
  String get locationServicesDisabled;

  /// No description provided for @locationPermissionsDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permissions are denied.'**
  String get locationPermissionsDenied;

  /// No description provided for @failedToRetrieveLocation.
  ///
  /// In en, this message translates to:
  /// **'Failed to retrieve location: {error}'**
  String failedToRetrieveLocation(Object error);

  /// No description provided for @failedToPickImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to pick image: {error}'**
  String failedToPickImage(Object error);

  /// No description provided for @failedToCompressImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to compress image: {error}'**
  String failedToCompressImage(Object error);

  /// No description provided for @generateAnotherDescription.
  ///
  /// In en, this message translates to:
  /// **'Generate another description'**
  String get generateAnotherDescription;

  /// No description provided for @addBriefDescription.
  ///
  /// In en, this message translates to:
  /// **'Add a brief description...'**
  String get addBriefDescription;

  /// No description provided for @post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// No description provided for @notificationSent.
  ///
  /// In en, this message translates to:
  /// **'✅ Notification sent successfully'**
  String get notificationSent;

  /// No description provided for @notificationFailed.
  ///
  /// In en, this message translates to:
  /// **'❌ Failed to send notification: {error}'**
  String notificationFailed(Object error);

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @unknownLanguage.
  ///
  /// In en, this message translates to:
  /// **'Unknown Language'**
  String get unknownLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @indonesian.
  ///
  /// In en, this message translates to:
  /// **'Bahasa Indonesia'**
  String get indonesian;

  /// No description provided for @korean.
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get korean;

  /// No description provided for @chinese.
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get chinese;

  /// No description provided for @thai.
  ///
  /// In en, this message translates to:
  /// **'Thailand'**
  String get thai;

  /// No description provided for @spanish.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get spanish;

  /// No description provided for @filipino.
  ///
  /// In en, this message translates to:
  /// **'Tagalog'**
  String get filipino;

  /// No description provided for @russian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russian;

  /// No description provided for @japanese.
  ///
  /// In en, this message translates to:
  /// **'Japanese'**
  String get japanese;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @titleDeviceGenreRequired.
  ///
  /// In en, this message translates to:
  /// **'Title, device, and genre are required.'**
  String get titleDeviceGenreRequired;

  /// No description provided for @gameAdded.
  ///
  /// In en, this message translates to:
  /// **'Game added successfully!'**
  String get gameAdded;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload the game: {error}'**
  String failed(Object error);

  /// No description provided for @addGameTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Game'**
  String get addGameTitle;

  /// No description provided for @titleField.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleField;

  /// No description provided for @studioField.
  ///
  /// In en, this message translates to:
  /// **'Studio'**
  String get studioField;

  /// No description provided for @ratingExample.
  ///
  /// In en, this message translates to:
  /// **'Rating (e.g. 4.5)'**
  String get ratingExample;

  /// No description provided for @releaseDateField.
  ///
  /// In en, this message translates to:
  /// **'Release Date'**
  String get releaseDateField;

  /// No description provided for @priceExample.
  ///
  /// In en, this message translates to:
  /// **'Price (e.g. 9.99)'**
  String get priceExample;

  /// No description provided for @deviceField.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get deviceField;

  /// No description provided for @genreField.
  ///
  /// In en, this message translates to:
  /// **'Genre'**
  String get genreField;

  /// No description provided for @descriptionField.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get descriptionField;

  /// No description provided for @screenshotImageUrlField.
  ///
  /// In en, this message translates to:
  /// **'Screenshot Image URL'**
  String get screenshotImageUrlField;

  /// No description provided for @systemRequirements.
  ///
  /// In en, this message translates to:
  /// **'System Requirements'**
  String get systemRequirements;

  /// No description provided for @thumbnailUrl.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail URL'**
  String get thumbnailUrl;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @iUnderstand.
  ///
  /// In en, this message translates to:
  /// **'I Understand'**
  String get iUnderstand;

  /// No description provided for @minimum.
  ///
  /// In en, this message translates to:
  /// **'Minimum'**
  String get minimum;

  /// No description provided for @osField.
  ///
  /// In en, this message translates to:
  /// **'OS'**
  String get osField;

  /// No description provided for @processorField.
  ///
  /// In en, this message translates to:
  /// **'Processor'**
  String get processorField;

  /// No description provided for @memoryField.
  ///
  /// In en, this message translates to:
  /// **'Memory'**
  String get memoryField;

  /// No description provided for @graphicsField.
  ///
  /// In en, this message translates to:
  /// **'Graphics'**
  String get graphicsField;

  /// No description provided for @storageField.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storageField;

  /// No description provided for @recommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// No description provided for @addButton.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addButton;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'GamePedia'**
  String get appName;

  /// No description provided for @discoverTagline.
  ///
  /// In en, this message translates to:
  /// **'Discover, save, and share your favorite games.'**
  String get discoverTagline;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search games...'**
  String get searchHint;

  /// No description provided for @filterGamesTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter Games'**
  String get filterGamesTitle;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @genreLabel.
  ///
  /// In en, this message translates to:
  /// **'Genre'**
  String get genreLabel;

  /// No description provided for @deviceLabel.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get deviceLabel;

  /// No description provided for @sortByPrice.
  ///
  /// In en, this message translates to:
  /// **'Sort by Price'**
  String get sortByPrice;

  /// No description provided for @applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFilters;

  /// No description provided for @noGamesMatchFilters.
  ///
  /// In en, this message translates to:
  /// **'No games match the selected filters.'**
  String get noGamesMatchFilters;

  /// No description provided for @noGamesFound.
  ///
  /// In en, this message translates to:
  /// **'No games found.'**
  String get noGamesFound;

  /// No description provided for @popularGames.
  ///
  /// In en, this message translates to:
  /// **'Popular Games'**
  String get popularGames;

  /// No description provided for @newRelease.
  ///
  /// In en, this message translates to:
  /// **'New Release'**
  String get newRelease;

  /// No description provided for @showAll.
  ///
  /// In en, this message translates to:
  /// **'Show all'**
  String get showAll;

  /// No description provided for @browseByGenre.
  ///
  /// In en, this message translates to:
  /// **'Browse by Genre'**
  String get browseByGenre;

  /// No description provided for @browseByDevice.
  ///
  /// In en, this message translates to:
  /// **'Browse by Device'**
  String get browseByDevice;

  /// No description provided for @deviceAll.
  ///
  /// In en, this message translates to:
  /// **'All Devices'**
  String get deviceAll;

  /// No description provided for @deviceWindows.
  ///
  /// In en, this message translates to:
  /// **'Windows'**
  String get deviceWindows;

  /// No description provided for @devicePlayStation.
  ///
  /// In en, this message translates to:
  /// **'PlayStation'**
  String get devicePlayStation;

  /// No description provided for @deviceXbox.
  ///
  /// In en, this message translates to:
  /// **'Xbox'**
  String get deviceXbox;

  /// No description provided for @deviceNintendoSwitch.
  ///
  /// In en, this message translates to:
  /// **'Nintendo Switch'**
  String get deviceNintendoSwitch;

  /// No description provided for @deviceAndroid.
  ///
  /// In en, this message translates to:
  /// **'Android'**
  String get deviceAndroid;

  /// No description provided for @deviceiOS.
  ///
  /// In en, this message translates to:
  /// **'iOS'**
  String get deviceiOS;

  /// No description provided for @deviceMac.
  ///
  /// In en, this message translates to:
  /// **'Mac'**
  String get deviceMac;

  /// No description provided for @deviceLinux.
  ///
  /// In en, this message translates to:
  /// **'Linux'**
  String get deviceLinux;

  /// No description provided for @priceSortDefault.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get priceSortDefault;

  /// No description provided for @priceSortLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Low to High'**
  String get priceSortLowToHigh;

  /// No description provided for @priceSortHighToLow.
  ///
  /// In en, this message translates to:
  /// **'High to Low'**
  String get priceSortHighToLow;

  /// No description provided for @releaseDate.
  ///
  /// In en, this message translates to:
  /// **'Release Date'**
  String get releaseDate;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @availableOn.
  ///
  /// In en, this message translates to:
  /// **'Available On'**
  String get availableOn;

  /// No description provided for @aboutThisGame.
  ///
  /// In en, this message translates to:
  /// **'About this game'**
  String get aboutThisGame;

  /// No description provided for @screenshots.
  ///
  /// In en, this message translates to:
  /// **'Screenshots'**
  String get screenshots;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @addReview.
  ///
  /// In en, this message translates to:
  /// **'Add review'**
  String get addReview;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @noReviewsYet.
  ///
  /// In en, this message translates to:
  /// **'No reviews yet'**
  String get noReviewsYet;

  /// No description provided for @gamesFound.
  ///
  /// In en, this message translates to:
  /// **'{count} games found'**
  String gamesFound(Object count);

  /// No description provided for @userLabelUser.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get userLabelUser;

  /// No description provided for @userLabelGuest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get userLabelGuest;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcomeMessage;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @termsOfServiceShort.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get termsOfServiceShort;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @favoritesMigrated.
  ///
  /// In en, this message translates to:
  /// **'Favorites migrated successfully.'**
  String get favoritesMigrated;

  /// No description provided for @migrateFavorites.
  ///
  /// In en, this message translates to:
  /// **'Migrate Favorites'**
  String get migrateFavorites;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© 2026 GamePedia. All rights reserved.'**
  String get copyright;

  /// No description provided for @addReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Review'**
  String get addReviewTitle;

  /// No description provided for @writeYourReview.
  ///
  /// In en, this message translates to:
  /// **'Write your review'**
  String get writeYourReview;

  /// No description provided for @yourName.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get yourName;

  /// No description provided for @game.
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get game;

  /// No description provided for @selectGame.
  ///
  /// In en, this message translates to:
  /// **'Select a game'**
  String get selectGame;

  /// No description provided for @yourRating.
  ///
  /// In en, this message translates to:
  /// **'Your rating'**
  String get yourRating;

  /// No description provided for @shareExperience.
  ///
  /// In en, this message translates to:
  /// **'Share your experience with this game...'**
  String get shareExperience;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @reviewSubmittedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Review submitted successfully!'**
  String get reviewSubmittedSuccessfully;

  /// No description provided for @fillAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill all fields and select a rating'**
  String get fillAllFields;

  /// No description provided for @failedToSubmitReview.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit review: {error}'**
  String failedToSubmitReview(Object error);

  /// No description provided for @allReviewsTitle.
  ///
  /// In en, this message translates to:
  /// **'All Reviews'**
  String get allReviewsTitle;

  /// No description provided for @reviewsFor.
  ///
  /// In en, this message translates to:
  /// **'Reviews for {gameName}'**
  String reviewsFor(Object gameName);

  /// No description provided for @noReviewsYetMsg.
  ///
  /// In en, this message translates to:
  /// **'No reviews yet'**
  String get noReviewsYetMsg;

  /// No description provided for @failedToLoadGames.
  ///
  /// In en, this message translates to:
  /// **'Failed to load games: {error}'**
  String failedToLoadGames(Object error);

  /// No description provided for @gamesSaved.
  ///
  /// In en, this message translates to:
  /// **'{count} games saved.'**
  String gamesSaved(Object count);

  /// No description provided for @yourWishlistEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your wishlist is empty :('**
  String get yourWishlistEmpty;

  /// No description provided for @startAddingGames.
  ///
  /// In en, this message translates to:
  /// **'Start adding games you\'re interested in!'**
  String get startAddingGames;

  /// No description provided for @unableToLoadWishlistGames.
  ///
  /// In en, this message translates to:
  /// **'Unable to load wishlist games.'**
  String get unableToLoadWishlistGames;

  /// No description provided for @welcomeToGamePedia.
  ///
  /// In en, this message translates to:
  /// **'Welcome to GamePedia!'**
  String get welcomeToGamePedia;

  /// No description provided for @termsOfServiceDescription.
  ///
  /// In en, this message translates to:
  /// **'Please read these Terms of Service carefully before using GamePedia.'**
  String get termsOfServiceDescription;

  /// No description provided for @tosTermsContent.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'**
  String get tosTermsContent;

  /// No description provided for @biography.
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get biography;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth Date'**
  String get birthDate;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @profileSaved.
  ///
  /// In en, this message translates to:
  /// **'Profile saved successfully!'**
  String get profileSaved;

  /// No description provided for @errorSavingProfile.
  ///
  /// In en, this message translates to:
  /// **'Failed to save profile: {error}'**
  String errorSavingProfile(Object error);

  /// No description provided for @locateMe.
  ///
  /// In en, this message translates to:
  /// **'Locate Me'**
  String get locateMe;

  /// No description provided for @locationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied'**
  String get locationPermissionDenied;

  /// No description provided for @enableLocationServices.
  ///
  /// In en, this message translates to:
  /// **'Please enable location services'**
  String get enableLocationServices;

  /// No description provided for @locationUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Location updated successfully'**
  String get locationUpdatedSuccessfully;

  /// No description provided for @memory.
  ///
  /// In en, this message translates to:
  /// **'Memory'**
  String get memory;

  /// No description provided for @os.
  ///
  /// In en, this message translates to:
  /// **'OS'**
  String get os;

  /// No description provided for @graphics.
  ///
  /// In en, this message translates to:
  /// **'Graphics'**
  String get graphics;

  /// No description provided for @storage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storage;

  /// No description provided for @processor.
  ///
  /// In en, this message translates to:
  /// **'Processor'**
  String get processor;

  /// No description provided for @deviceMacOS.
  ///
  /// In en, this message translates to:
  /// **'MacOS'**
  String get deviceMacOS;

  /// No description provided for @deviceIOS.
  ///
  /// In en, this message translates to:
  /// **'iOS'**
  String get deviceIOS;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'es', 'fil', 'id', 'ja', 'ko', 'ru', 'th', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fil': return AppLocalizationsFil();
    case 'id': return AppLocalizationsId();
    case 'ja': return AppLocalizationsJa();
    case 'ko': return AppLocalizationsKo();
    case 'ru': return AppLocalizationsRu();
    case 'th': return AppLocalizationsTh();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
