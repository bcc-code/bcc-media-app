import 'app_localizations.dart';

/// The translations for Slovenian (`sl`).
class SSl extends S {
  SSl([String locale = 'sl']) : super(locale);

  @override
  String get loadingContent => 'Nalagam vsebino';

  @override
  String get signInTooltip => 'Za ogled ostalih vsebin se prijavi';

  @override
  String get skipToPublicContent => 'Nadaljuj z ogledom javno dostopne vsebine';

  @override
  String get minutesShort => 'min';

  @override
  String get calendarThisWeek => 'Ta teden';

  @override
  String get calendarWeek => 'teden';

  @override
  String get loading => 'Nalaganje';

  @override
  String get loginPageDisplay1 => 'Najmočnejše \nsporočilo na svetu';

  @override
  String get loginPageDisplay2 =>
      'Oglej si serije in filme, narejene na podlagi krščanskih vrednot';

  @override
  String get loginPageDisplay3 => 'Produkcija: BCC Media';

  @override
  String get liveTab => 'V živo';

  @override
  String get logOutButton => 'Odjava';

  @override
  String get profileTab => 'Profil';

  @override
  String get faq => 'Pogosta vprašanja';

  @override
  String get bccMediaCenter =>
      'BrunstadTV je nekomercialen medijski center, ki proizvaja in razširja vsebino, ki temelji na pozitivnih krščanskih vrednotah.';

  @override
  String get signInButton => 'Vpis';

  @override
  String get tryAgainButton => 'Poskusite znova';

  @override
  String get loggedOutTitle => 'Odjavljen';

  @override
  String get loggedOutMessage =>
      'Odjavili ste se. Prosim, ponovno se prijavite.';

  @override
  String get mostWatched => 'Najbolj gledano';

  @override
  String get mostRecent => 'Najnovejše';

  @override
  String get latelyPublished => 'Nedavno objavljeno';

  @override
  String get anErrorOccurred => 'Prišlo je do napake';

  @override
  String get ok => 'OK';

  @override
  String get loginFailedCheckNetwork =>
      'Napaka pri prijavi. Preverite internetno povezavo in poskusite znova.';

  @override
  String get loginFailedTryAgain =>
      'Napaka pri prijavi. Prosim, poskusite znova kasneje.';

  @override
  String get soundLanguage => 'Jezik zvoka';

  @override
  String get subtitleLanguage => 'Jezik podnapisov';

  @override
  String get appLanguage => 'Jezik aplikacije';

  @override
  String get checkNetwork =>
      'Preverite svojo internetno povezavo in poskusite znova.';

  @override
  String get tryAgain => 'Prosim, poskusite znova kasneje.';

  @override
  String get cantPlayVideo => 'Ta videoposnetek trenutno ni na voljo.';

  @override
  String get about => 'O aplikaciji';

  @override
  String get version => 'Verzija';

  @override
  String get contactSupport => 'Podpora';

  @override
  String get cancel => 'Prekliči';

  @override
  String get upNext => 'Sledi';

  @override
  String get done => 'Končano';

  @override
  String get playerSettings => 'Nastavitve predvajalnika';

  @override
  String get settings => 'Nastavitve';

  @override
  String get none => 'Noben';

  @override
  String get auto => 'Samodejno';

  @override
  String get live => 'V živo';

  @override
  String get subtitles => 'Podnapisi';

  @override
  String get audio => 'Zvok';

  @override
  String get quality => 'Kakovost';

  @override
  String get seasons => 'Sezone';

  @override
  String get episodes => 'Deli';

  @override
  String get search => 'Išči';

  @override
  String get noResults => 'Ni najdenih rezultatov';

  @override
  String get doYouWantCast => 'Ali hočete predvajati ta video?';

  @override
  String get play => 'Predvajaj';

  @override
  String get castQueue => 'Predvajaj čakalno vrsto';

  @override
  String get options => 'Možnosti';

  @override
  String get remove => 'Odstrani';

  @override
  String get queueLimitTitle => 'Limit';

  @override
  String queueLimitMessage(int elementCount) {
    return 'V čakalni vrsti ne more biti več kot $elementCount elementov.';
  }

  @override
  String get recentSearches => 'Nedavna iskanja';

  @override
  String get tVLogin => 'TV prijava';

  @override
  String get tVLoginSuccessful =>
      'Prijava je bila uspešna, prosim potrdite jo na TV.';

  @override
  String get seeMore => 'Več';

  @override
  String get seeAll => 'Poglej vse';

  @override
  String get series => 'Serije';

  @override
  String get livestreamMaintenance =>
      'Zaradi vzdrževalnih del neposredni prenos trenutno ni na voljo. Prosimo, poskusite ponovno kasneje.';

  @override
  String get homeTab => 'Domov';

  @override
  String get sortBy => 'Razvrsti';

  @override
  String get videoQuality => 'Kakovost videoposnetka';

  @override
  String get low => 'Nizka';

  @override
  String get medium => 'Srednja';

  @override
  String get high => 'Visoka';

  @override
  String get emptySearch =>
      'Iščete lahko po vsej vsebini od BrunstadTV. Serije, filmi in deli.';

  @override
  String get back => 'Nazaj';

  @override
  String get seasonLetter => 'S';

  @override
  String get episodeLetter => 'E';

  @override
  String get atoZ => 'A-Z';

  @override
  String get ztoA => 'Z-A';

  @override
  String get shortFilms => 'Kratki filmi';

  @override
  String get videos => 'Videoposnetki';

  @override
  String get moreInfo => 'Več informacij';

  @override
  String get info => 'Informacije';

  @override
  String get episode => 'Del';

  @override
  String get takePhoto => 'Slikaj';

  @override
  String get pickPhoto => 'Izberi iz galerije';

  @override
  String get uploadFileTitle => 'Naloži datoteko';

  @override
  String get uploadFileMessage => 'Ali hočete naložiti to datoteko?';

  @override
  String watchingWith(int numPeople) {
    return 'Gledaš še z $numPeople osebami';
  }

  @override
  String get uploading => 'Nalaganje';

  @override
  String get uploadFail => 'Nalaganje ni uspelo';

  @override
  String get post => 'Objavi';

  @override
  String charactersLimit(int charsLeft, int charsTotal) {
    return '$charsLeft od $charsTotal znakov';
  }

  @override
  String get uploadingPostSuccess => 'Tvoja objava je bila poslana.';

  @override
  String get testimonyInfo => 'Posnemi video s svojim telefonom.';

  @override
  String get yourVideo => 'Tvoj video';

  @override
  String get record => 'Posnemi';

  @override
  String get recordingTips => 'Nekaj namigov za dober posnetek';

  @override
  String get recordingTipA => 'Poišči miren prostor za snemanje.';

  @override
  String get recordingTipB => 'Poskrbi, da je tvoj obraz enakomerno osvetljen.';

  @override
  String get recordingTipC =>
      'Pomisli kaj hočeš povedati, preden začneš snemati.';

  @override
  String get recordingTipD => 'Postavi telefon v ležeči način.';

  @override
  String get thankYou => 'Hvala!';

  @override
  String get thankYouForContribution => 'Hvala za tvoj prispevek!';

  @override
  String get uploadingVideoSuccess => 'Tvoj video je bil poslan.';

  @override
  String get next => 'Sledi';

  @override
  String get recordVideoCameraPermissionAlert =>
      'V nastavitvah je potrebno omogočiti dovoljenje kamere za snemanje videoposnetka.';

  @override
  String get recordVideoPhotosPermissionAlert =>
      'V nastavitvah je potrebno omogočiti dovoljenje galerije za snemanje videoposnetka.';

  @override
  String get recordVideoStoragePermissionAlert =>
      'V nastavitvah je potrebno omogočiti dovoljenje shrambe za snemanje videoposnetka.';

  @override
  String get recordVideoMicrophonePermissionAlert =>
      'V nastavitvah je potrebno omogočiti dovoljenje mikrofona za snemanje videoposnetka.';

  @override
  String get takePhotoStoragePermissionAlert =>
      'V nastavitvah je potrebno omogočiti dovoljenje shrambe za zajem fotografije.';

  @override
  String get takePhotoCameraPermissionAlert =>
      'V nastavitvah je potrebno omogočiti dovoljenje kamere za zajem fotografije.';

  @override
  String get pickPhotoStoragePermissionAlert =>
      'V nastavitvah je potrebno omogočiti dovoljenje shrambe za izbiro fotografij.';

  @override
  String get permissionsAlertTitle => 'Potrebna so dovoljenja';

  @override
  String get add => 'Dodaj';

  @override
  String get change => 'Spremeni';

  @override
  String get recordingFailedTitle => 'Videposnetka ni bilo mogoče posneti';

  @override
  String get recordingFailedMessage =>
      'Prišlo je do napake pri snemanju videoposnetka.';

  @override
  String get pollSubtitle => 'Anketa';

  @override
  String get writeHere => 'Napiši tukaj';

  @override
  String get feed => 'Prispevki';

  @override
  String get atmosphereFeedDescription =>
      'Sodeluj pri prispevkih, tako da pošlješ sporočilo, pričevanje ali sliko od tam, kjer si.';

  @override
  String get information => 'Informacije';

  @override
  String get photoNotSupported =>
      'Zajem in izbira fotografij nista podprta na tvojem telefonu.';

  @override
  String get answerFailed =>
      'Se opravičujemo! Odgovora ni bilo mogoče poslati. Prosim, poskusi znova.';

  @override
  String get question => 'Vprašanje';

  @override
  String get notificationChannelPlayerName => 'Predvajalnik';

  @override
  String get now => 'Zdaj';

  @override
  String get createPost => 'Ustvari objavo';

  @override
  String get concernTextPlaceholder => 'Opiši težavo';

  @override
  String get debugInfoExplanation =>
      'Tvoje sporočilo bo vsebovalo to informacijo. To nam bo pomagalo, da bomo bolje razumeli težavo.';

  @override
  String get send => 'Pošlji';

  @override
  String get sending => 'Pošiljam';

  @override
  String get thankYouSupportTitle => 'Hvala za povratno sporočilo!';

  @override
  String get thankYouSupportDescription =>
      'Cenimo vsa povratna sporočila in težave bomo rešili v najkrajšem možnem času.';

  @override
  String get sendFail => 'Sporočila ni bilo mogoče poslati';

  @override
  String get sendFailDescription =>
      'Nekaj je šlo narobe. Preveri svojo internetno povezavo in poskusi znova.';

  @override
  String get today => 'Danes';

  @override
  String get noNewPosts => 'Ni novih objav';

  @override
  String newPostsMultiple(int postCount) {
    return '$postCount novih objav!';
  }

  @override
  String newPostsSingle(int postCount) {
    return '$postCount novih objav!';
  }

  @override
  String get expired => 'Preteklo';

  @override
  String availableFrom(String date) {
    return 'Na voljo $date';
  }

  @override
  String get howFar => 'Kako daleč si šel?';

  @override
  String get submit => 'Oddaj';

  @override
  String get wellDone => 'Bravo!';

  @override
  String wellDoneDistance(int distanceInKM) {
    return 'Bravo! Registriral si razdaljo $distanceInKM km';
  }

  @override
  String get distanceRegistered =>
      'Tvoja razdalja je bila registrirana. Nadaljuj spodaj, če hočeš oddati drugo razdaljo.';

  @override
  String ranMore(int distanceInKM) {
    return 'Pretekel sem več kot $distanceInKM km';
  }

  @override
  String moreThan(int distanceInKM) {
    return 'Več kot $distanceInKM km';
  }

  @override
  String get runningEffort =>
      'Izjemen dosežek! Spodaj vpiši število kilometrov, ki si jih dosegel.';

  @override
  String get slideSelect => 'Podrsaj, da izbereš razdaljo';

  @override
  String get submitAnotherDistance => 'Oddaj drugo razdaljo';

  @override
  String get editPicture => 'Uredi sliko';

  @override
  String get profilePicture => 'Profilna slika';

  @override
  String get firstPostTitle => 'Bodi prvi, ki objavi sliko ali sporočilo';

  @override
  String timezoneInformation(String timeZone) {
    return 'Tv spored je v tvojem lokalnem času: $timeZone';
  }

  @override
  String get yourQuestion => 'Tvoje vprašanje';

  @override
  String get uploadingInquirySuccess =>
      'Na vsa poslana vprašanja bomo odgovorili v prenosu.';

  @override
  String get askQuestion => 'Postavi vprašanje';

  @override
  String get submitQuestionInfo =>
      'S poslanim vprašanjem se strinjaš, da se vprašanje lahko uporabi za potrebe prenosov.';

  @override
  String get posting => 'Objavljanje';

  @override
  String get submitPostInfo =>
      'S poslanim sporočilom ali sliko se strinjaš, da se to uporabi za potrebe prenosov. ';

  @override
  String get cropImage => 'Obreži sliko';

  @override
  String get square => 'Kvadrat';

  @override
  String get landscape => 'Ležeče';

  @override
  String get pollSingleChoice => 'Svoj odgovor lahko izbereš le enkrat.';

  @override
  String get pollMultipleChoice => 'Svoj odgovor lahko večkrat spremeniš.';

  @override
  String get pollEnded => 'Anketa se je končala. Hvala za tvoje odgovore.';

  @override
  String get browserInstall =>
      'Prosim naloži brskalnik, da lahko odpreš ta URL.';

  @override
  String get share => 'Deli';

  @override
  String get liveNow => 'V živo';

  @override
  String get program => 'Program';

  @override
  String get participateTab => 'Sodeluj';

  @override
  String get tomorrow => 'Jutri';

  @override
  String get readBy => 'Prebral';

  @override
  String pollAnswer(String answer) {
    return 'Ti si odgovoril/a $answer';
  }

  @override
  String get broadcasts => 'Oddaje';

  @override
  String get quizAnswered => 'Odgovor je poslan';

  @override
  String get quizNotEnabled =>
      'Trenutno kviz ni na voljo. Prosim poskusi znova kasneje.';

  @override
  String get calendar => 'Koledar';

  @override
  String get noEvents => 'Ni načrtovanih prenosov';

  @override
  String get appUpdateTitle => 'Potrebna posodobitev';

  @override
  String get appUpdateRequest =>
      'Prosim prenesi zadnjo verzijo aplikacije, da dobiš najnovejše dodatke in izboljšave.';

  @override
  String get appUpdateAccepted => 'Posodobitev';

  @override
  String get donationNotAvailable =>
      'Donacija trenutno ni na voljo. Prosim poskusi znova kasneje.';

  @override
  String posts(int postsCount) {
    return '$postsCount objav';
  }

  @override
  String get copy => 'Kopiraj';

  @override
  String get reload => 'Ponovno naloži';

  @override
  String get participantsTitle => 'Kdo odgovarja?';

  @override
  String get participantsSubtitle => 'Izberi enega ali več sodelujočih.';

  @override
  String get yourFamily => 'Tvoja družina';

  @override
  String get yourTurn => 'Ti si na vrsti';

  @override
  String get fAQ => 'FAQ';

  @override
  String get shareStart => 'Deli od začetka';

  @override
  String shareTime(String time) {
    return 'Deli od $time';
  }

  @override
  String get loadContentError => 'Nalaganje vsebine ni uspelo';

  @override
  String get audioOnlyErrorDescription =>
      'Preveri internetno povezavo in poskusi znova';

  @override
  String get privacyPolicy => 'Pravilnik o zasebnosti';

  @override
  String get tokenError =>
      'Ne moremo potrditi tvoje identitete, verjetno zaradi internetnih težav. Nekatere funkcije aplikacije mogoče ne bodo delovale pravilno.';

  @override
  String get categoriesTab => 'Kategorije';

  @override
  String get settingsTab => 'Nastavitve';

  @override
  String get confirmLogin => 'Potrdi prijavo';

  @override
  String get scanInfo =>
      'Za vstop do strani s prijavo, skenirajte kodo s svojim telefonom.';

  @override
  String get validInfo => 'QR-koda je veljavna 15 minut.';

  @override
  String get confirmInfo =>
      'Po uspešni prijavi na svoji napravi pritisnite na spodnji gumb za potrditev prijave.';

  @override
  String get seriesTab => 'Serije';

  @override
  String get filmsTab => 'Filmi';

  @override
  String get eventsTab => 'Dogodki';

  @override
  String get audioLanguage => 'Jezik zvoka';

  @override
  String get subtitlesLanguage => 'Jezik podnapisov';

  @override
  String get removeFromRecentSearches =>
      'Ali želite odstraniti ta element iz nedavnih iskanj?';

  @override
  String get noTransmissionToday => 'Danes ni načrtovanih prenosov';

  @override
  String get livestreamMaintenanceTitle => 'Neposredni prenos ni na voljo';

  @override
  String get start => 'Začetek';

  @override
  String get transmissionSchedule => 'Spored prenosa';

  @override
  String get featured => 'Priporočamo';

  @override
  String get errorTryAgain => 'Prišlo je do napake, prosim poskusi znova.';

  @override
  String get reportProblem =>
      'V primeru težav uporabite spodnjo QR-kodo in pošljite mail.';

  @override
  String get phoneReadingProblem =>
      'Če telefon ne podpira branja QR-kode, pošljite mail s sledečimi informacijami na';

  @override
  String get goTo => 'ali pojdi na';

  @override
  String get watchBrunstad => 'Glej BrunstadTV v živo';

  @override
  String get notLogged => 'Nisi prijavljen';

  @override
  String get authResponse0 => 'Za prijavo uporabite novo QR-kodo.';

  @override
  String get authResponse1 =>
      'Prosim, prijavite se na mobilni napravi z uporabo QR-kode.';

  @override
  String get authResponse3 =>
      'Preverite svojo internetno povezavo in poskusite ponovno kasneje.';

  @override
  String get liveHeader => 'V živo';

  @override
  String get recentlyPublishedSection => 'Nedavno objavljeno';

  @override
  String get exploreCategoriesSection => 'Raziskuj kategorije';

  @override
  String get programsSection => 'Programi';

  @override
  String get episodesSection => 'Deli';

  @override
  String get categorySeries => 'Serije';

  @override
  String get categoryKids => 'Otroci';

  @override
  String get categoryFilms => 'Filmi';

  @override
  String get categoryEvents => 'Dogodki';

  @override
  String get categoryMusic => 'Glasba';

  @override
  String get noPlannedEvents => 'Za ta dan ni načrtovanih dogodkov';

  @override
  String get watchNow => 'Glej zdaj';

  @override
  String get exploreContent => 'Razišči vsebino';
}
