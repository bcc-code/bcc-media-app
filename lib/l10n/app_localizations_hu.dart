import 'app_localizations.dart';

/// The translations for Hungarian (`hu`).
class SHu extends S {
  SHu([String locale = 'hu']) : super(locale);

  @override
  String get loadingContent => 'Tartalom betöltése';

  @override
  String get signInTooltip => 'További tartalmak megtekintéséhez jelentkezzél be';

  @override
  String get skipToPublicContent => 'Ugrás a nyilvános tartalom megtekintéséhez';

  @override
  String get minutesShort => 'perc';

  @override
  String get calendarThisWeek => 'Ez a hét';

  @override
  String get calendarWeek => 'hét';

  @override
  String get loading => 'Betöltés';

  @override
  String get loginPageDisplay1 => 'A világ \nlegerősebb üzenete';

  @override
  String get loginPageDisplay2 => 'Keresztény értékeken alapuló sorozatok, műsorok és filmek megtekintése';

  @override
  String get loginPageDisplay3 => 'Készítette a BCC Media';

  @override
  String get liveTab => 'Élő';

  @override
  String get logOutButton => 'Kijelentkezés';

  @override
  String get profileTab => 'Profil';

  @override
  String get faq => 'Gyakran ismételt kérdések';

  @override
  String get bccMediaCenter => 'A BCC Media a BCC szövetség médiaalapítványa, amely pozitív és keresztény értékeket tartalmazó tartalmakat gyárt és terjeszt.';

  @override
  String get signInButton => 'Bejelentkezés';

  @override
  String get tryAgainButton => 'Próbálj újra';

  @override
  String get loggedOutTitle => 'Kijelentkezve';

  @override
  String get loggedOutMessage => 'Ki lettél jelentkezve. Jelentkezz újból be.';

  @override
  String get mostWatched => 'Legnézetebb';

  @override
  String get mostRecent => 'Legfrissebb';

  @override
  String get latelyPublished => 'Nemrégiben megjelent';

  @override
  String get anErrorOccurred => 'Hiba történt';

  @override
  String get ok => 'OK';

  @override
  String get loginFailedCheckNetwork => 'Hibás bejelentkezés. Ellenőrizd a hálózati csatlakozásodat és próbálj újra.';

  @override
  String get loginFailedTryAgain => 'Hibás bejelentkezés. Próbálj később újra.';

  @override
  String get soundLanguage => 'Tartalom nyelve';

  @override
  String get subtitleLanguage => 'Felírat nyelve';

  @override
  String get appLanguage => 'Applikáció nyelve';

  @override
  String get checkNetwork => 'Ellenőrizd a hálózati csatlakozásodat és próbálj újra.';

  @override
  String get tryAgain => 'Próbálj később újra.';

  @override
  String get cantPlayVideo => 'Sajnos most nem tudod ezt a videót lejátszani.';

  @override
  String get about => 'Rólunk';

  @override
  String get version => 'Verzió';

  @override
  String get contactSupport => 'Vedd fel a kapcsolatot a supporttal';

  @override
  String get cancel => 'Mégse';

  @override
  String get upNext => 'Következő';

  @override
  String get done => 'Kész';

  @override
  String get playerSettings => 'Lejátszási beállítások';

  @override
  String get settings => 'Beállítások';

  @override
  String get none => 'Nincs';

  @override
  String get auto => 'Autó';

  @override
  String get live => 'Élő';

  @override
  String get subtitles => 'Felíratok';

  @override
  String get audio => 'Audió';

  @override
  String get quality => 'Minőség';

  @override
  String get seasons => 'Sorozat';

  @override
  String get episodes => 'Epizódok';

  @override
  String get search => 'Keresés';

  @override
  String get noResults => 'Nincs eredmény';

  @override
  String get doYouWantCast => 'Szeretnéd ezt a videót Chromecasten keresztül közvetíteni?';

  @override
  String get play => 'Lejátszás';

  @override
  String get castQueue => 'Lejátszási listát közvetíteni';

  @override
  String get options => 'Opciók';

  @override
  String get remove => 'Eltávolítás';

  @override
  String get queueLimitTitle => 'Korlátozott';

  @override
  String queueLimitMessage(int elementCount) {
    return 'A várólistában nem lehet több, mint $elementCount elem.';
  }

  @override
  String get recentSearches => 'Legutóbbi keresések';

  @override
  String get tVLogin => 'TV bejelentkezés';

  @override
  String get tVLoginSuccessful => 'Sikeres bejelentkezés. Hagyd jóvá a TV-n.';

  @override
  String get seeMore => 'Mutass többet';

  @override
  String get seeAll => 'Mutass mindent';

  @override
  String get series => 'Sorozatok';

  @override
  String get livestreamMaintenance => 'Sajnáljuk, az élőadás jelenleg karbantartás alatt van. Próbálj később újra.';

  @override
  String get homeTab => 'Főoldal';

  @override
  String get sortBy => 'Rendezés';

  @override
  String get videoQuality => 'Videó minősége';

  @override
  String get low => 'Alacsony';

  @override
  String get medium => 'Közepes';

  @override
  String get high => 'Magas';

  @override
  String get emptySearch => 'A BCC Media összes tartalmában kereshetsz. Sorozatok, videók és epizódok.';

  @override
  String get back => 'Vissza';

  @override
  String get seasonLetter => 'S';

  @override
  String get episodeLetter => 'E';

  @override
  String get atoZ => 'A-Z';

  @override
  String get ztoA => 'Z-A';

  @override
  String get shortFilms => 'Rövid filmek';

  @override
  String get videos => 'Videók';

  @override
  String get moreInfo => 'További információ';

  @override
  String get info => 'Információ';

  @override
  String get episode => 'Epizód';

  @override
  String get takePhoto => 'Készíts képet';

  @override
  String get pickPhoto => 'Kiválasztás a képtárból';

  @override
  String get uploadFileTitle => 'Fájl feltöltése';

  @override
  String get uploadFileMessage => 'Szeretnéd ezt a fájlt feltölteni?';

  @override
  String watchingWith(int numPeople) {
    return 'Még $numPeople személlyel együtt nézed';
  }

  @override
  String get uploading => 'Feltöltés';

  @override
  String get uploadFail => 'Sikertelen feltöltés';

  @override
  String get post => 'Közzé tenni';

  @override
  String charactersLimit(int charsLeft, int charsTotal) {
    return '$charsLeft a $charsTotal karakterből van még hátra';
  }

  @override
  String get uploadingPostSuccess => 'A hozzászólásod be lett küldve.';

  @override
  String get testimonyInfo => 'Telefonoddal vedd fel a videót.';

  @override
  String get yourVideo => 'A videód';

  @override
  String get record => 'Felvétel';

  @override
  String get recordingTips => 'Pár tipp a jó felvételhez';

  @override
  String get recordingTipA => 'A felvételhez keress csendes helyet.';

  @override
  String get recordingTipB => 'Győződjél meg arról, hogy az arcod egyenletesen meg legyen világítva.';

  @override
  String get recordingTipC => 'Mielőtt elindítod a felvételt, gondold át, mit akarsz mondani.';

  @override
  String get recordingTipD => 'Fordítsd a telefonod fekvő módra.';

  @override
  String get thankYou => 'Köszönjük!';

  @override
  String get thankYouForContribution => 'Köszönjük a hozzájárulásodat!';

  @override
  String get uploadingVideoSuccess => 'A videód be lett küldve.';

  @override
  String get next => 'Következő';

  @override
  String get recordVideoCameraPermissionAlert => 'A videó rögzítéséhez engedélyezned kell a kamerát a beállításokban.';

  @override
  String get recordVideoPhotosPermissionAlert => 'A video rögzítéséhez engedélyezned kell a képeidhez való hozzáférést a beállításokban.';

  @override
  String get recordVideoStoragePermissionAlert => 'A videó rögzítéséhez tárolási engedélyt kell megadnod a beállításokban.';

  @override
  String get recordVideoMicrophonePermissionAlert => 'A videó rögzítéséhez engedélyezned kell a mikrofont a beállításokban.';

  @override
  String get takePhotoStoragePermissionAlert => 'A fényképek kiválasztásához a tárolási engedélyt kell megadnod a beállításokban.';

  @override
  String get takePhotoCameraPermissionAlert => 'A fényképezéshez engedélyezned kell a kamerát beállításokban.';

  @override
  String get pickPhotoStoragePermissionAlert => 'A fényképek kiválasztásához a tárolási engedélyt kell megadnod a beállításokban.';

  @override
  String get permissionsAlertTitle => 'Engedély szükséges';

  @override
  String get add => 'Hozzáadás';

  @override
  String get change => 'Módosítás';

  @override
  String get recordingFailedTitle => 'Vídeófelvétel sikertelen';

  @override
  String get recordingFailedMessage => 'Videófelvétel közben valami nem sikerült.';

  @override
  String get pollSubtitle => 'Szavazás';

  @override
  String get writeHere => 'Írjál ide';

  @override
  String get feed => 'Hírcsatorna';

  @override
  String get atmosphereFeedDescription => 'Járj hozzá a hírcsatornához üzenet, bizonyságtétel vagy kép beküldésével, ahonnan éppen tartózkodsz.';

  @override
  String get information => 'Információ';

  @override
  String get photoNotSupported => 'Fényképek készítése és kiválasztása nem támogatott a készülékeden.';

  @override
  String get answerFailed => 'Bocsánat! Képtelenek voltunk válaszolni. Próbáld újra.';

  @override
  String get question => 'Kérdés';

  @override
  String get notificationChannelPlayerName => 'Lejátszó';

  @override
  String get now => 'Most';

  @override
  String get createPost => 'Hozzászólás létrehozása';

  @override
  String get concernTextPlaceholder => 'Írd le a kérdésedet';

  @override
  String get debugInfoExplanation => 'Az üzeneted tartalmazza ezeket az információkat, hogy jobban megértsük a problémát.';

  @override
  String get send => 'Küldés';

  @override
  String get sending => 'Adás';

  @override
  String get thankYouSupportTitle => 'Köszönjük visszajelzésedet!';

  @override
  String get thankYouSupportDescription => 'Nagyra értékeljük az összes visszajelzést, és a lehető leghamarabb megválaszoljuk a kérdést.';

  @override
  String get sendFail => 'Nem sikerült elküldeni az üzenetedet';

  @override
  String get sendFailDescription => 'Valami nem sikerült. Vizsgáld meg az internett kapcsolatodat és próbáld újra.';

  @override
  String get today => 'Ma';

  @override
  String get noNewPosts => 'Nincsenek új hozzászólások';

  @override
  String newPostsMultiple(int postCount) {
    return '$postCount új hozzászólás!';
  }

  @override
  String newPostsSingle(int postCount) {
    return '$postCount új hozzászólás!';
  }

  @override
  String get expired => 'Lejárt';

  @override
  String availableFrom(String date) {
    return 'Elérhető $date';
  }

  @override
  String get howFar => 'Mennyit kirándultál?';

  @override
  String get submit => 'Megerősítés';

  @override
  String get wellDone => 'Jól csináltad!';

  @override
  String wellDoneDistance(int distanceInKM) {
    return 'Szép munka! Összesen $distanceInKM km távolságot teljesítettél';
  }

  @override
  String get distanceRegistered => 'Regisztrálva lett a távolságod. Folytass lent, ha szeretnél további távolságokat megadni.';

  @override
  String ranMore(int distanceInKM) {
    return 'Több mint $distanceInKM kilométert futottam';
  }

  @override
  String moreThan(int distanceInKM) {
    return 'Több mint $distanceInKM km';
  }

  @override
  String get runningEffort => 'Csodálatos erőfeszítés! Írd be az alul megtett kilométerek mennyiségét.';

  @override
  String get slideSelect => 'Válaszd ki a megtett távolságot';

  @override
  String get submitAnotherDistance => 'Más távolság kiválasztása';

  @override
  String get editPicture => 'Kép szerkesztése';

  @override
  String get profilePicture => 'Profilkép';

  @override
  String get firstPostTitle => 'Legyél az első, aki képet vagy üzenetet közzé tesz';

  @override
  String timezoneInformation(String timeZone) {
    return 'A Tv program időpontjai a helyi idő szerint jelenek meg: $timeZone';
  }

  @override
  String get yourQuestion => 'A kérdésed';

  @override
  String get uploadingInquirySuccess => 'Felhívjuk figyelmedet, hogy az adásban nem minden feltett kérdésre adnak választ.';

  @override
  String get askQuestion => 'Tegyél fel kérdést';

  @override
  String get submitQuestionInfo => 'A kérdés beküldésével elfogadod, hogy azt adási célokra lehet felhasználni.';

  @override
  String get posting => 'Közzé tenni';

  @override
  String get submitPostInfo => 'Hozzászólás vagy fotó beküldéseddel elfogadod, hogy azt adási célokra lehet felhasználni. ';

  @override
  String get cropImage => 'Kép kivágása';

  @override
  String get square => 'Négyzet';

  @override
  String get landscape => 'Tájkép';

  @override
  String get pollSingleChoice => 'Csak egyszer választhatod ki a válaszodat.';

  @override
  String get pollMultipleChoice => 'Többször megváltoztathatod a válaszodat.';

  @override
  String get pollEnded => 'A szavazás ideje véget ért. Köszönjük válaszaidat.';

  @override
  String get browserInstall => 'Kérjünk, telepítsd a webböngészőt az URL megnyitásához.';

  @override
  String get share => 'Megosztás';

  @override
  String get liveNow => 'Most élőben';

  @override
  String get program => 'Program';

  @override
  String get participateTab => 'Részvevők';

  @override
  String get tomorrow => 'Holnap';

  @override
  String get readBy => 'Elolvasva';

  @override
  String pollAnswer(String answer) {
    return '$answer válaszoltál';
  }

  @override
  String get broadcasts => 'Broadcasts';

  @override
  String get quizAnswered => 'Benyújtott válaszok';

  @override
  String get quizNotEnabled => 'A kvíz jelenleg nem érhető el. Kérlek, próbáld újra később.';

  @override
  String get calendar => 'Naptár';

  @override
  String get noEvents => 'Nincs tervezett adás';

  @override
  String get appUpdateTitle => 'Frissítés szükséges';

  @override
  String get appUpdateRequest => 'Kérjük, töltsd le a legújabb alkalmazást, hogy élvezhessd a legújabb funkciókat és hibajavításokat.';

  @override
  String get appUpdateAccepted => 'Frissítés';

  @override
  String get donationNotAvailable => 'A Donation jelenleg nem érhető el. Kérlek, próbáld újra később.';

  @override
  String posts(int postsCount) {
    return '$postsCount Hozzászólások';
  }

  @override
  String get copy => 'Másolás';

  @override
  String get reload => 'Újratöltés';

  @override
  String get participantsTitle => 'Ki válaszol?';

  @override
  String get participantsSubtitle => 'Válassz ki egy vagy több résztvevőt.';

  @override
  String get yourFamily => 'A családod';

  @override
  String get yourTurn => 'Te vagy a soron';

  @override
  String get fAQ => 'GYIK';

  @override
  String get shareStart => 'Oszd meg az elejétől';

  @override
  String shareTime(String time) {
    return 'Megosztás innentől $time';
  }

  @override
  String get loadContentError => 'Nem sikerült betölteni a tartalmat';

  @override
  String get audioOnlyErrorDescription => 'Ellenőrizd a hálózati csatlakozásodat és próbálj újra';

  @override
  String get privacyPolicy => 'Adatvédelmi szabályzat';

  @override
  String get tokenError => 'Nem tudtuk megerősíteni a személyazonosságodat, valószínűleg hálózati probléma miatt. Előfordulhat, hogy az alkalmazás egyes funkciói nem működnek megfelelően.';

  @override
  String get categoriesTab => 'Kategóriák';

  @override
  String get settingsTab => 'Beállítások';

  @override
  String get confirmLogin => 'Bejelentkezés jóváhagyása';

  @override
  String get scanInfo => 'Szkenneld be a kódot a telefonoddal és lépjél a jelentkezési oldalra.';

  @override
  String get validInfo => 'A QR kód 15 percig érvényes.';

  @override
  String get confirmInfo => 'Sikeres bejelentkezés után a készülékeden klikkelj a lenti gombra a bejelentkezés jóváhagyásához.';

  @override
  String get seriesTab => 'Sorozatok';

  @override
  String get filmsTab => 'Filmek';

  @override
  String get eventsTab => 'Események';

  @override
  String get audioLanguage => 'Tartalom nyelve';

  @override
  String get subtitlesLanguage => 'Felírat nyelve';

  @override
  String get removeFromRecentSearches => 'Törölni szeretnéd ezt az elemet az utolsó keresésekből?';

  @override
  String get noTransmissionToday => 'Mai napra nincs tervezett adás';

  @override
  String get livestreamMaintenanceTitle => 'Élő közvetítés nem elérhető';

  @override
  String get start => 'Kezdés';

  @override
  String get transmissionSchedule => 'Adások időpontjai';

  @override
  String get featured => 'Ajánlott';

  @override
  String get errorTryAgain => 'Valami nem sikerült, próbáld később újra.';

  @override
  String get reportProblem => 'Ha problémád van, használd a lenti QR kódot e-mail küldéséhez.';

  @override
  String get phoneReadingProblem => 'Ha a telefonod nem tud QR kódot olvasni, küldjél nekük e-mailt következő információval';

  @override
  String get goTo => 'vagy lépjél tovább';

  @override
  String get watchBrunstad => 'Élő BrunstadTV nézés';

  @override
  String get notLogged => 'Nem vagy bejelentkezve';

  @override
  String get authResponse0 => 'Bejelentkezéshez új QR kódot használj.';

  @override
  String get authResponse1 => 'Jelentkezz be a mobilodon QR kóddal.';

  @override
  String get authResponse3 => 'Ellenőrizd a hálózati kapcsolatodat és próbálj újra.';

  @override
  String get liveHeader => 'Élő';

  @override
  String get recentlyPublishedSection => 'Nemrégiben megjelent';

  @override
  String get exploreCategoriesSection => 'Kategóriák felfedezése';

  @override
  String get programsSection => 'Programok';

  @override
  String get episodesSection => 'Epizódok';

  @override
  String get categorySeries => 'Sorozatok';

  @override
  String get categoryKids => 'Gyerekek';

  @override
  String get categoryFilms => 'Filmek';

  @override
  String get categoryEvents => 'Események';

  @override
  String get categoryMusic => 'Zene';

  @override
  String get noPlannedEvents => 'Ezen a napon nincs tervezett esemény';

  @override
  String get watchNow => 'Nézd meg most';

  @override
  String get exploreContent => 'Tartalom felfedezése';
}
