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
  String get loginPageDisplay1 => 'The most powerful\n message in the world';

  @override
  String get loginPageDisplay2 =>
      'Katsele Kristillisten arvojen mukaisia videoita, esityksiä, ja sarjoja';

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
  String get bccMediaCenter =>
      'BrunstadTV on ei-kaupallinen kristillisten ja positiivisten arvojen mukaisen median tuottaja.';

  @override
  String get signInButton => 'Kirjaudu sisään';

  @override
  String get tryAgainButton => 'Koita uudelleen';

  @override
  String get loggedOutTitle => 'Kirjautunut ulos';

  @override
  String get loggedOutMessage =>
      'Et ole kirjautuneena. Kirjaudu sisään uudelleen.';

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
  String get loginFailedCheckNetwork =>
      'Kirjautuminen epäonnistui. Tarkista nettiyhteys ja koita uudelleen.';

  @override
  String get loginFailedTryAgain =>
      'Kirjautuminen epäonnistui. Yritä myöhemmin uudelleen.';

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
  String get tVLoginSuccessful =>
      'Kirjautuminen onnistui. Vahvista televisiosta.';

  @override
  String get seeMore => 'Näytä lisää';

  @override
  String get seeAll => 'Näytä kaikki';

  @override
  String get series => 'Sarjat';

  @override
  String get livestreamMaintenance =>
      'Suoratoisto on juuri korjattavana. Pahoittelemme. Koita myöhemmin uudelleen.';

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
  String get emptySearch =>
      'Täältä voit hakea mitä tahansa BrunstadTV:n sisältöä; sarjoja, elokuvia, ja jaksoja.';

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
  String watchingWith(int numPeople) {
    return 'Sinä ja $numPeople muuta katselette tätä';
  }

  @override
  String get uploading => 'Lähetetään';

  @override
  String get uploadFail => 'Lähettäminen epäonnistui';

  @override
  String get post => 'Lähetä';

  @override
  String charactersLimit(int charsLeft, int charsTotal) {
    return '$charsTotal merkistä $charsLeft jäljellä';
  }

  @override
  String get uploadingPostSuccess => 'Viestisi on toimitettu.';

  @override
  String get testimonyInfo => 'Kuvaa video kännykällä.';

  @override
  String get yourVideo => 'Videosi';

  @override
  String get record => 'Kuvaa';

  @override
  String get recordingTips => 'Vinkkejä hyvän videon kuvaamiseen';

  @override
  String get recordingTipA => 'Kuvaa hiljaisessa ympäristössä.';

  @override
  String get recordingTipB => 'Huolehdi tasaisesta valaistuksesta kasvoille.';

  @override
  String get recordingTipC =>
      'Ajattele ensin mitä aiot sanoa - kuvaa vasta sitten.';

  @override
  String get recordingTipD => 'Pidä puhelinta vaaka-asennossa.';

  @override
  String get thankYou => 'Kiitoksia!';

  @override
  String get thankYouForContribution => 'Kiitos panoksesta!';

  @override
  String get uploadingVideoSuccess => 'Videosi on toimitettu.';

  @override
  String get next => 'Seuraava';

  @override
  String get recordVideoCameraPermissionAlert =>
      'Anna sovellukselle oikeus käyttää kameraa videon kuvaamiseen.';

  @override
  String get recordVideoPhotosPermissionAlert =>
      'Anna sovellukselle oikeus käyttää kuva-albumia videon kuvaamista varten.';

  @override
  String get recordVideoStoragePermissionAlert =>
      'Anna sovellukselle oikeus käyttää tallennustilaa videon kuvaamista varten.';

  @override
  String get recordVideoMicrophonePermissionAlert =>
      'Videon kuvaaminen vaatii oikeuden käyttää mikrofonia.';

  @override
  String get takePhotoStoragePermissionAlert =>
      'Kuvan ottamiseen tarvitaan oikeus käyttää tallennustilaa.';

  @override
  String get takePhotoCameraPermissionAlert =>
      'Kuvan ottamiseen tarvitaan oikeus käyttää kameraa.';

  @override
  String get pickPhotoStoragePermissionAlert =>
      'Anna sovellukselle oikeus käyttää tallennustilaa jotta voidaan valita kuvia.';

  @override
  String get permissionsAlertTitle => 'Tarvitaan käyttöoikeuksia';

  @override
  String get add => 'Lisää';

  @override
  String get change => 'Vaihda';

  @override
  String get recordingFailedTitle => 'Videon ottaminen epäonnistui';

  @override
  String get recordingFailedMessage =>
      'Jotain meni pieleen videon kuvaamisessa.';

  @override
  String get pollSubtitle => 'Kysely';

  @override
  String get writeHere => 'Kirjoita tähän';

  @override
  String get feed => 'Syöte';

  @override
  String get atmosphereFeedDescription =>
      'Osallistu viestivirtaan lähettämällä viesti, kuva, tai todistus. Missä oletkin.';

  @override
  String get information => 'Tiedot';

  @override
  String get photoNotSupported =>
      'Kuvien ottaminen tai valitseminen ei onnistu laitteellasi.';

  @override
  String get answerFailed =>
      'Vastauksen lähettäminen epäonnistui. Yritä uudelleen.';

  @override
  String get question => 'Kysymys';

  @override
  String get notificationChannelPlayerName => 'Soitin';

  @override
  String get now => 'Nyt';

  @override
  String get createPost => 'Luo viesti';

  @override
  String get concernTextPlaceholder => 'Kerro ongelmasta';

  @override
  String get debugInfoExplanation =>
      'Palautteesi sisältää myös seuraavat tiedot auttamaan meitä paremmin ymmärtämään ongelmaa.';

  @override
  String get send => 'Lähetä';

  @override
  String get sending => 'Lähetetään';

  @override
  String get thankYouSupportTitle => 'Kiitos palautteesta!';

  @override
  String get thankYouSupportDescription =>
      'Arvostamme kovasti palautetta ja teemme parhaamme ongelman korjaamiseen.';

  @override
  String get sendFail => 'Lähettäminen epäonnistui';

  @override
  String get sendFailDescription =>
      'Jokin ei nyt toimi. Tarkista nettiyhteys ja kokeile uudelleen.';

  @override
  String get today => 'Tänään';

  @override
  String get noNewPosts => 'Ei uusia viestejä';

  @override
  String newPostsMultiple(int postCount) {
    return '$postCount uutta viestiä!';
  }

  @override
  String newPostsSingle(int postCount) {
    return '$postCount uusi viesti!';
  }

  @override
  String get expired => 'Vanhentunut';

  @override
  String availableFrom(String date) {
    return 'Saatavilla $date';
  }

  @override
  String get howFar => 'Kuinka pitkän matkan kuljit?';

  @override
  String get submit => 'Lähetä';

  @override
  String get wellDone => 'Hyvin tehty!';

  @override
  String wellDoneDistance(int distanceInKM) {
    return 'Hienoa! Olet ilmoittanut yhteensä $distanceInKM km';
  }

  @override
  String get distanceRegistered =>
      'Ilmoittamasi matka on tallennettu. Tuossa alempana voit lisätä vielä muita lenkkejä.';

  @override
  String ranMore(int distanceInKM) {
    return 'Kuljin yli $distanceInKM km';
  }

  @override
  String moreThan(int distanceInKM) {
    return 'Yli $distanceInKM km';
  }

  @override
  String get runningEffort =>
      'Hyvä suoritus! Kirjaa kulkemasi matka tuohon alas.';

  @override
  String get slideSelect => 'Säädä matkaa palkkia liu\'uttamalla';

  @override
  String get submitAnotherDistance => 'Lisää toinen lenkki';

  @override
  String get editPicture => 'Muokkaa kuvaa';

  @override
  String get profilePicture => 'Profiilikuva';

  @override
  String get firstPostTitle => 'Ole ensimmäinen joka jakaa kuvan tai viestin';

  @override
  String timezoneInformation(String timeZone) {
    return 'Kellonajat ovat sinun aikavyöhykettä: $timeZone';
  }

  @override
  String get yourQuestion => 'Kysymyksesi';

  @override
  String get uploadingInquirySuccess =>
      'Huomaathan, että kaikkiin kysymyksiin ei lähetyksessä vastata.';

  @override
  String get askQuestion => 'Kysy jotain';

  @override
  String get submitQuestionInfo =>
      'Kysymällä jotain hyväksyt myös että kysymys voidaan julkaista.';

  @override
  String get posting => 'Lähetetään';

  @override
  String get submitPostInfo =>
      'Lähettämällä kuvan tai tekstin hyväksyt myös että se voidaan julkaista. ';

  @override
  String get cropImage => 'Rajaa kuvaa';

  @override
  String get square => 'Neliö';

  @override
  String get landscape => 'Vaakakuva';

  @override
  String get pollSingleChoice => 'Vastauksen voi valita vain kerran.';

  @override
  String get pollMultipleChoice => 'Vastausta voi muuttaa.';

  @override
  String get pollEnded => 'Valintakysely on valmis. Kiitos vastauksista.';

  @override
  String get browserInstall =>
      'Selain ei aukea. Voitko asentaa sellaisen jos se puuttuu.';

  @override
  String get share => 'Jaa';

  @override
  String get liveNow => 'Jetzt live';

  @override
  String get program => 'Ohjelma';

  @override
  String get participateTab => 'Osallistu';

  @override
  String get tomorrow => 'Huomenna';

  @override
  String get readBy => 'Lukenut: ';

  @override
  String pollAnswer(String answer) {
    return 'Valitsit $answer';
  }

  @override
  String get broadcasts => 'Lähetykset';

  @override
  String get quizAnswered => 'Vastaukset toimitettu';

  @override
  String get quizNotEnabled =>
      'Kyselyyn ei voi vastata juuri nyt. Yritä toiste.';

  @override
  String get calendar => 'Kalenteri';

  @override
  String get noEvents => 'Ei suunniteltuja lähetyksiä';

  @override
  String get appUpdateTitle => 'Päivitys on tarpeen';

  @override
  String get appUpdateRequest =>
      'Päivitä sovellus. Siinä on uusia juttuja ja vikoja on korjattu.';

  @override
  String get appUpdateAccepted => 'Päivitä';

  @override
  String get donationNotAvailable =>
      'Juuri nyt ei voi lahjoittaa. Yritä myöhemmin uudelleen.';

  @override
  String posts(int postsCount) {
    return '$postsCount viestiä';
  }

  @override
  String get copy => 'Kopioi';

  @override
  String get reload => 'Uusi yritys';

  @override
  String get participantsTitle => 'Kuka vastaa?';

  @override
  String get participantsSubtitle => 'Valitse yksi tai useampi osallistuja.';

  @override
  String get yourFamily => 'Perheesi';

  @override
  String get yourTurn => 'Sinun vuorosi';

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
  String get audioOnlyErrorDescription =>
      'Tarkista nettiyhteys ja yritä uudelleen';

  @override
  String get privacyPolicy => 'Tietosuojakäytäntö';

  @override
  String get tokenError =>
      'Nettiongelman vuoksi emme voi varmistaa kuka olet. Tämän vuoksi et voi vielä käyttää kaikkia ominaisuuksia.';

  @override
  String get categoriesTab => 'Luokat';

  @override
  String get settingsTab => 'Asetukset';

  @override
  String get confirmLogin => 'Vahvista kirjautuminen';

  @override
  String get scanInfo =>
      'Koodin kuvaaminen kännykällä vie sinut kirjautumissivulle.';

  @override
  String get validInfo => 'QR-koodi on voimassa 15 minuuttia.';

  @override
  String get confirmInfo =>
      'Kirjaudu sisään kännykällä. Vahvista sitten kirjautuminen alla olevasta painikkeesta.';

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
  String get removeFromRecentSearches =>
      'Haluatko poistaa tämän hakuhistoriasta?';

  @override
  String get noTransmissionToday => 'Tänään ei ole lähetystä';

  @override
  String get livestreamMaintenanceTitle => 'Suoratoistoa ei nyt ole';

  @override
  String get start => 'Alkaa';

  @override
  String get transmissionSchedule => 'Lähetysten aikataulu';

  @override
  String get featured => 'Ajankohtaista';

  @override
  String get errorTryAgain => 'Jokin meni pieleen. Yritä myöhemmin uudelleen.';

  @override
  String get reportProblem =>
      'Ongelmatilanteessa lähetä tämän QR-koodin avulla meille sähköpostia.';

  @override
  String get phoneReadingProblem =>
      'Jos et onnistu käyttämään QR-koodia, lähetä meille sähköpostia seuraavin tiedoin';

  @override
  String get goTo => 'vaihtoehtoisesti mene';

  @override
  String get watchBrunstad => 'Seuraa BrunstadTV lähetystä';

  @override
  String get notLogged => 'Ei kirjautuneena';

  @override
  String get authResponse0 => 'Käytä uutta QR-koodia kirjautumiseen.';

  @override
  String get authResponse1 => 'Kirjaudu kännykällä QR-koodin avulla.';

  @override
  String get authResponse3 =>
      'Tarkista nettiyhteys ja kokeile sitten uudelleen.';

  @override
  String get liveHeader => 'Live';

  @override
  String get recentlyPublishedSection => 'Vastikään julkaistu';

  @override
  String get exploreCategoriesSection => 'Selaile eri aiheita';

  @override
  String get programsSection => 'Ohjelmat';

  @override
  String get episodesSection => 'Jaksoa';

  @override
  String get categorySeries => 'Sarjat';

  @override
  String get categoryKids => 'Lapset';

  @override
  String get categoryFilms => 'Filmit';

  @override
  String get categoryEvents => 'Tapahtumat';

  @override
  String get categoryMusic => 'Musiikki';

  @override
  String get noPlannedEvents => 'Ei tapahtumia tänään';

  @override
  String get watchNow => 'Katso';

  @override
  String get exploreContent => 'Explore content';
}
