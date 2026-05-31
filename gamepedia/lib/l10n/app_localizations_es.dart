// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get signUp => 'Registrarse';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get email => 'Correo electrónico';

  @override
  String get pleaseEnterValidEmail => 'Por favor, ingresa un correo electrónico válido';

  @override
  String get password => 'Contraseña';

  @override
  String get pleaseEnterPassword => 'Por favor, ingresa tu contraseña';

  @override
  String get passwordTooShort => 'La contraseña debe tener al menos 6 caracteres';

  @override
  String get confirmPassword => 'Confirmar contraseña';

  @override
  String get pleaseConfirmPassword => 'Por favor, confirma tu contraseña';

  @override
  String get passwordsDoNotMatch => 'Las contraseñas no coinciden';

  @override
  String get dontHaveAccount => '¿No tienes una cuenta?';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get pleaseEnterFullName => 'Por favor, ingresa tu nombre completo';

  @override
  String get noUserFound => 'No se encontró ningún usuario con ese correo';

  @override
  String get wrongPassword => 'Contraseña incorrecta. Por favor, inténtalo de nuevo.';

  @override
  String get weakPassword => 'La contraseña proporcionada es demasiado débil.';

  @override
  String get emailAlreadyInUse => 'Ya existe una cuenta con ese correo electrónico.';

  @override
  String get invalidEmail => 'La dirección de correo electrónico no es válida.';

  @override
  String get genericError => 'Ocurrió un error. Por favor, inténtalo de nuevo.';

  @override
  String errorOccurred(Object error) {
    return 'Ocurrió un error: $error';
  }

  @override
  String get reportDetail => 'Detalle del reporte';

  @override
  String get viewFullImage => 'Ver imagen completa';

  @override
  String get openInGoogleMaps => 'Abrir en Google Maps';

  @override
  String get unableToOpenMaps => 'No se puede abrir Google Maps';

  @override
  String get filterCategory => 'Filtrar categoría';

  @override
  String get allCategories => 'Todas las categorías';

  @override
  String get noReportsInThisCategory => 'No hay reportes en esta categoría.';

  @override
  String secondsAgo(Object count) {
    return 'hace $count seg';
  }

  @override
  String minutesAgo(Object count) {
    return 'hace $count min';
  }

  @override
  String hoursAgo(Object count) {
    return 'hace $count h';
  }

  @override
  String get oneDayAgo => 'hace 1 día';

  @override
  String get genreAll => 'Todos';

  @override
  String get genreAdventure => 'Aventura';

  @override
  String get genreRolePlay => 'Rol';

  @override
  String get genreShooting => 'Disparos';

  @override
  String get genrePlatformer => 'Plataformas';

  @override
  String get genrePuzzle => 'Puzle';

  @override
  String get genreHackAndSlash => 'Hack and Slash';

  @override
  String get genreRealTimeStrategy => 'Estrategia en tiempo real';

  @override
  String get genreTurnBaseStrategy => 'Estrategia por turnos';

  @override
  String get genreIndie => 'Indie';

  @override
  String get genreRacing => 'Carreras';

  @override
  String get genreSport => 'Deportes';

  @override
  String get genreFighting => 'Lucha';

  @override
  String get genreArcade => 'Arcade';

  @override
  String get genreSimulator => 'Simulador';

  @override
  String get genrePointAndClick => 'Apunta y clica';

  @override
  String get addPost => 'Agregar publicación';

  @override
  String get takePicture => 'Tomar una foto';

  @override
  String get chooseFromGallery => 'Elegir de la galería';

  @override
  String get cancel => 'Cancelar';

  @override
  String get pleaseAddImageAndDescription => 'Por favor, agrega una imagen y una descripción.';

  @override
  String get userNotFoundPleaseSignIn => 'Usuario no encontrado. Por favor, inicia sesión.';

  @override
  String get postUploadedSuccessfully => '¡Publicación subida con éxito!';

  @override
  String failedToUploadPost(Object error) {
    return 'Error al subir la publicación: $error';
  }

  @override
  String get locationServicesDisabled => 'Los servicios de ubicación están desactivados.';

  @override
  String get locationPermissionsDenied => 'Los permisos de ubicación están denegados.';

  @override
  String failedToRetrieveLocation(Object error) {
    return 'Error al obtener la ubicación: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return 'Error al seleccionar la imagen: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return 'Error al comprimir la imagen: $error';
  }

  @override
  String get generateAnotherDescription => 'Generar otra descripción';

  @override
  String get addBriefDescription => 'Agrega una descripción breve...';

  @override
  String get post => 'Publicar';

  @override
  String get notificationSent => '✅ Notificación enviada con éxito';

  @override
  String notificationFailed(Object error) {
    return '❌ Error al enviar la notificación: $error';
  }

  @override
  String get settings => 'Configuración';

  @override
  String get language => 'Idioma';

  @override
  String get unknownLanguage => 'Idioma desconocido';

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
  String get arabic => 'Árabic';

  @override
  String get titleDeviceGenreRequired => 'El título, el dispositivo y el género son obligatorios.';

  @override
  String get gameAdded => '¡Juego agregado con éxito!';

  @override
  String failed(Object error) {
    return 'Error al subir el juego: $error';
  }

  @override
  String get addGameTitle => 'Agregar juego';

  @override
  String get titleField => 'Título';

  @override
  String get studioField => 'Estudio';

  @override
  String get ratingExample => 'Calificación (p. ej. 4.5)';

  @override
  String get releaseDateField => 'Fecha de lanzamiento';

  @override
  String get priceExample => 'Precio (p. ej. 9.99)';

  @override
  String get deviceField => 'Dispositivo';

  @override
  String get genreField => 'Género';

  @override
  String get descriptionField => 'Descripción';

  @override
  String get screenshotImageUrlField => 'URL de imagen de captura';

  @override
  String get systemRequirements => 'Requisitos del sistema';

  @override
  String get minimum => 'Mínimo';

  @override
  String get osField => 'SO';

  @override
  String get processorField => 'Procesador';

  @override
  String get memoryField => 'Memoria';

  @override
  String get graphicsField => 'Gráficos';

  @override
  String get storageField => 'Almacenamiento';

  @override
  String get recommended => 'Recomendado';

  @override
  String get addButton => 'Agregar';

  @override
  String get home => 'Inicio';

  @override
  String get search => 'Buscar';

  @override
  String get profile => 'Perfil';

  @override
  String get appName => 'GamePedia';

  @override
  String get discoverTagline => 'Descubre, guarda y comparte tus juegos favoritos.';

  @override
  String get searchHint => 'Buscar juegos...';

  @override
  String get filterGamesTitle => 'Filtrar juegos';

  @override
  String get reset => 'Restablecer';

  @override
  String get genreLabel => 'Género';

  @override
  String get deviceLabel => 'Dispositivo';

  @override
  String get sortByPrice => 'Ordenar por precio';

  @override
  String get applyFilters => 'Aplicar filtros';

  @override
  String get noGamesMatchFilters => 'Ningún juego coincide con los filtros seleccionados.';

  @override
  String get noGamesFound => 'No se encontraron juegos.';

  @override
  String get popularGames => 'Juegos populares';

  @override
  String get newRelease => 'Nuevo lanzamiento';

  @override
  String get showAll => 'Ver todos';

  @override
  String get browseByGenre => 'Explorar por género';

  @override
  String get browseByDevice => 'Explorar por dispositivo';

  @override
  String get deviceAll => 'Todos los dispositivos';

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
  String get priceSortDefault => 'Predeterminado';

  @override
  String get priceSortLowToHigh => 'De menor a mayor';

  @override
  String get priceSortHighToLow => 'De mayor a menor';

  @override
  String get releaseDate => 'Fecha de lanzamiento';

  @override
  String get price => 'Precio';

  @override
  String get availableOn => 'Disponible en';

  @override
  String get aboutThisGame => 'Acerca de este juego';

  @override
  String get screenshots => 'Capturas de pantalla';

  @override
  String get reviews => 'Reseñas';

  @override
  String get addReview => 'Agregar reseña';

  @override
  String get viewAll => 'Ver todo';

  @override
  String get noReviewsYet => 'Sin reseñas aún';

  @override
  String gamesFound(Object count) {
    return '$count juegos encontrados';
  }

  @override
  String get userLabelUser => 'Usuario';

  @override
  String get userLabelGuest => 'Invitado';

  @override
  String get register => 'Registrarse';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get welcomeMessage => '¡Bienvenido de nuevo!';

  @override
  String get editProfile => 'Editar perfil';

  @override
  String get wishlist => 'Lista de deseos';

  @override
  String get termsOfServiceShort => 'Términos';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get favoritesMigrated => 'Favoritos migrados con éxito.';

  @override
  String get migrateFavorites => 'Migrar favoritos';

  @override
  String get copyright => '© 2026 GamePedia. Todos los derechos reservados.';

  @override
  String get addReviewTitle => 'Agregar reseña';

  @override
  String get writeYourReview => 'Escribe tu reseña';

  @override
  String get yourName => 'Tu nombre';

  @override
  String get game => 'Juego';

  @override
  String get selectGame => 'Selecciona un juego';

  @override
  String get yourRating => 'Tu calificación';

  @override
  String get shareExperience => 'Comparte tu experiencia con este juego...';

  @override
  String get submit => 'Enviar';

  @override
  String get reviewSubmittedSuccessfully => '¡Reseña enviada con éxito!';

  @override
  String get fillAllFields => 'Por favor, completa todos los campos y selecciona una calificación';

  @override
  String failedToSubmitReview(Object error) {
    return 'Error al enviar la reseña: $error';
  }

  @override
  String get allReviewsTitle => 'Todas las reseñas';

  @override
  String reviewsFor(Object gameName) {
    return 'Reseñas de $gameName';
  }

  @override
  String get noReviewsYetMsg => 'Sin reseñas aún';

  @override
  String failedToLoadGames(Object error) {
    return 'Error al cargar los juegos: $error';
  }
}
