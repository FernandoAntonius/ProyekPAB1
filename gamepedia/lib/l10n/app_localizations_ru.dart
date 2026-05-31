// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get signIn => 'Войти';

  @override
  String get signUp => 'Зарегистрироваться';

  @override
  String get signOut => 'Выйти';

  @override
  String get email => 'Эл. почта';

  @override
  String get pleaseEnterValidEmail => 'Пожалуйста, введите корректный адрес эл. почты';

  @override
  String get password => 'Пароль';

  @override
  String get pleaseEnterPassword => 'Пожалуйста, введите ваш пароль';

  @override
  String get passwordTooShort => 'Пароль должен содержать не менее 6 символов';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get pleaseConfirmPassword => 'Пожалуйста, подтвердите ваш пароль';

  @override
  String get passwordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get dontHaveAccount => 'Нет аккаунта?';

  @override
  String get fullName => 'Полное имя';

  @override
  String get pleaseEnterFullName => 'Пожалуйста, введите ваше полное имя';

  @override
  String get noUserFound => 'Пользователь с таким адресом эл. почты не найден';

  @override
  String get wrongPassword => 'Неверный пароль. Пожалуйста, попробуйте снова.';

  @override
  String get weakPassword => 'Указанный пароль слишком слабый.';

  @override
  String get emailAlreadyInUse => 'Аккаунт с таким адресом эл. почты уже существует.';

  @override
  String get invalidEmail => 'Адрес эл. почты недействителен.';

  @override
  String get genericError => 'Произошла ошибка. Пожалуйста, попробуйте снова.';

  @override
  String errorOccurred(Object error) {
    return 'Произошла ошибка: $error';
  }

  @override
  String get reportDetail => 'Подробности отчёта';

  @override
  String get viewFullImage => 'Просмотреть полное изображение';

  @override
  String get openInGoogleMaps => 'Открыть в Google Картах';

  @override
  String get unableToOpenMaps => 'Не удалось открыть Google Карты';

  @override
  String get filterCategory => 'Фильтр по категории';

  @override
  String get allCategories => 'Все категории';

  @override
  String get noReportsInThisCategory => 'Отчётов в этой категории нет.';

  @override
  String secondsAgo(Object count) {
    return '$count сек. назад';
  }

  @override
  String minutesAgo(Object count) {
    return '$count мин. назад';
  }

  @override
  String hoursAgo(Object count) {
    return '$count ч. назад';
  }

  @override
  String get oneDayAgo => '1 день назад';

  @override
  String get genreAll => 'Все';

  @override
  String get genreAdventure => 'Приключения';

  @override
  String get genreRolePlay => 'Ролевые игры';

  @override
  String get genreShooting => 'Шутер';

  @override
  String get genrePlatformer => 'Платформер';

  @override
  String get genrePuzzle => 'Головоломка';

  @override
  String get genreHackAndSlash => 'Рубилово';

  @override
  String get genreRealTimeStrategy => 'Стратегия в реальном времени';

  @override
  String get genreTurnBaseStrategy => 'Пошаговая стратегия';

  @override
  String get genreIndie => 'Инди';

  @override
  String get genreRacing => 'Гонки';

  @override
  String get genreSport => 'Спорт';

  @override
  String get genreFighting => 'Файтинг';

  @override
  String get genreArcade => 'Аркада';

  @override
  String get genreSimulator => 'Симулятор';

  @override
  String get genrePointAndClick => 'Поинт-энд-клик';

  @override
  String get addPost => 'Добавить пост';

  @override
  String get takePicture => 'Сделать фото';

  @override
  String get chooseFromGallery => 'Выбрать из галереи';

  @override
  String get cancel => 'Отмена';

  @override
  String get pleaseAddImageAndDescription => 'Пожалуйста, добавьте изображение и описание.';

  @override
  String get userNotFoundPleaseSignIn => 'Пользователь не найден. Пожалуйста, войдите.';

  @override
  String get postUploadedSuccessfully => 'Пост успешно загружен!';

  @override
  String failedToUploadPost(Object error) {
    return 'Не удалось загрузить пост: $error';
  }

  @override
  String get locationServicesDisabled => 'Службы геолокации отключены.';

  @override
  String get locationPermissionsDenied => 'Доступ к геолокации запрещён.';

  @override
  String failedToRetrieveLocation(Object error) {
    return 'Не удалось получить местоположение: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return 'Не удалось выбрать изображение: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return 'Не удалось сжать изображение: $error';
  }

  @override
  String get generateAnotherDescription => 'Создать другое описание';

  @override
  String get addBriefDescription => 'Добавить краткое описание...';

  @override
  String get post => 'Опубликовать';

  @override
  String get notificationSent => '✅ Уведомление успешно отправлено';

  @override
  String notificationFailed(Object error) {
    return '❌ Не удалось отправить уведомление: $error';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get language => 'Язык';

  @override
  String get unknownLanguage => 'Неизвестный язык';

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
  String get spanish => 'Spain';

  @override
  String get filipino => 'Tagalog';

  @override
  String get russian => 'Russian';

  @override
  String get japanese => 'Japanese';

  @override
  String get arabic => 'Arabic';

  @override
  String get titleDeviceGenreRequired => 'Название, устройство и жанр обязательны.';

  @override
  String get gameAdded => 'Игра успешно добавлена!';

  @override
  String failed(Object error) {
    return 'Не удалось загрузить игру: $error';
  }

  @override
  String get addGameTitle => 'Добавить игру';

  @override
  String get titleField => 'Название';

  @override
  String get studioField => 'Студия';

  @override
  String get ratingExample => 'Рейтинг (например, 4.5)';

  @override
  String get releaseDateField => 'Дата выхода';

  @override
  String get priceExample => 'Цена (например, 9.99)';

  @override
  String get deviceField => 'Устройство';

  @override
  String get genreField => 'Жанр';

  @override
  String get descriptionField => 'Описание';

  @override
  String get screenshotImageUrlField => 'URL скриншота';

  @override
  String get systemRequirements => 'Системные требования';

  @override
  String get minimum => 'Минимальные';

  @override
  String get osField => 'ОС';

  @override
  String get processorField => 'Процессор';

  @override
  String get memoryField => 'Память';

  @override
  String get graphicsField => 'Видеокарта';

  @override
  String get storageField => 'Накопитель';

  @override
  String get recommended => 'Рекомендуемые';

  @override
  String get addButton => 'Добавить';

  @override
  String get home => 'Главная';

  @override
  String get search => 'Поиск';

  @override
  String get profile => 'Профиль';

  @override
  String get appName => 'GamePedia';

  @override
  String get discoverTagline => 'Открывайте, сохраняйте и делитесь любимыми играми.';

  @override
  String get searchHint => 'Поиск игр...';

  @override
  String get filterGamesTitle => 'Фильтр игр';

  @override
  String get reset => 'Сбросить';

  @override
  String get genreLabel => 'Жанр';

  @override
  String get deviceLabel => 'Устройство';

  @override
  String get sortByPrice => 'Сортировка по цене';

  @override
  String get applyFilters => 'Применить фильтры';

  @override
  String get noGamesMatchFilters => 'Нет игр, соответствующих выбранным фильтрам.';

  @override
  String get noGamesFound => 'Игры не найдены.';

  @override
  String get popularGames => 'Популярные игры';

  @override
  String get newRelease => 'Новинки';

  @override
  String get showAll => 'Показать все';

  @override
  String get browseByGenre => 'Обзор по жанру';

  @override
  String get browseByDevice => 'Обзор по устройству';

  @override
  String get deviceAll => 'Все устройства';

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
  String get priceSortDefault => 'По умолчанию';

  @override
  String get priceSortLowToHigh => 'По возрастанию';

  @override
  String get priceSortHighToLow => 'По убыванию';

  @override
  String get releaseDate => 'Дата выхода';

  @override
  String get price => 'Цена';

  @override
  String get availableOn => 'Доступно на';

  @override
  String get aboutThisGame => 'Об игре';

  @override
  String get screenshots => 'Скриншоты';

  @override
  String get reviews => 'Отзывы';

  @override
  String get addReview => 'Добавить отзыв';

  @override
  String get viewAll => 'Посмотреть все';

  @override
  String get noReviewsYet => 'Отзывов ещё нет';

  @override
  String gamesFound(Object count) {
    return 'Найдено игр: $count';
  }

  @override
  String get userLabelUser => 'Пользователь';

  @override
  String get userLabelGuest => 'Гость';

  @override
  String get register => 'Регистрация';

  @override
  String get login => 'Вход';

  @override
  String get welcomeMessage => 'С возвращением!';

  @override
  String get editProfile => 'Редактировать профиль';

  @override
  String get wishlist => 'Список желаний';

  @override
  String get termsOfServiceShort => 'Условия';

  @override
  String get logout => 'Выйти';

  @override
  String get favoritesMigrated => 'Избранное успешно перенесено.';

  @override
  String get migrateFavorites => 'Перенести избранное';

  @override
  String get copyright => '© 2026 GamePedia. Все права защищены.';

  @override
  String get addReviewTitle => 'Добавить отзыв';

  @override
  String get writeYourReview => 'Напишите ваш отзыв';

  @override
  String get yourName => 'Ваше имя';

  @override
  String get game => 'Игра';

  @override
  String get selectGame => 'Выберите игру';

  @override
  String get yourRating => 'Ваша оценка';

  @override
  String get shareExperience => 'Поделитесь впечатлениями об этой игре...';

  @override
  String get submit => 'Отправить';

  @override
  String get reviewSubmittedSuccessfully => 'Отзыв успешно отправлен!';

  @override
  String get fillAllFields => 'Пожалуйста, заполните все поля и выберите оценку';

  @override
  String failedToSubmitReview(Object error) {
    return 'Не удалось отправить отзыв: $error';
  }

  @override
  String get allReviewsTitle => 'Все отзывы';

  @override
  String reviewsFor(Object gameName) {
    return 'Отзывы о $gameName';
  }

  @override
  String get noReviewsYetMsg => 'Отзывов ещё нет';

  @override
  String failedToLoadGames(Object error) {
    return 'Не удалось загрузить игры: $error';
  }
}
