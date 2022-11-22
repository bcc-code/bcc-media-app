import 'app_localizations.dart';

/// The translations for Polish (`pl`).
class SPl extends S {
  SPl([String locale = 'pl']) : super(locale);

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
  String get loading => 'Ładuję';

  @override
  String get loginPageDisplay1 => 'The most powerful message in the world';

  @override
  String get loginPageDisplay2 => 'Watch series, shows and films based on Christian values';

  @override
  String get loginPageDisplay3 => 'Produced by BCC Media';

  @override
  String get liveTab => 'Na żywo';

  @override
  String get logOutButton => 'Wyloguj się';

  @override
  String get profileTab => 'Profil';

  @override
  String get faq => 'Frequently asked questions';

  @override
  String get bccMediaCenter => 'BrunstadTV jest niekomercyjnym domem medialnym tworzącym i rozpowszechniającym treści oparte na pozytywnych i chrześcijańskich wartościach.';

  @override
  String get signInButton => 'Zaloguj się';

  @override
  String get tryAgainButton => 'Spróbuj ponownie';

  @override
  String get loggedOutTitle => 'Wylogowany';

  @override
  String get loggedOutMessage => 'Zostałeś wylogowany, prosimy o ponowne zalogowanie.';

  @override
  String get mostWatched => 'Najpopularniejsze';

  @override
  String get mostRecent => 'Ostatnio dodane';

  @override
  String get latelyPublished => 'Ostatnio opublikowane';

  @override
  String get anErrorOccurred => 'Wystąpił błąd';

  @override
  String get ok => 'OK';

  @override
  String get loginFailedCheckNetwork => 'Logowanie nie powiodło się. Sprawdź połączenie z Internetem i spróbuj ponownie.';

  @override
  String get loginFailedTryAgain => 'Logowanie nie powiodło się. Spróbuj ponownie później.';

  @override
  String get soundLanguage => 'Język video';

  @override
  String get subtitleLanguage => 'Jezyk napisów';

  @override
  String get appLanguage => 'Język aplikacji';

  @override
  String get checkNetwork => 'Sprawdź połączenie z Internetem i spróbuj ponownie.';

  @override
  String get tryAgain => 'Spróbuj ponownie później.';

  @override
  String get cantPlayVideo => 'Nie możemy teraz odtworzyć tego video.';

  @override
  String get about => 'O aplikacji';

  @override
  String get version => 'Wersja';

  @override
  String get contactSupport => 'Zgłoś problem';

  @override
  String get cancel => 'Anuluj';

  @override
  String get upNext => 'Następne';

  @override
  String get done => 'Gotowe';

  @override
  String get playerSettings => 'Ustawienia odtwarzania';

  @override
  String get settings => 'Ustawienia';

  @override
  String get none => 'Bez napisów';

  @override
  String get auto => 'Auto';

  @override
  String get live => 'Na żywo';

  @override
  String get subtitles => 'Napisy';

  @override
  String get audio => 'Dźwięk';

  @override
  String get quality => 'Jakość';

  @override
  String get seasons => 'Sezony';

  @override
  String get episodes => 'Odcinki';

  @override
  String get search => 'Szukaj';

  @override
  String get noResults => 'Brak wyników';

  @override
  String get doYouWantCast => 'Czy odtworzyć na Chromecast?';

  @override
  String get play => 'Odtwarzaj';

  @override
  String get castQueue => 'Chromecast';

  @override
  String get options => 'Opcje';

  @override
  String get remove => 'Usuń';

  @override
  String get queueLimitTitle => 'Limit';

  @override
  String queueLimitMessage(int elementCount) {

    return 'Nie możesz mieć więcej niż $elementCount elementów na liście.';
  }

  @override
  String get recentSearches => 'Ostatnie wyszukiwania';

  @override
  String get tVLogin => 'Logowanie na telewizorze';

  @override
  String get tVLoginSuccessful => 'Logowanie przebiegło pomyślnie. Potwierdź logowanie na telewizorze.';

  @override
  String get seeMore => 'Więcej';

  @override
  String get seeAll => 'Wszystkie';

  @override
  String get series => 'Serial';

  @override
  String get livestreamMaintenance => 'Przepraszamy, transmisja na żywo jest zawieszona z powodu prac konserwacyjnych. Spróbuj ponownie później.';

  @override
  String get homeTab => 'Odkrywaj';

  @override
  String get sortBy => 'Sortowanie';

  @override
  String get videoQuality => 'Jakość video';

  @override
  String get low => 'Niska';

  @override
  String get medium => 'Przeciętna';

  @override
  String get high => 'Wysoka';

  @override
  String get emptySearch => 'Wyszukuj treści w BrunstadTV. Seriale, filmy i odcinki.';

  @override
  String get back => 'Wstecz';

  @override
  String get seasonLetter => 'S';

  @override
  String get episodeLetter => 'E';

  @override
  String get atoZ => 'A-Z';

  @override
  String get ztoA => 'Z-A';

  @override
  String get shortFilms => 'Krótkie filmy';

  @override
  String get videos => 'Video';

  @override
  String get moreInfo => 'Więcej informacji';

  @override
  String get info => 'Informacje';

  @override
  String get episode => 'Odcinek';

  @override
  String get takePhoto => 'Zrób zdjęcie';

  @override
  String get pickPhoto => 'Wybierz z galerii';

  @override
  String get uploadFileTitle => 'Wyślij plik';

  @override
  String get uploadFileMessage => 'Czy chcesz wysłać ten plik?';

  @override
  String watchingWith(int numPeople) {

    return 'Oglądasz z $numPeople innymi osobami';
  }

  @override
  String get uploading => 'Wysyłanie';

  @override
  String get uploadFail => 'Wysyłanie nie powiodło się';

  @override
  String get post => 'Wyślij';

  @override
  String charactersLimit(int charsLeft, int charsTotal) {

    return 'Pozostało $charsLeft z $charsTotal znaków';
  }

  @override
  String get uploadingPostSuccess => 'Twój post został wysłany.';

  @override
  String get testimonyInfo => 'Nagraj video telefonem.';

  @override
  String get yourVideo => 'Twój film';

  @override
  String get record => 'Nagraj';

  @override
  String get recordingTips => 'Kilka wskazówek jak nagrać dobre video';

  @override
  String get recordingTipA => 'Znajdź ciche miejsce.';

  @override
  String get recordingTipB => 'Upewnij się że Twoja twarz jest równomiernie oświetlona.';

  @override
  String get recordingTipC => 'Przed nagraniem pomyśl o tym co chcesz powiedzieć.';

  @override
  String get recordingTipD => 'Obróć telefon do trypu horyzontalnego.';

  @override
  String get thankYou => 'Dziękujemy!';

  @override
  String get thankYouForContribution => 'Dziękujemy za Twój wkład!';

  @override
  String get uploadingVideoSuccess => 'Twój film został wysłany.';

  @override
  String get next => 'Następne';

  @override
  String get recordVideoCameraPermissionAlert => 'Musisz nadać uprawnia do aparatu w ustawieniach żeby móc nagrywać video.';

  @override
  String get recordVideoPhotosPermissionAlert => 'Musisz nadać uprawnia do albumu zdjęć w ustawieniach żeby móc nagrywać video.';

  @override
  String get recordVideoStoragePermissionAlert => 'Musisz nadać uprawnia do pamięci wewnętrznej w ustawieniach żeby móc nagrywać video.';

  @override
  String get recordVideoMicrophonePermissionAlert => 'Musisz nadać uprawnia do mikrofonu w ustawieniach żeby móc nagrywać video.';

  @override
  String get takePhotoStoragePermissionAlert => 'Musisz nadać uprawnia do pamięci wewnętrznej w ustawieniach żeby móc robić zdjęcia.';

  @override
  String get takePhotoCameraPermissionAlert => 'Musisz nadać uprawnia do aparatu w ustawieniach żeby móc robić zdjęcia.';

  @override
  String get pickPhotoStoragePermissionAlert => 'Musisz nadać uprawnia do pamięci wewnętrznej w ustawieniach żeby móc wybierać zdjęcia.';

  @override
  String get permissionsAlertTitle => 'Wymagane uprawnienia';

  @override
  String get add => 'Dodaj';

  @override
  String get change => 'Zmień';

  @override
  String get recordingFailedTitle => 'Nie udało się nagrać filmu';

  @override
  String get recordingFailedMessage => 'Coś poszło nie tak przy próbie nagrywania filmu.';

  @override
  String get pollSubtitle => 'Ankieta';

  @override
  String get writeHere => 'Pisz tutaj';

  @override
  String get feed => 'Wpisy';

  @override
  String get atmosphereFeedDescription => 'Dodaj wpis wysyłając wiadomość, świadectwo albo zdjęcie z miejsca w którym się znajdujesz.';

  @override
  String get information => 'Informacje';

  @override
  String get photoNotSupported => 'Wybieranie i robienie zdjęć nie jest wspierane na Twoim urządzeniu.';

  @override
  String get answerFailed => 'Niestety nie byliśmy w stanie wysłać odpowiedzi. Spróbuj ponownie później.';

  @override
  String get question => 'Pytanie';

  @override
  String get notificationChannelPlayerName => 'Odtwarzacz';

  @override
  String get now => 'Teraz';

  @override
  String get createPost => 'Napisz post';

  @override
  String get concernTextPlaceholder => 'Opisz problem';

  @override
  String get debugInfoExplanation => 'Ta informacja jest nam potrzebna, byśmy mogli lepiej zrozumieć problem.';

  @override
  String get send => 'Wyślij';

  @override
  String get sending => 'Wysyłam';

  @override
  String get thankYouSupportTitle => 'Dziękujemy za informację!';

  @override
  String get thankYouSupportDescription => 'Doceniamy wszelkie informacje zwrotne i odniesiemy się do tego problemu tak szybko, jak to możliwe.';

  @override
  String get sendFail => 'Nie udało się wysłać wiadomości';

  @override
  String get sendFailDescription => 'Coś poszło nie tak. Sprawdź swoje połączenie internetowe i spróbuj jeszcze raz.';

  @override
  String get today => 'Dzisiaj';

  @override
  String get noNewPosts => 'Brak nowych wpisów';

  @override
  String newPostsMultiple(int postCount) {

    return '$postCount nowych postów!';
  }

  @override
  String newPostsSingle(int postCount) {

    return '$postCount nowy post!';
  }

  @override
  String get expired => 'Wygasły';

  @override
  String availableFrom(String date) {

    return 'Dostępne $date';
  }

  @override
  String get howFar => 'Jaką odległość przebyłeś?';

  @override
  String get submit => 'Wyślij';

  @override
  String get wellDone => 'Dobra robota!';

  @override
  String wellDoneDistance(int distanceInKM) {

    return 'Dobra robota! Zarejestrowałeś w sumie przebycie $distanceInKM km';
  }

  @override
  String get distanceRegistered => 'Przebyty przez ciebie dystans został zapisany. Przejdź niżej, jeśli chcesz dodać kolejny przebyty dystans.';

  @override
  String ranMore(int distanceInKM) {

    return 'Przebyłem więcej niż $distanceInKM km';
  }

  @override
  String moreThan(int distanceInKM) {

    return 'Ponad $distanceInKM km';
  }

  @override
  String get runningEffort => 'Znakomicie! Wpisz ilość przebytych kilometrów poniżej.';

  @override
  String get slideSelect => 'Przesuń, by określić przebyty dystans';

  @override
  String get submitAnotherDistance => 'Dodaj kolejny dystans';

  @override
  String get editPicture => 'Edytuj zdjęcie';

  @override
  String get profilePicture => 'Zdjęcie profilowe';

  @override
  String get firstPostTitle => 'Prześlij zdjęcie lub wiadomość jako pierwszy/a';

  @override
  String timezoneInformation(String timeZone) {

    return 'Czasy w programie TV są przedstawione w twojej strefie czasowej: $timeZone';
  }

  @override
  String get yourQuestion => 'Twoje pytanie';

  @override
  String get uploadingInquirySuccess => 'Nie wszystkie zadane pytania zostaną poruszone podczas transmisji.';

  @override
  String get askQuestion => 'Zadaj pytanie';

  @override
  String get submitQuestionInfo => 'Przez wysłanie pytania zgadzasz się na użycie go podczas transmisji.';

  @override
  String get posting => 'Wysyłanie';

  @override
  String get submitPostInfo => 'Wysyłając wiadomość lub zdjęcie, zgadzasz się na użycie jej lub go podczas transmisji.';

  @override
  String get cropImage => 'Przytnij zdjęcie';

  @override
  String get square => 'Kwadrat';

  @override
  String get landscape => 'Horyzontalnie';

  @override
  String get pollSingleChoice => 'Możesz wybrać odpowiedź tylko raz.';

  @override
  String get pollMultipleChoice => 'Możesz zmienić odpowiedź wiele razy.';

  @override
  String get pollEnded => 'Część z ankietami dobiegła końca. Dziękujemy za twoje odpowiedzi.';

  @override
  String get browserInstall => 'Zainstaluj przeglądarkę, aby móc otworzyć ten URL.';

  @override
  String get share => 'Udostępnij';

  @override
  String get liveNow => 'Teraz na żywo';

  @override
  String get program => 'Program';

  @override
  String get participateTab => 'Uczestnicz';

  @override
  String get tomorrow => 'Jutro';

  @override
  String get readBy => 'Lektor';

  @override
  String pollAnswer(String answer) {

    return 'Odpowiedziałeś: $answer';
  }

  @override
  String get broadcasts => 'Transmisje';

  @override
  String get quizAnswered => 'Odpowiedzi wprowadzone';

  @override
  String get quizNotEnabled => 'Quiz nie jest dostępny. Spróbuj ponownie później.';

  @override
  String get calendar => 'Kalendarz';

  @override
  String get noEvents => 'Brak zaplanowanych transmisji';

  @override
  String get appUpdateTitle => 'Wymagana aktualizacja';

  @override
  String get appUpdateRequest => 'Zainstaluj najnowszą wersję aplikacji by korzystać z najnowszych funkcjonalności i poprawek.';

  @override
  String get appUpdateAccepted => 'Uaktualnij';

  @override
  String get donationNotAvailable => 'Wpłaty nie są teraz dostępne. Spróbuj ponownie później.';

  @override
  String posts(int postsCount) {

    return '$postsCount Wpisów';
  }

  @override
  String get copy => 'Kopiuj';

  @override
  String get reload => 'Przeładuj';

  @override
  String get participantsTitle => 'Kto odpowiada?';

  @override
  String get participantsSubtitle => 'Wybierz jednego lub więcej uczestników.';

  @override
  String get yourFamily => 'Twoja rodzina';

  @override
  String get yourTurn => 'Twoja kolej';

  @override
  String get fAQ => 'FAQ';

  @override
  String get shareStart => 'Udostępnij od początku';

  @override
  String shareTime(String time) {

    return 'Udostępnij od $time';
  }

  @override
  String get loadContentError => 'Nie udało się załadować treści';

  @override
  String get audioOnlyErrorDescription => 'Sprawdź połączenie internetowe i spróbuj ponownie';

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get tokenError => 'Nie mogliśmy potwierdzić Twojej tożsamości, najprawdopodobniej przez problem z Internetem. Niektóre funkcjonalności mogą nie działać prawidłowo.';

  @override
  String get categoriesTab => 'Kategorie';

  @override
  String get settingsTab => 'Ustawienia';

  @override
  String get confirmLogin => 'Potwierdź logowanie';

  @override
  String get scanInfo => 'Zeskanuj kod przy użyciu telefonu aby przejść do strony logowania.';

  @override
  String get validInfo => 'Kod QR jest ważny przez 15 minut.';

  @override
  String get confirmInfo => 'Po udanym logowaniu na Twoim urządzeniu kliknij przycisk poniżej aby potwierdzić logowanie.';

  @override
  String get seriesTab => 'Serial';

  @override
  String get filmsTab => 'Filmy';

  @override
  String get eventsTab => 'Eventy';

  @override
  String get audioLanguage => 'Język dźwięku';

  @override
  String get subtitlesLanguage => 'Jezyk napisów';

  @override
  String get removeFromRecentSearches => 'Czy chcesz usunąć ten element z ostatnio wyszukanych?';

  @override
  String get noTransmissionToday => 'Brak zaplanowanych transmisji na dzisiaj';

  @override
  String get livestreamMaintenanceTitle => 'Transmisja na żywo nie jest prowadzona';

  @override
  String get start => 'Start';

  @override
  String get transmissionSchedule => 'Program transmisji';

  @override
  String get featured => 'Polecane';

  @override
  String get errorTryAgain => 'Coś się nie udało, proszę spróbuj ponownie później.';

  @override
  String get reportProblem => 'W razie problemów użyj poniższego kodu QR aby wysłać zgłoszenie.';

  @override
  String get phoneReadingProblem => 'Jeśli Twój telefon nie może przeczytać kodu QR wyślij nam email zawierając poniższe dane na adres';

  @override
  String get goTo => 'lub wejdź na';

  @override
  String get watchBrunstad => 'Oglądaj BrunstadTV na żywo';

  @override
  String get notLogged => 'Nie udało się zalogować';

  @override
  String get authResponse0 => 'Użyj nowego kodu QR aby się zalogować.';

  @override
  String get authResponse1 => 'Zaloguj się na urządzeniu mobilnym korzystając z kodu QR.';

  @override
  String get authResponse3 => 'Sprawdź połączenie z Internetem i spróbuj ponownie.';

  @override
  String get liveHeader => 'Na żywo';

  @override
  String get recentlyPublishedSection => 'Ostatnio opublikowane';

  @override
  String get exploreCategoriesSection => 'Odkrywaj kategorie';

  @override
  String get programsSection => 'Programy';

  @override
  String get episodesSection => 'Odcinki';

  @override
  String get categorySeries => 'Serial';

  @override
  String get categoryKids => 'Dzieci';

  @override
  String get categoryFilms => 'Filmy';

  @override
  String get categoryEvents => 'Eventy';

  @override
  String get categoryMusic => 'Muzyka';

  @override
  String get noPlannedEvents => 'Brak zaplanowanych eventów na dzisiaj';

  @override
  String get watchNow => 'Oglądaj teraz';
}
