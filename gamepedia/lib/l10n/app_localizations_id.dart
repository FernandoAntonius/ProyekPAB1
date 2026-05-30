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
  String get english => 'Inggris';

  @override
  String get indonesian => 'Indonesia';

  @override
  String get korean => 'Korea';

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
}
