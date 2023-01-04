import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class SRu extends S {
  SRu([String locale = 'ru']) : super(locale);

  @override
  String get loadingContent => 'Загрузка контента';

  @override
  String get signInTooltip => 'Войдите, чтобы смотреть больше контента';

  @override
  String get skipToPublicContent => 'Перейти к просмотру общедоступного контента';

  @override
  String get minutesShort => 'мин';

  @override
  String get calendarThisWeek => 'На этой неделе';

  @override
  String get calendarWeek => 'неделя';

  @override
  String get loading => 'Загрузка';

  @override
  String get loginPageDisplay1 => 'Самое мощное послание в мире';

  @override
  String get loginPageDisplay2 => 'Смотрите сериалы, шоу и фильмы, основанные на христианских ценностях';

  @override
  String get loginPageDisplay3 => 'Произведено BCC Media';

  @override
  String get liveTab => 'Прямой эфир';

  @override
  String get logOutButton => 'Выйти';

  @override
  String get profileTab => 'Профиль';

  @override
  String get faq => 'Часто задаваемые вопросы';

  @override
  String get bccMediaCenter => 'BCC Media is a media foundation in the BCC federation that produces and distributes content with positive and Christian values.';

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
  String get noResults => 'Результатов не найдено';

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
    return 'В очереди не может быть больше элементов, чем $elementCount.';
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
  String get emptySearch => 'You can search all content from BCC Media. Series, videos and episodes.';

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
  String get uploading => 'Загрузка';

  @override
  String get uploadFail => 'Загрузка не удалась';

  @override
  String charactersLimit(int charsLeft, int charsTotal) {
    return 'Осталось $charsLeft из $charsTotal символов';
  }

  @override
  String get thankYou => 'Спасибо!';

  @override
  String get thankYouForContribution => 'Спасибо за ваш вклад!';

  @override
  String get next => 'Дальше';

  @override
  String get add => 'Добавить';

  @override
  String get change => 'Изменить';

  @override
  String get writeHere => 'Пишите здесь';

  @override
  String get feed => 'Лента';

  @override
  String get information => 'Информация';

  @override
  String get question => 'Вопросы';

  @override
  String get now => 'Сейчас';

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
  String get sendFail => 'Не удалось отправить ваше сообщение';

  @override
  String get sendFailDescription => 'Что-то пошло не так. Проверьте подключение к интернету и попробуйте еще раз.';

  @override
  String get today => 'Сегодня';

  @override
  String get expired => 'Прошёл';

  @override
  String availableFrom(String date) {
    return 'Доступно $date';
  }

  @override
  String get submit => 'Отправить';

  @override
  String get wellDone => 'Отлично сработано!';

  @override
  String get editPicture => 'Редактировать изображение';

  @override
  String get profilePicture => 'Фотография профиля';

  @override
  String timezoneInformation(String timeZone) {
    return 'Расписание телепрограммы указано по вашему местному времени: $timeZone';
  }

  @override
  String get share => 'Поделиться';

  @override
  String get liveNow => 'В прямом эфире';

  @override
  String get tomorrow => 'Завтра';

  @override
  String get readBy => 'Прочитано';

  @override
  String get broadcasts => 'Трансляции';

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
  String get copy => 'Копировать';

  @override
  String get reload => 'Перезагрузить';

  @override
  String get fAQ => 'ЧАВО';

  @override
  String get shareStart => 'Поделиться с начала';

  @override
  String shareTime(String time) {
    return 'Поделиться с времени $time';
  }

  @override
  String get loadContentError => 'Не удалось загрузить контент';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get categoriesTab => 'Категории';

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
  String get featured => 'Рекомендуемое';

  @override
  String get errorTryAgain => 'Что-то пошло не так. Пожалуйста, повторите попытку позже.';

  @override
  String get liveHeader => 'Прямой эфир';

  @override
  String get programsSection => 'Программы';

  @override
  String get noPlannedEvents => 'В этот день мероприятий не запланировано';

  @override
  String get watchNow => 'Смотреть сейчас';

  @override
  String get exploreContent => 'Исследуйте контент';

  @override
  String get taskCompleted => 'task completed';

  @override
  String get tasksCompleted => 'tasks completed';

  @override
  String get studyCompleteTaskDescription => 'Complete tasks and discover related resources';

  @override
  String get discoverMore => 'Discover more';

  @override
  String get studyDiscoverMoreDescription => 'Find more inspiration and insight from related resources';

  @override
  String get watchAgain => 'Watch again';

  @override
  String get continueToTaskIn => 'Continue to task in';

  @override
  String get continueToTasksIn => 'Continue to tasks in';

  @override
  String get studyLessonCompleted => 'lesson completed';

  @override
  String get studyLessonsCompleted => 'lessons completed';

  @override
  String get continueStudy => 'Continue study';

  @override
  String get startStudy => 'Start study';

  @override
  String get videoCompletedText => 'Great job on completing the video.';

  @override
  String get achievementFirstDescription => 'Great job on completing the video and earning your first progress achievement.';

  @override
  String achievementStudyTopic(String name) {
    return 'Great job on completing the study topic $name';
  }

  @override
  String videoCount(int count) {
    return '$count videos';
  }

  @override
  String taskCount(int count) {
    return '$count tasks';
  }

  @override
  String posterCount(int count) {
    return '$count posters';
  }

  @override
  String resourceCount(int count) {
    return '$count resources';
  }

  @override
  String get continueButton => 'Continue';

  @override
  String get achievements => 'Achievements';
}
