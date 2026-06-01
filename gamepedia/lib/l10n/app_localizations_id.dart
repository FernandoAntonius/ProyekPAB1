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
  String get passwordTooShort => 'Kata sandi harus terdiri dari minimal 6 karakter';

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
  String get pleaseAddImageAndDescription => 'Silakan tambahkan gambar dan deskripsi.';

  @override
  String get userNotFoundPleaseSignIn => 'Pengguna tidak ditemukan. Silakan masuk.';

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
  String get english => 'English';

  @override
  String get indonesian => 'Bahasa Indonesia';

  @override
  String get korean => 'Korea';

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
  String get titleDeviceGenreRequired => 'Judul, perangkat, dan genre wajib diisi.';

  @override
  String get gameAdded => 'Game berhasil ditambahkan!';

  @override
  String failed(Object error) {
    return 'Gagal mengunggah game: $error';
  }

  @override
  String get addGameTitle => 'Tambah Game';

  @override
  String get titleField => 'Judul';

  @override
  String get studioField => 'Studio';

  @override
  String get ratingExample => 'Rating (misalnya 4.5)';

  @override
  String get releaseDateField => 'Tanggal Rilis';

  @override
  String get priceExample => 'Harga (misalnya 9.99)';

  @override
  String get deviceField => 'Perangkat';

  @override
  String get genreField => 'Genre';

  @override
  String get descriptionField => 'Deskripsi';

  @override
  String get screenshotImageUrlField => 'URL Gambar Tangkapan Layar';

  @override
  String get systemRequirements => 'Persyaratan Sistem';

  @override
  String get thumbnailUrl => 'URL Thumbnail';

  @override
  String get termsOfService => 'Ketentuan Layanan';

  @override
  String get iUnderstand => 'Saya Mengerti';

  @override
  String get minimum => 'Minimum';

  @override
  String get osField => 'OS';

  @override
  String get processorField => 'Prosesor';

  @override
  String get memoryField => 'Memori';

  @override
  String get graphicsField => 'Grafis';

  @override
  String get storageField => 'Penyimpanan';

  @override
  String get recommended => 'Direkomendasikan';

  @override
  String get addButton => 'Tambahkan';

  @override
  String get home => 'Beranda';

  @override
  String get search => 'Cari';

  @override
  String get profile => 'Profil';

  @override
  String get appName => 'GamePedia';

  @override
  String get discoverTagline => 'Temukan, simpan, dan bagikan game favorit Anda.';

  @override
  String get searchHint => 'Cari game...';

  @override
  String get filterGamesTitle => 'Filter Game';

  @override
  String get reset => 'Reset';

  @override
  String get genreLabel => 'Genre';

  @override
  String get deviceLabel => 'Perangkat';

  @override
  String get sortByPrice => 'Urutkan berdasarkan Harga';

  @override
  String get applyFilters => 'Terapkan Filter';

  @override
  String get noGamesMatchFilters => 'Tidak ada game yang cocok dengan filter yang dipilih.';

  @override
  String get noGamesFound => 'Tidak ada game ditemukan.';

  @override
  String get popularGames => 'Game Populer';

  @override
  String get newRelease => 'Rilisan Terbaru';

  @override
  String get showAll => 'Tampilkan semua';

  @override
  String get browseByGenre => 'Jelajahi berdasarkan Genre';

  @override
  String get browseByDevice => 'Jelajahi berdasarkan Perangkat';

  @override
  String get deviceAll => 'Semua Perangkat';

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
  String get priceSortLowToHigh => 'Harga Rendah ke Tinggi';

  @override
  String get priceSortHighToLow => 'Harga Tinggi ke Rendah';

  @override
  String get releaseDate => 'Tanggal Rilis';

  @override
  String get price => 'Harga';

  @override
  String get availableOn => 'Tersedia Di';

  @override
  String get aboutThisGame => 'Tentang game ini';

  @override
  String get screenshots => 'Cuplikan layar';

  @override
  String get reviews => 'Ulasan';

  @override
  String get addReview => 'Tambah ulasan';

  @override
  String get viewAll => 'Lihat semua';

  @override
  String get noReviewsYet => 'Belum ada ulasan';

  @override
  String gamesFound(Object count) {
    return '$count game ditemukan';
  }

  @override
  String get userLabelUser => 'Pengguna';

  @override
  String get userLabelGuest => 'Tamu';

  @override
  String get register => 'Daftar';

  @override
  String get login => 'Masuk';

  @override
  String get welcomeMessage => 'Selamat datang kembali!';

  @override
  String get editProfile => 'Edit Profil';

  @override
  String get wishlist => 'Daftar Keinginan';

  @override
  String get termsOfServiceShort => 'Ketentuan';

  @override
  String get logout => 'Keluar';

  @override
  String get favoritesMigrated => 'Favorit berhasil dipindahkan.';

  @override
  String get migrateFavorites => 'Pindahkan Favorit';

  @override
  String get copyright => '© 2026 GamePedia. Semua hak dilindungi.';

  @override
  String get addReviewTitle => 'Tambah Ulasan';

  @override
  String get writeYourReview => 'Tulis ulasan Anda';

  @override
  String get yourName => 'Nama Anda';

  @override
  String get game => 'Game';

  @override
  String get selectGame => 'Pilih game';

  @override
  String get yourRating => 'Rating Anda';

  @override
  String get shareExperience => 'Bagikan pengalaman Anda dengan game ini...';

  @override
  String get submit => 'Kirim';

  @override
  String get reviewSubmittedSuccessfully => 'Ulasan berhasil dikirim!';

  @override
  String get fillAllFields => 'Silakan isi semua field dan pilih rating';

  @override
  String failedToSubmitReview(Object error) {
    return 'Gagal mengirim ulasan: $error';
  }

  @override
  String get allReviewsTitle => 'Semua Ulasan';

  @override
  String reviewsFor(Object gameName) {
    return 'Ulasan untuk $gameName';
  }

  @override
  String get noReviewsYetMsg => 'Belum ada ulasan';

  @override
  String failedToLoadGames(Object error) {
    return 'Gagal memuat game: $error';
  }

  @override
  String gamesSaved(Object count) {
    return '$count game tersimpan.';
  }

  @override
  String get yourWishlistEmpty => 'Daftar keinginan Anda kosong :(';

  @override
  String get startAddingGames => 'Mulai tambahkan game yang Anda minati!';

  @override
  String get unableToLoadWishlistGames => 'Tidak dapat memuat game daftar keinginan.';

  @override
  String get welcomeToGamePedia => 'Selamat datang di GamePedia!';

  @override
  String get termsOfServiceDescription => 'Silakan baca Ketentuan Layanan ini dengan hati-hati sebelum menggunakan GamePedia.';

  @override
  String get tosTermsContent => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  String get sysReqOS => 'Sistem Operasi';

  @override
  String get sysReqProcessor => 'Prosesor';

  @override
  String get sysReqMemory => 'Memori (RAM)';

  @override
  String get sysReqGraphics => 'Kartu Grafis';

  @override
  String get sysReqStorage => 'Ruang Penyimpanan';

  @override
  String get sysReqDirectX => 'Versi DirectX';

  @override
  String get sysReqNetwork => 'Jaringan';

  @override
  String get sysReqSoundCard => 'Kartu Suara';
}
