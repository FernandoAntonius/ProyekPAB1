// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signOut => 'Sign Out';

  @override
  String get email => 'Email';

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email';

  @override
  String get password => 'Password';

  @override
  String get pleaseEnterPassword => 'Please enter your password';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get pleaseConfirmPassword => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get fullName => 'Full Name';

  @override
  String get pleaseEnterFullName => 'Please enter your full name';

  @override
  String get noUserFound => 'No user found with that email';

  @override
  String get wrongPassword => 'Wrong password. Please try again.';

  @override
  String get weakPassword => 'The password provided is too weak.';

  @override
  String get emailAlreadyInUse => 'The account already exists for that email.';

  @override
  String get invalidEmail => 'The email address is not valid.';

  @override
  String get genericError => 'An error occurred. Please try again.';

  @override
  String errorOccurred(Object error) {
    return 'An error occurred: $error';
  }

  @override
  String get reportDetail => 'Report Detail';

  @override
  String get viewFullImage => 'View full image';

  @override
  String get openInGoogleMaps => 'Open in Google Maps';

  @override
  String get unableToOpenMaps => 'Unable to open Google Maps';

  @override
  String get filterCategory => 'Filter Category';

  @override
  String get allCategories => 'All Categories';

  @override
  String get noReportsInThisCategory => 'No reports in this category.';

  @override
  String secondsAgo(Object count) {
    return '$count secs ago';
  }

  @override
  String minutesAgo(Object count) {
    return '$count mins ago';
  }

  @override
  String hoursAgo(Object count) {
    return '$count hrs ago';
  }

  @override
  String get oneDayAgo => '1 day ago';

  @override
  String get genreAll => 'All';

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
  String get genreHackAndSlash => 'Hack And Slash';

  @override
  String get genreRealTimeStrategy => 'Real Time Strategy';

  @override
  String get genreTurnBaseStrategy => 'Turn Base Strategy';

  @override
  String get genreIndie => 'Indie';

  @override
  String get genreRacing => 'Racing';

  @override
  String get genreSport => 'Sport';

  @override
  String get genreFighting => 'Fighting';

  @override
  String get genreArcade => 'Arcade';

  @override
  String get genreSimulator => 'Simulator';

  @override
  String get genrePointAndClick => 'Point And Click';

  @override
  String get addPost => 'Add Post';

  @override
  String get takePicture => 'Take a picture';

  @override
  String get chooseFromGallery => 'Choose from gallery';

  @override
  String get cancel => 'Cancel';

  @override
  String get pleaseAddImageAndDescription => 'Please add an image and description.';

  @override
  String get userNotFoundPleaseSignIn => 'User not found. Please sign in.';

  @override
  String get postUploadedSuccessfully => 'Post uploaded successfully!';

  @override
  String failedToUploadPost(Object error) {
    return 'Failed to upload the post: $error';
  }

  @override
  String get locationServicesDisabled => 'Location services are disabled.';

  @override
  String get locationPermissionsDenied => 'Location permissions are denied.';

  @override
  String failedToRetrieveLocation(Object error) {
    return 'Failed to retrieve location: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return 'Failed to pick image: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return 'Failed to compress image: $error';
  }

  @override
  String get generateAnotherDescription => 'Generate another description';

  @override
  String get addBriefDescription => 'Add a brief description...';

  @override
  String get post => 'Post';

  @override
  String get notificationSent => '✅ Notification sent successfully';

  @override
  String notificationFailed(Object error) {
    return '❌ Failed to send notification: $error';
  }

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get unknownLanguage => 'Unknown Language';

  @override
  String get english => 'English';

  @override
  String get indonesian => 'Indonesian';

  @override
  String get korean => 'Korean';

  @override
  String get titleDeviceGenreRequired => 'Title, device, and genre are required.';

  @override
  String get gameAdded => 'Game added successfully!';

  @override
  String failed(Object error) {
    return 'Failed to upload the game: $error';
  }

  @override
  String get addGameTitle => 'Add Game';

  @override
  String get titleField => 'Title';

  @override
  String get studioField => 'Studio';

  @override
  String get ratingExample => 'Rating (e.g. 4.5)';

  @override
  String get releaseDateField => 'Release Date';

  @override
  String get priceExample => 'Price (e.g. 9.99)';

  @override
  String get deviceField => 'Device';

  @override
  String get genreField => 'Genre';

  @override
  String get descriptionField => 'Description';

  @override
  String get screenshotImageUrlField => 'Screenshot Image URL';

  @override
  String get systemRequirements => 'System Requirements';

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
  String get recommended => 'Recommended';

  @override
  String get addButton => 'Add';

  @override
  String get home => 'Home';

  @override
  String get search => 'Search';

  @override
  String get profile => 'Profile';

  @override
  String get appName => 'GamePedia';

  @override
  String get discoverTagline => 'Discover, save, and share your favorite games.';

  @override
  String get searchHint => 'Search games...';

  @override
  String get filterGamesTitle => 'Filter Games';

  @override
  String get reset => 'Reset';

  @override
  String get genreLabel => 'Genre';

  @override
  String get deviceLabel => 'Device';

  @override
  String get sortByPrice => 'Sort by Price';

  @override
  String get applyFilters => 'Apply Filters';

  @override
  String get noGamesMatchFilters => 'No games match the selected filters.';

  @override
  String get noGamesFound => 'No games found.';

  @override
  String get popularGames => 'Popular Games';

  @override
  String get newRelease => 'New Release';

  @override
  String get showAll => 'Show all';

  @override
  String get browseByGenre => 'Browse by Genre';

  @override
  String get browseByDevice => 'Browse by Device';

  @override
  String get deviceAll => 'All Devices';

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
  String get priceSortLowToHigh => 'Low to High';

  @override
  String get priceSortHighToLow => 'High to Low';

  @override
  String get releaseDate => 'Release Date';

  @override
  String get price => 'Price';

  @override
  String get availableOn => 'Available On';

  @override
  String get aboutThisGame => 'About this game';

  @override
  String get screenshots => 'Screenshots';

  @override
  String get reviews => 'Reviews';

  @override
  String get addReview => 'Add review';

  @override
  String get viewAll => 'View all';

  @override
  String get noReviewsYet => 'No reviews yet';

  @override
  String gamesFound(Object count) {
    return '$count games found';
  }

  @override
  String get userLabelUser => 'User';

  @override
  String get userLabelGuest => 'Guest';

  @override
  String get register => 'Register';

  @override
  String get login => 'Login';

  @override
  String get welcomeMessage => 'Welcome back!';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get termsOfServiceShort => 'Terms';

  @override
  String get logout => 'Logout';

  @override
  String get favoritesMigrated => 'Favorites migrated successfully.';

  @override
  String get migrateFavorites => 'Migrate Favorites';

  @override
  String get copyright => '© 2026 GamePedia. All rights reserved.';

  @override
  String get addReviewTitle => 'Add Review';

  @override
  String get writeYourReview => 'Write your review';

  @override
  String get yourName => 'Your name';

  @override
  String get game => 'Game';

  @override
  String get selectGame => 'Select a game';

  @override
  String get yourRating => 'Your rating';

  @override
  String get shareExperience => 'Share your experience with this game...';

  @override
  String get submit => 'Submit';

  @override
  String get reviewSubmittedSuccessfully => 'Review submitted successfully!';

  @override
  String get fillAllFields => 'Please fill all fields and select a rating';

  @override
  String failedToSubmitReview(Object error) {
    return 'Failed to submit review: $error';
  }

  @override
  String get allReviewsTitle => 'All Reviews';

  @override
  String reviewsFor(Object gameName) {
    return 'Reviews for $gameName';
  }

  @override
  String get noReviewsYetMsg => 'No reviews yet';

  @override
  String failedToLoadGames(Object error) {
    return 'Failed to load games: $error';
  }
}
