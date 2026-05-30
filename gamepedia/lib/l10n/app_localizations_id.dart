// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get signIn => 'Masuk';

  @override
  String get signUp => 'Daftar';

  @override
  String get signOut => 'Keluar';

  @override
  String get email => 'Email';

  @override
  String get pleaseEnterValidEmail => 'Silakan masukkan email yang valid';

  @override
  String get password => 'Kata Sandi';

  @override
  String get pleaseEnterPassword => 'Silakan masukkan kata sandi Anda';

  @override
  String get passwordTooShort =>
      'Kata sandi harus terdiri dari minimal 6 karakter';

  @override
  String get confirmPassword => 'Konfirmasi Kata Sandi';

  @override
  String get pleaseConfirmPassword => 'Silakan konfirmasi kata sandi Anda';

  @override
  String get passwordsDoNotMatch => 'Kata sandi tidak cocok';

  @override
  String get dontHaveAccount => 'Belum punya akun?';

  @override
  String get fullName => 'Nama Lengkap';

  @override
  String get pleaseEnterFullName => 'Silakan masukkan nama lengkap Anda';

  @override
  String get noUserFound => 'Pengguna dengan email tersebut tidak ditemukan';

  @override
  String get wrongPassword => 'Kata sandi salah. Silakan coba lagi.';

  @override
  String get weakPassword => 'Kata sandi yang diberikan terlalu lemah.';

  @override
  String get emailAlreadyInUse => 'Akun dengan email tersebut sudah ada.';

  @override
  String get invalidEmail => 'Alamat email tidak valid.';

  @override
  String get genericError => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String errorOccurred(Object error) {
    return 'Terjadi kesalahan: $error';
  }

  @override
  String get reportDetail => 'Detail Laporan';

  @override
  String get viewFullImage => 'Lihat gambar penuh';

  @override
  String get openInGoogleMaps => 'Buka di Google Maps';

  @override
  String get unableToOpenMaps => 'Tidak bisa membuka Google Maps';

  @override
  String get filterCategory => 'Filter Kategori';

  @override
  String get allCategories => 'Semua Kategori';

  @override
  String get noReportsInThisCategory => 'Tidak ada laporan untuk kategori ini.';

  @override
  String secondsAgo(Object count) {
    return '$count detik yang lalu';
  }

  @override
  String minutesAgo(Object count) {
    return '$count menit yang lalu';
  }

  @override
  String hoursAgo(Object count) {
    return '$count jam yang lalu';
  }

  @override
  String get oneDayAgo => '1 hari yang lalu';

  @override
  String get genreAll => 'Semua';

  @override
  String get genreAdventure => 'Petualangan';

  @override
  String get genreRolePlay => 'Bermain Peran';

  @override
  String get genreShooting => 'Menembak';

  @override
  String get genrePlatformer => 'Platformer';

  @override
  String get genrePuzzle => 'Teka Teki';

  @override
  String get genreHackAndSlash => 'Tebas Dan Potong';

  @override
  String get genreRealTimeStrategy => 'Strategi Waktu Nyata';

  @override
  String get genreTurnBaseStrategy => 'Strategi Berbasis Giliran';

  @override
  String get genreIndie => 'Indie';

  @override
  String get genreRacing => 'Balap';

  @override
  String get genreSport => 'Olahraga';

  @override
  String get genreFighting => 'Berkelahi';

  @override
  String get genreArcade => 'Arkade';

  @override
  String get genreSimulator => 'Simulasi';

  @override
  String get genrePointAndClick => 'Arahkan Dan Click';

  @override
  String get addPost => 'Tambah Laporan';

  @override
  String get takePicture => 'Ambil Foto';

  @override
  String get chooseFromGallery => 'Pilih dari Galeri';

  @override
  String get cancel => 'Batal';

  @override
  String get pleaseAddImageAndDescription =>
      'Silakan tambahkan gambar dan deskripsi.';

  @override
  String get userNotFoundPleaseSignIn =>
      'Pengguna tidak ditemukan. Silakan masuk.';

  @override
  String get postUploadedSuccessfully => 'Laporan berhasil diunggah!';

  @override
  String failedToUploadPost(Object error) {
    return 'Gagal mengunggah laporan: $error';
  }

  @override
  String get locationServicesDisabled => 'Layanan lokasi dinonaktifkan.';

  @override
  String get locationPermissionsDenied => 'Izin lokasi ditolak.';

  @override
  String failedToRetrieveLocation(Object error) {
    return 'Gagal mengambil lokasi: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return 'Gagal memilih gambar: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return 'Gagal mengompres gambar: $error';
  }

  @override
  String get generateAnotherDescription => 'Buat deskripsi lain';

  @override
  String get addBriefDescription => 'Tambahkan deskripsi singkat...';

  @override
  String get post => 'Kirim';

  @override
  String get notificationSent => '✅ Notifikasi berhasil dikirim';

  @override
  String notificationFailed(Object error) {
    return '❌ Gagal kirim notifikasi: $error';
  }

  @override
  String get settings => 'Pengaturan';

  @override
  String get language => 'Bahasa';

  @override
  String get unknownLanguage => 'Bahasa Tidak Dikenal';

  @override
  String get english => 'Inggris';

  @override
  String get indonesian => 'Indonesia';

  @override
  String get korean => 'Korea';

  // Add Game screen
  String get addGameTitle => 'Tambah Game';
  String get addButton => 'Tambah';
  String get systemRequirements => 'Spesifikasi Sistem';
  String get minimum => 'Minimum';
  String get recommended => 'Direkomendasikan';
  String get titleDeviceGenreRequired =>
      'Title, Device, dan Genre wajib diisi!';
  String get gameAdded => 'Game Berhasil Ditambahkan!';
  String failed(Object error) => 'Gagal: $error';

  // Form fields
  String get titleField => 'Title';
  String get studioField => 'Studio';
  String get ratingExample => 'Rating (ex: 8.5)';
  String get releaseDateField => 'Release Date';
  String get priceExample => 'Price (ex: 59.99)';
  String get deviceField => 'Device';
  String get genreField => 'Genre';
  String get descriptionField => 'Description';
  String get screenshotImageUrlField => 'Screenshot Image URL';
  String get osField => 'OS';
  String get processorField => 'Processor';
  String get memoryField => 'Memory';
  String get graphicsField => 'Graphics';
  String get storageField => 'Storage';

  // Navigation
  String get home => 'Home';
  String get search => 'Search';
  String get profile => 'Profile';

  // Misc
  String get favoritesMigrated => 'Favorites migrated to Firestore';
  String get appName => 'GamePedia';
  String get discoverTagline => 'Discover Amazing Games';
  String get userLabelUser => 'User';
  String get userLabelGuest => 'Guest';
  String get register => 'Register';
  String get login => 'Login';
  String get welcomeMessage => 'Welcome to GamePedia';
  String get editProfile => 'Edit Profile';
  String get wishlist => 'Wishlist';
  String get termsOfServiceShort => 'Terms of Service';
  String get logout => 'Logout';
  String get migrateFavorites => 'Migrate favorites to Firestore';
  String get copyright => '© GamePedia 2025';
}
