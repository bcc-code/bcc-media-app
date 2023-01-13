import 'app_localizations.dart';

/// The translations for Finnish (`fi`).
class SFi extends S {
  SFi([String locale = 'fi']) : super(locale);

  @override
  String get loadingContent => 'Hetkinen';

  @override
  String get signInTooltip => 'Kirjautumalla näet lisää';

  @override
  String get skipToPublicContent => 'Ohita, ja katso vain julkista sisältöä';

  @override
  String get minutesShort => 'min';

  @override
  String get calendarThisWeek => 'Tällä viikolla';

  @override
  String get calendarWeek => 'viikko';

  @override
  String get loading => 'Lataillaan';

  @override
  String get loginPageDisplay1 => 'Kaikista maailman sanomista voimakkain';

  @override
  String get loginPageDisplay2 => 'Katsele Kristillisten arvojen mukaisia videoita, esityksiä, ja sarjoja';

  @override
  String get loginPageDisplay3 => 'BCC Median tuottama';

  @override
  String get liveTab => 'Live';

  @override
  String get logOutButton => 'Kirjaudu ulos';

  @override
  String get profileTab => 'Profiili';

  @override
  String get faq => 'Usein kysyttyä';

  @override
  String get bccMediaCenter => 'BCC Media on BCC Liiton mediayksikkö. Se tuottaa ja toimittaa positiivista Kristillisten arvojen mukaista sisältöä.';

  @override
  String get signInButton => 'Kirjaudu sisään';

  @override
  String get tryAgainButton => 'Koita uudelleen';

  @override
  String get loggedOutTitle => 'Kirjautunut ulos';

  @override
  String get loggedOutMessage => 'Et ole kirjautuneena. Kirjaudu sisään uudelleen.';

  @override
  String get mostWatched => 'Eniten katsellut';

  @override
  String get mostRecent => 'Tuoreimmat';

  @override
  String get latelyPublished => 'Tuoreita julkaisuja';

  @override
  String get anErrorOccurred => 'Sattui ongelma';

  @override
  String get ok => 'OK';

  @override
  String get loginFailedCheckNetwork => 'Kirjautuminen epäonnistui. Tarkista nettiyhteys ja koita uudelleen.';

  @override
  String get loginFailedTryAgain => 'Kirjautuminen epäonnistui. Yritä myöhemmin uudelleen.';

  @override
  String get soundLanguage => 'Äänen kieli';

  @override
  String get subtitleLanguage => 'Tekstityksen kieli';

  @override
  String get appLanguage => 'Sovelluksen kieli';

  @override
  String get checkNetwork => 'Tarkista nettiyhteys ja yritä uudelleen.';

  @override
  String get tryAgain => 'Yritä myöhemmin uudelleen.';

  @override
  String get cantPlayVideo => 'Tätä videota ei voi nyt toistaa.';

  @override
  String get about => 'Tietoja';

  @override
  String get version => 'Versio';

  @override
  String get contactSupport => 'Tukipyyntö';

  @override
  String get cancel => 'Peru';

  @override
  String get upNext => 'Tulossa';

  @override
  String get done => 'Valmis';

  @override
  String get playerSettings => 'Soittimen asetukset';

  @override
  String get settings => 'Asetukset';

  @override
  String get none => 'Ei mikään';

  @override
  String get auto => 'Automaattinen';

  @override
  String get live => 'Live';

  @override
  String get subtitles => 'Tekstitys';

  @override
  String get audio => 'Ääni';

  @override
  String get quality => 'Laatu';

  @override
  String get seasons => 'Tuotantokaudet';

  @override
  String get episodes => 'Jaksoa';

  @override
  String get search => 'Haku';

  @override
  String get noResults => 'Mitään ei löytynyt';

  @override
  String get doYouWantCast => 'Haluatko lähettää videon ruudulle?';

  @override
  String get play => 'Toista';

  @override
  String get castQueue => 'Toista kaikki isolle ruudulle';

  @override
  String get options => 'Valinnat';

  @override
  String get remove => 'Poista';

  @override
  String get queueLimitTitle => 'Rajoitus';

  @override
  String queueLimitMessage(int elementCount) {
    return 'Jonossa ei voi olle enempää kuin $elementCount juttua.';
  }

  @override
  String get recentSearches => 'Aiemmin haettu';

  @override
  String get tVLogin => 'Kirjaudu sisään televisiolla';

  @override
  String get tVLoginSuccessful => 'Kirjautuminen onnistui. Vahvista televisiosta.';

  @override
  String get seeMore => 'Näytä lisää';

  @override
  String get seeAll => 'Näytä kaikki';

  @override
  String get series => 'Sarjat';

  @override
  String get homeTab => 'Etusivu';

  @override
  String get sortBy => 'Järjestelyperuste';

  @override
  String get videoQuality => 'Videon laatu';

  @override
  String get low => 'Alhainen';

  @override
  String get medium => 'Keskiverto';

  @override
  String get high => 'Laadukas';

  @override
  String get emptySearch => 'Täältä voit hakea mitä tahansa BCC Median sisältöä; sarjoja, elokuvia, ja jaksoja.';

  @override
  String get back => 'Takaisin';

  @override
  String get seasonLetter => 'TK';

  @override
  String get episodeLetter => 'J';

  @override
  String get atoZ => 'A-Ö';

  @override
  String get ztoA => 'Ö-A';

  @override
  String get shortFilms => 'Lyhytfilmit';

  @override
  String get videos => 'Videota';

  @override
  String get moreInfo => 'Tarkempia tietoja';

  @override
  String get info => 'Tiedot';

  @override
  String get episode => 'Jakso';

  @override
  String get takePhoto => 'Ota kuva';

  @override
  String get pickPhoto => 'Valitse kuvakansiosta';

  @override
  String get uploadFileTitle => 'Lähetä tiedosto';

  @override
  String get uploadFileMessage => 'Haluatko lähettää tämän tiedoston?';

  @override
  String get uploading => 'Lähetetään';

  @override
  String get uploadFail => 'Lähettäminen epäonnistui';

  @override
  String charactersLimit(int charsLeft, int charsTotal) {
    return '$charsTotal merkistä $charsLeft jäljellä';
  }

  @override
  String get thankYou => 'Kiitoksia!';

  @override
  String get thankYouForContribution => 'Kiitos panoksesta!';

  @override
  String get next => 'Seuraava';

  @override
  String get add => 'Lisää';

  @override
  String get change => 'Vaihda';

  @override
  String get writeHere => 'Kirjoita tähän';

  @override
  String get feed => 'Syöte';

  @override
  String get information => 'Tiedot';

  @override
  String get question => 'Kysymys';

  @override
  String get now => 'Nyt';

  @override
  String get concernTextPlaceholder => 'Kerro ongelmasta';

  @override
  String get debugInfoExplanation => 'Palautteesi sisältää myös seuraavat tiedot auttamaan meitä paremmin ymmärtämään ongelmaa.';

  @override
  String get send => 'Lähetä';

  @override
  String get sending => 'Lähetetään';

  @override
  String get thankYouSupportTitle => 'Kiitos palautteesta!';

  @override
  String get thankYouSupportDescription => 'Arvostamme kovasti palautetta ja teemme parhaamme ongelman korjaamiseen.';

  @override
  String get sendFail => 'Lähettäminen epäonnistui';

  @override
  String get sendFailDescription => 'Jokin ei nyt toimi. Tarkista nettiyhteys ja kokeile uudelleen.';

  @override
  String get today => 'Tänään';

  @override
  String get expired => 'Vanhentunut';

  @override
  String availableFrom(String date) {
    return 'Saatavilla $date';
  }

  @override
  String get submit => 'Lähetä';

  @override
  String get wellDone => 'Hyvin tehty!';

  @override
  String get editPicture => 'Muokkaa kuvaa';

  @override
  String get profilePicture => 'Profiilikuva';

  @override
  String timezoneInformation(String timeZone) {
    return 'Kellonajat ovat sinun aikavyöhykettä: $timeZone';
  }

  @override
  String get share => 'Jaa';

  @override
  String get liveNow => 'Jetzt live';

  @override
  String get tomorrow => 'Huomenna';

  @override
  String get readBy => 'Lukenut: ';

  @override
  String get broadcasts => 'Lähetykset';

  @override
  String get calendar => 'Kalenteri';

  @override
  String get noEvents => 'Ei suunniteltuja lähetyksiä';

  @override
  String get appUpdateTitle => 'Päivitys on tarpeen';

  @override
  String get appUpdateRequest => 'Päivitä sovellus. Siinä on uusia juttuja ja vikoja on korjattu.';

  @override
  String get appUpdateAccepted => 'Päivitä';

  @override
  String get copy => 'Kopioi';

  @override
  String get reload => 'Uusi yritys';

  @override
  String get fAQ => 'UKK';

  @override
  String get shareStart => 'Jaa video';

  @override
  String shareTime(String time) {
    return 'Jaa video tästä kohtaa $time';
  }

  @override
  String get loadContentError => 'Sisällön nouto epäonnistui';

  @override
  String get privacyPolicy => 'Tietosuojakäytäntö';

  @override
  String get categoriesTab => 'Luokat';

  @override
  String get seriesTab => 'Sarjat';

  @override
  String get filmsTab => 'Filmit';

  @override
  String get eventsTab => 'Tapahtumat';

  @override
  String get audioLanguage => 'Äänen kieli';

  @override
  String get subtitlesLanguage => 'Tekstityksen kieli';

  @override
  String get removeFromRecentSearches => 'Haluatko poistaa tämän hakuhistoriasta?';

  @override
  String get noTransmissionToday => 'Tänään ei ole lähetystä';

  @override
  String get featured => 'Ajankohtaista';

  @override
  String get errorTryAgain => 'Jokin meni pieleen. Yritä myöhemmin uudelleen.';

  @override
  String get liveHeader => 'Live';

  @override
  String get programsSection => 'Ohjelmat';

  @override
  String get noPlannedEvents => 'Ei tapahtumia tänään';

  @override
  String get watchNow => 'Katso';

  @override
  String get exploreContent => 'Tutustu sisältöön';

  @override
  String get taskCompleted => 'tehtävä suoritettu';

  @override
  String get tasksCompleted => 'tehtävää suoritettu';

  @override
  String get studyCompleteTaskDescription => 'Suorita tehtäviä ja löydä siihen liittyvää sisältöä';

  @override
  String get discoverMore => 'Löydä lisää';

  @override
  String get completePreviousTasks => 'Avaa suorittamalla edellinen tehtävä';

  @override
  String get studyDiscoverMoreDescription => 'Löydä aiheeseen liittyvää inspiroivaa ja valaisevaa sisältöä';

  @override
  String get watchAgain => 'Katso uudelleen';

  @override
  String get continueToTaskIn => 'Tehtävän jatkoon';

  @override
  String get continueToTasksIn => 'Tehtävien jatkoon';

  @override
  String get studyLessonCompleted => 'oppitunti suoritettu';

  @override
  String get studyLessonsCompleted => 'oppituntia suoritettu';

  @override
  String get continueStudy => 'Jatka opintoa';

  @override
  String get startStudy => 'Aloita opinto';

  @override
  String get videoCompletedText => 'Hienoa, katsoit videon loppuun.';

  @override
  String get achievementFirstDescription => 'Ensimmäinen saavutus - katsoit videon. Hieno homma!';

  @override
  String achievementStudyTopic(String name) {
    return 'Hieno homma. Olet suorittanut opintokokonaisuuden $name';
  }

  @override
  String videoCount(int count) {
    return '$count videota';
  }

  @override
  String taskCount(int count) {
    return '$count tehtäviä';
  }

  @override
  String posterCount(int count) {
    return '$count julistetta';
  }

  @override
  String resourceCount(int count) {
    return '$count sisältöpakettia';
  }

  @override
  String get continueButton => 'Jatka';

  @override
  String get achievements => 'Saavutukset';

  @override
  String get oops => 'Hupsista!';

  @override
  String get dontHaveAccess => 'Sinulla ei ole oikeutta tähän sisältöön.';

  @override
  String get mustBeLoggedIn => 'Tämän katsominen vaatii kirjautumista';

  @override
  String get plentyOfOtherContent => 'Mutta ei syytä huoleen. On edelleen paljon mitä voit katsella.';

  @override
  String get notAchieved => 'Not achieved';
}
