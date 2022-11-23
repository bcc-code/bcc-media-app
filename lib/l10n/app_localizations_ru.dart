import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class SRu extends S {
  SRu([String locale = 'ru']) : super(locale);

  @override
  String get loadingContent => 'Loading content';

  @override
  String get signInTooltip => 'Sign in to watch more content';

  @override
  String get skipToPublicContent => 'Skip to watch public content';

  @override
  String get minutesShort => 'min';

  @override
  String get calendarThisWeek => 'This week';

  @override
  String get calendarWeek => 'week';

  @override
  String get loading => 'Загрузка';

  @override
  String get loginPageDisplay1 => 'The most powerful message in the world';

  @override
  String get loginPageDisplay2 => 'Watch series, shows and films based on Christian values';

  @override
  String get loginPageDisplay3 => 'Produced by BCC Media';

  @override
  String get liveTab => 'Прямой эфир';

  @override
  String get logOutButton => 'Выйти';

  @override
  String get profileTab => 'Профиль';

  @override
  String get faq => 'Frequently asked questions';

  @override
  String get bccMediaCenter => 'BrunstadTV - это некоммерческий медиацентр, производящий и распространяющий контент, основанный на позитивных и христианских ценностях.';

  @override
  String get signInButton => 'Войти';

  @override
  String get tryAgainButton => 'Попробовать еще раз';

  @override
  String get loggedOutTitle => 'Не залогинен';

  @override
  String get loggedOutMessage => 'Вы вышли из системы. Пожалуйста, войдите снова.';

  @override
  String get mostWatched => 'Самое просматриваемое';

  @override
  String get mostRecent => 'Самое последнее';

  @override
  String get latelyPublished => 'Недавно опубликовано';

  @override
  String get anErrorOccurred => 'Возникла ошибка';

  @override
  String get ok => 'ОК';

  @override
  String get loginFailedCheckNetwork => 'Ошибка входа. Проверьте подключение к сети и попробуйте снова.';

  @override
  String get loginFailedTryAgain => 'Ошибка входа. Пожалуйста, попробуйте позже.';

  @override
  String get soundLanguage => 'Язык воспроизведения';

  @override
  String get subtitleLanguage => 'Язык субтитров';

  @override
  String get appLanguage => 'Язык приложения';

  @override
  String get checkNetwork => 'Проверьте подключение к сети и попробуйте снова.';

  @override
  String get tryAgain => 'Пожалуйста, попробуйте позже.';

  @override
  String get cantPlayVideo => 'Вы не можете воспроизводить это видео сейчас.';

  @override
  String get about => 'Инфо';

  @override
  String get version => 'Версия';

  @override
  String get contactSupport => 'Связаться с поддержкой';

  @override
  String get cancel => 'Отменить';

  @override
  String get upNext => 'К следующему';

  @override
  String get done => 'Готово';

  @override
  String get playerSettings => 'Настройки плеера';

  @override
  String get settings => 'Настройки';

  @override
  String get none => 'Нет';

  @override
  String get auto => 'Авто';

  @override
  String get live => 'Прямой эфир';

  @override
  String get subtitles => 'Субтитры';

  @override
  String get audio => 'Аудио';

  @override
  String get quality => 'Качество';

  @override
  String get seasons => 'Сезоны';

  @override
  String get episodes => 'Эпизоды';

  @override
  String get search => 'Поиск';

  @override
  String get noResults => 'No results found';

  @override
  String get doYouWantCast => 'Хотите показать это видео?';

  @override
  String get play => 'Играть';

  @override
  String get castQueue => 'Показывать очередь';

  @override
  String get options => 'Опции';

  @override
  String get remove => 'Удалить';

  @override
  String get queueLimitTitle => 'Лимит';

  @override
  String queueLimitMessage(int elementCount) {
    return 'You cannot have more than $elementCount elements in queue.';
  }

  @override
  String get recentSearches => 'Недавние поиски';

  @override
  String get tVLogin => 'ТВ Логин';

  @override
  String get tVLoginSuccessful => 'Успешный вход, пожалуйста, подтвердите на телевизоре.';

  @override
  String get seeMore => 'Смотреть больше';

  @override
  String get seeAll => 'Посмотреть все';

  @override
  String get series => 'Серии';

  @override
  String get livestreamMaintenance => 'К сожалению, прямой эфир в настоящее время находится на тех. обслуживании. Пожалуйста, попробуйте позже.';

  @override
  String get homeTab => 'Главная';

  @override
  String get sortBy => 'Сортировать по';

  @override
  String get videoQuality => 'Качество видео';

  @override
  String get low => 'Низкое';

  @override
  String get medium => 'Среднее';

  @override
  String get high => 'Высокое';

  @override
  String get emptySearch => 'You can search all content from BrunstadTV. Series, videos and episodes.';

  @override
  String get back => 'Назад';

  @override
  String get seasonLetter => 'С';

  @override
  String get episodeLetter => 'Э';

  @override
  String get atoZ => 'А-Я';

  @override
  String get ztoA => 'Я-А';

  @override
  String get shortFilms => 'Короткие фильмы';

  @override
  String get videos => 'Видео';

  @override
  String get moreInfo => 'Дополнительная информация';

  @override
  String get info => 'Информация';

  @override
  String get episode => 'Эпизод';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get pickPhoto => 'Выбрать из галереи';

  @override
  String get uploadFileTitle => 'Загрузить файл';

  @override
  String get uploadFileMessage => 'Вы хотите загрузить этот файл?';

  @override
  String watchingWith(int numPeople) {
    return 'You are watching with $numPeople others';
  }

  @override
  String get uploading => 'Загрузка';

  @override
  String get uploadFail => 'Загрузка не удалась';

  @override
  String get post => 'Опубликовать';

  @override
  String charactersLimit(int charsLeft, int charsTotal) {
    return '$charsLeft of $charsTotal characters left';
  }

  @override
  String get uploadingPostSuccess => 'Ваша публикация была отправлена.';

  @override
  String get testimonyInfo => 'Запишите видео на телефон.';

  @override
  String get yourVideo => 'Ваше видео';

  @override
  String get record => 'Записать';

  @override
  String get recordingTips => 'Несколько советов, чтобы получить хорошую запись';

  @override
  String get recordingTipA => 'Найдите тихое место для записи.';

  @override
  String get recordingTipB => 'Убедитесь, что ваше лицо освещено равномерно.';

  @override
  String get recordingTipC => 'Подумайте, что вы хотите сказать, прежде чем начать запись.';

  @override
  String get recordingTipD => 'Поверните ваш телефон в ландшафтный режим.';

  @override
  String get thankYou => 'Спасибо!';

  @override
  String get thankYouForContribution => 'Спасибо за ваш вклад!';

  @override
  String get uploadingVideoSuccess => 'Ваше видео было отправлено.';

  @override
  String get next => 'Дальше';

  @override
  String get recordVideoCameraPermissionAlert => 'Вы должны предоставить разрешение к камере в настройках, для записи видео.';

  @override
  String get recordVideoPhotosPermissionAlert => 'Вы должны предоставить разрешение к галерее в настройках, для записи видео.';

  @override
  String get recordVideoStoragePermissionAlert => 'Вы должны предоставить разрешение к хранилищу в настройках, для записи видео.';

  @override
  String get recordVideoMicrophonePermissionAlert => 'Вы должны предоставить разрешение к микрофону в настройках, для записи видео.';

  @override
  String get takePhotoStoragePermissionAlert => 'Вы должны предоставить разрешение к хранилищу в настройках, чтобы сделать фото.';

  @override
  String get takePhotoCameraPermissionAlert => 'Вы должны предоставить разрешение к камере в настройках, чтобы сделать фото.';

  @override
  String get pickPhotoStoragePermissionAlert => 'Вы должны предоставить доступ к хранилищу в настройках, чтобы выбрать фотографии.';

  @override
  String get permissionsAlertTitle => 'Требуются разрешения';

  @override
  String get add => 'Добавить';

  @override
  String get change => 'Изменить';

  @override
  String get recordingFailedTitle => 'Couldn\'t record the video';

  @override
  String get recordingFailedMessage => 'Что-то пошло не так при попытке записать видео.';

  @override
  String get pollSubtitle => 'Опрос';

  @override
  String get writeHere => 'Пишите здесь';

  @override
  String get feed => 'Лента';

  @override
  String get atmosphereFeedDescription => 'Внесите свой вклад в ленту активности, отправив сообщение, свидетельство или фотографию, оттуда где вы находитесь.';

  @override
  String get information => 'Информация';

  @override
  String get photoNotSupported => 'Съемка и выбор фотографий не поддерживаются на вашем устройстве.';

  @override
  String get answerFailed => 'К сожалению, мы не смогли отправить ответ. Пожалуйста, попробуйте еще раз.';

  @override
  String get question => 'Вопросы';

  @override
  String get notificationChannelPlayerName => 'Плеер';

  @override
  String get now => 'Сейчас';

  @override
  String get createPost => 'Создать пост';

  @override
  String get concernTextPlaceholder => 'Опишите проблему';

  @override
  String get debugInfoExplanation => 'Ваше сообщение будет содержать эту информацию, чтобы помочь нам лучше понять проблему.';

  @override
  String get send => 'Отправить';

  @override
  String get sending => 'Отправка';

  @override
  String get thankYouSupportTitle => 'Спасибо за ваш отзыв!';

  @override
  String get thankYouSupportDescription => 'Мы ценим все отзывы и постараемся решить эту проблему как можно скорее.';

  @override
  String get sendFail => 'Couldn\'t send you message';

  @override
  String get sendFailDescription => 'Что-то пошло не так. Проверьте подключение к интернету и попробуйте еще раз.';

  @override
  String get today => 'Сегодня';

  @override
  String get noNewPosts => 'Нет новых публикаций';

  @override
  String newPostsMultiple(int postCount) {
    return '$postCount new posts!';
  }

  @override
  String newPostsSingle(int postCount) {
    return '$postCount new post!';
  }

  @override
  String get expired => 'Прошёл';

  @override
  String availableFrom(String date) {
    return 'Available $date';
  }

  @override
  String get howFar => 'Как далеко вы прошли?';

  @override
  String get submit => 'Отправить';

  @override
  String get wellDone => 'Отлично сработано!';

  @override
  String wellDoneDistance(int distanceInKM) {
    return 'Well done! You have registered a total distance of $distanceInKM km';
  }

  @override
  String get distanceRegistered => 'Ваше расстояние было зарегистрировано. Продолжите ниже, если вы хотите отправить другое расстояние.';

  @override
  String ranMore(int distanceInKM) {
    return 'I went more than $distanceInKM km';
  }

  @override
  String moreThan(int distanceInKM) {
    return 'More than $distanceInKM km';
  }

  @override
  String get runningEffort => 'Отличное достижение! Введите количество километров, которое вы прошли ниже.';

  @override
  String get slideSelect => 'Сделайте слайд, чтобы выбрать, как далеко вы прошли';

  @override
  String get submitAnotherDistance => 'Отправить другое расстояние';

  @override
  String get editPicture => 'Редактировать изображение';

  @override
  String get profilePicture => 'Фотография профиля';

  @override
  String get firstPostTitle => 'Будьте первым, кто опубликует фото или сообщение';

  @override
  String timezoneInformation(String timeZone) {
    return 'Tv guide timetable is in your local time: $timeZone';
  }

  @override
  String get yourQuestion => 'Ваш вопрос';

  @override
  String get uploadingInquirySuccess => 'Обратите внимание, что не на все заданные вопросы даются ответы в трансляции.';

  @override
  String get askQuestion => 'Задать вопрос';

  @override
  String get submitQuestionInfo => 'Отправляя вопрос, вы соглашаетесь с тем, что его можно использовать в целях трансляции.';

  @override
  String get posting => 'Публикуется';

  @override
  String get submitPostInfo => 'Отправляя публикацию или фото, вы соглашаетесь с тем, что их можно использовать в целях трансляции. ';

  @override
  String get cropImage => 'Обрезать изображение';

  @override
  String get square => 'Квадрат';

  @override
  String get landscape => 'Ориентация';

  @override
  String get pollSingleChoice => 'Вы можете выбрать свой ответ только один раз.';

  @override
  String get pollMultipleChoice => 'Вы можете менять свой ответ несколько раз.';

  @override
  String get pollEnded => 'Опрос закончился. Спасибо за ваши ответы.';

  @override
  String get browserInstall => 'Пожалуйста, установите веб-браузер, чтобы иметь возможность открывать этот URL.';

  @override
  String get share => 'Поделиться';

  @override
  String get liveNow => 'В прямом эфире';

  @override
  String get program => 'Программа';

  @override
  String get participateTab => 'Участвовать';

  @override
  String get tomorrow => 'Завтра';

  @override
  String get readBy => 'Прочитано';

  @override
  String pollAnswer(String answer) {
    return 'You\'ve answered: $answer';
  }

  @override
  String get broadcasts => 'Трансляции';

  @override
  String get quizAnswered => 'Отправлено ответов';

  @override
  String get quizNotEnabled => 'Викторина в данный момент недоступна. Пожалуйста, повторите попытку позже.';

  @override
  String get calendar => 'Календарь';

  @override
  String get noEvents => 'Нет запланированных трансляций';

  @override
  String get appUpdateTitle => 'Требуется обновление';

  @override
  String get appUpdateRequest => 'Пожалуйста, загрузите последнюю версию приложения, чтобы пользоваться всеми последними функциями и исправлениями ошибок.';

  @override
  String get appUpdateAccepted => 'Обновление';

  @override
  String get donationNotAvailable => 'Пожертвование на данный момент недоступно. Пожалуйста, повторите попытку позже.';

  @override
  String posts(int postsCount) {
    return '$postsCount Posts';
  }

  @override
  String get copy => 'Копировать';

  @override
  String get reload => 'Перезагрузить';

  @override
  String get participantsTitle => 'Кто отвечает?';

  @override
  String get participantsSubtitle => 'Выберите одного или нескольких участников.';

  @override
  String get yourFamily => 'Твоя семья';

  @override
  String get yourTurn => 'Твой ход';

  @override
  String get fAQ => 'ЧАВО';

  @override
  String get shareStart => 'Поделиться с начала';

  @override
  String shareTime(String time) {
    return 'Share from time $time';
  }

  @override
  String get loadContentError => 'Couldn\'t load content';

  @override
  String get audioOnlyErrorDescription => 'Проверьте подключение к сети и попробуйте снова';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get tokenError => 'We couldn\'t confirm your identity, most likely due to a network problem. Some features of the app may not work correctly.';

  @override
  String get categoriesTab => 'Категории';

  @override
  String get settingsTab => 'Настройки';

  @override
  String get confirmLogin => 'Подтвердить вход';

  @override
  String get scanInfo => 'Отсканируйте код с помощью телефона для доступа на страницу входа.';

  @override
  String get validInfo => 'QR-код действителен в течение 15 минут.';

  @override
  String get confirmInfo => 'После успешного входа в систему на вашем устройстве, нажмите кнопку ниже, чтобы подтвердить вход.';

  @override
  String get seriesTab => 'Серии';

  @override
  String get filmsTab => 'Фильмы';

  @override
  String get eventsTab => 'События';

  @override
  String get audioLanguage => 'Язык воспроизведения';

  @override
  String get subtitlesLanguage => 'Язык субтитров';

  @override
  String get removeFromRecentSearches => 'Хотите удалить этот элемент из последних поисков?';

  @override
  String get noTransmissionToday => 'Нет запланированной трансляции на сегодня';

  @override
  String get livestreamMaintenanceTitle => 'Прямой эфир недоступен';

  @override
  String get start => 'Начало';

  @override
  String get transmissionSchedule => 'График трансляций';

  @override
  String get featured => 'Рекомендуемое';

  @override
  String get errorTryAgain => 'Что-то пошло не так. Пожалуйста, повторите попытку позже.';

  @override
  String get reportProblem => 'В случае каких-либо проблем используйте QR-код ниже, чтобы отправить нам письмо.';

  @override
  String get phoneReadingProblem => 'Если ваш телефон не может прочитать QR-код, отправьте нам электронное письмо со следующей информацией';

  @override
  String get goTo => 'или перейдите';

  @override
  String get watchBrunstad => 'Смотреть BrunstadTV в прямом эфире';

  @override
  String get notLogged => 'Не залогинен';

  @override
  String get authResponse0 => 'Пожалуйста, используйте новый QR-код для входа.';

  @override
  String get authResponse1 => 'Пожалуйста, войдите в систему на мобильном, с помощью QR-кода';

  @override
  String get authResponse3 => 'Проверьте подключение к сети и повторите попытку позже.';

  @override
  String get liveHeader => 'Прямой эфир';

  @override
  String get recentlyPublishedSection => 'Recently published';

  @override
  String get exploreCategoriesSection => 'Explore categories';

  @override
  String get programsSection => 'Programs';

  @override
  String get episodesSection => 'Эпизоды';

  @override
  String get categorySeries => 'Серии';

  @override
  String get categoryKids => 'Kids';

  @override
  String get categoryFilms => 'Фильмы';

  @override
  String get categoryEvents => 'События';

  @override
  String get categoryMusic => 'Music';

  @override
  String get noPlannedEvents => 'No planned events today';

  @override
  String get watchNow => 'Watch now';
}
