import 'app_localizations.dart';

/// The translations for Norwegian Bokmål (`nb`).
class SNb extends S {
  SNb([String locale = 'nb']) : super(locale);

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
  String get calendarWeek => 'uke';

  @override
  String get loading => 'Laster';

  @override
  String get loginPageDisplay1 => 'The most powerful message in the world';

  @override
  String get loginPageDisplay2 => 'Watch series, shows and films based on Christian values';

  @override
  String get loginPageDisplay3 => 'Produced by BCC Media';

  @override
  String get liveTab => 'Direkte';

  @override
  String get logOutButton => 'Logg ut';

  @override
  String get profileTab => 'Min profil';

  @override
  String get faq => 'Frequently asked questions';

  @override
  String get bccMediaCenter => 'BrunstadTV er et ikke-kommersielt mediesenter som produserer og distribuerer innhold med positive og kristne verdier.';

  @override
  String get signInButton => 'Logg på';

  @override
  String get tryAgainButton => 'Prøv igjen';

  @override
  String get loggedOutTitle => 'Logget ut';

  @override
  String get loggedOutMessage => 'Du har blitt logget ut. Vennligst logg inn igjen.';

  @override
  String get mostWatched => 'Mest sett';

  @override
  String get mostRecent => 'Sist publisert';

  @override
  String get latelyPublished => 'Sist publisert';

  @override
  String get anErrorOccurred => 'Det har oppstått en feil';

  @override
  String get ok => 'OK';

  @override
  String get loginFailedCheckNetwork => 'Det har oppstått en feil. Sjekk nettverksforbindelsen og prøv en gang til.';

  @override
  String get loginFailedTryAgain => 'Det har oppstått en feil. Prøv igjen senere.';

  @override
  String get soundLanguage => 'Lydspråk';

  @override
  String get subtitleLanguage => 'Språk for undertekster';

  @override
  String get appLanguage => 'App språk';

  @override
  String get checkNetwork => 'Sjekk nettverksforbindelsen og prøv en gang til';

  @override
  String get tryAgain => 'Prøv igjen senere.';

  @override
  String get cantPlayVideo => 'Kan ikke spille av denne videoen nå.';

  @override
  String get about => 'Om';

  @override
  String get version => 'Versjon';

  @override
  String get contactSupport => 'Kontakt support';

  @override
  String get cancel => 'Avbryt';

  @override
  String get upNext => 'Neste';

  @override
  String get done => 'Utført';

  @override
  String get playerSettings => 'Innstilling for videoavspiller';

  @override
  String get settings => 'Innstillinger';

  @override
  String get none => 'Ingen';

  @override
  String get auto => 'Auto';

  @override
  String get live => 'Direkte';

  @override
  String get subtitles => 'Undertekster';

  @override
  String get audio => 'Lyd';

  @override
  String get quality => 'Kvalitet';

  @override
  String get seasons => 'Sesonger';

  @override
  String get episodes => 'Episoder';

  @override
  String get search => 'Søk';

  @override
  String get noResults => 'Ingen resultater';

  @override
  String get doYouWantCast => 'Vil du sende denne videoen til Chromecast?';

  @override
  String get play => 'Spill av';

  @override
  String get castQueue => 'Legg til i kø';

  @override
  String get options => 'Alternativer';

  @override
  String get remove => 'Fjern';

  @override
  String get queueLimitTitle => 'Købegrensing Title';

  @override
  String queueLimitMessage(int elementCount) {
    return 'You cannot have more than $elementCount elements in queue.';
  }

  @override
  String get recentSearches => 'Siste søk';

  @override
  String get tVLogin => 'TV Login';

  @override
  String get tVLoginSuccessful => 'Du er nå logget inn, vennligst bekreft på TVen';

  @override
  String get seeMore => 'Se mer';

  @override
  String get seeAll => 'Se alle';

  @override
  String get series => 'Serier';

  @override
  String get livestreamMaintenance => 'Vi beklager, direktestrømmen er for tiden ikke tilgjengelig på grunn av vedlikehold. Prøv igjen senere';

  @override
  String get homeTab => 'Hjem';

  @override
  String get sortBy => 'Sorter etter';

  @override
  String get videoQuality => 'Video kvalitet';

  @override
  String get low => 'Lav';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'Høy';

  @override
  String get emptySearch => 'Du kan søke på alt innhold fra BrunstadTV. Serier, filmer og episoder';

  @override
  String get back => 'Tilbake';

  @override
  String get seasonLetter => 'S';

  @override
  String get episodeLetter => 'E';

  @override
  String get atoZ => 'A-Å';

  @override
  String get ztoA => 'Å-A';

  @override
  String get shortFilms => 'Kortfilmer';

  @override
  String get videos => 'Filmer';

  @override
  String get moreInfo => 'Mer informasjon';

  @override
  String get info => 'Informasjon';

  @override
  String get episode => 'Episode';

  @override
  String get takePhoto => 'Ta et bilde';

  @override
  String get pickPhoto => 'Hent fra galleri';

  @override
  String get uploadFileTitle => 'Last opp fil';

  @override
  String get uploadFileMessage => 'Vil du laste opp denne filen?';

  @override
  String watchingWith(int numPeople) {
    return 'Du ser på sammen med $numPeople andre';
  }

  @override
  String get uploading => 'Opplasting';

  @override
  String get uploadFail => 'Opplasting feilet';

  @override
  String get post => 'Send';

  @override
  String charactersLimit(int charsLeft, int charsTotal) {
    return '$charsLeft av $charsTotal tegn igjen';
  }

  @override
  String get uploadingPostSuccess => 'Ditt innlegg har blitt sendt inn.';

  @override
  String get testimonyInfo => 'Ta opp video med telefonen din.';

  @override
  String get yourVideo => 'Din video';

  @override
  String get record => 'Ta opp';

  @override
  String get recordingTips => 'Noen tips for å ta et godt opptak';

  @override
  String get recordingTipA => 'Finn et stille sted for å ta opp.';

  @override
  String get recordingTipB => 'Pass på at ansiktet ditt er jevnt opplyst.';

  @override
  String get recordingTipC => 'Tenk over hva du ønsker å si før du starter opptak.';

  @override
  String get recordingTipD => 'Snu telefonen i liggende retning';

  @override
  String get thankYou => 'Tusen takk!';

  @override
  String get thankYouForContribution => 'Takk for ditt bidrag!';

  @override
  String get uploadingVideoSuccess => 'Din video har blitt sendt inn.';

  @override
  String get next => 'Neste';

  @override
  String get recordVideoCameraPermissionAlert => 'Du må gi kamera tillatelse i innstillinger for å kunne ta opp video.';

  @override
  String get recordVideoPhotosPermissionAlert => 'Du må gi kamerarull tillatelse i innstillinger for å kunne ta opp video.';

  @override
  String get recordVideoStoragePermissionAlert => 'Du må gi lagring tillatelse i innstillinger for å kunne ta opp video.';

  @override
  String get recordVideoMicrophonePermissionAlert => 'Du må gi mikrofon tillatelse i innstillinger for å kunne ta opp video.';

  @override
  String get takePhotoStoragePermissionAlert => 'Du må gi lagring tillatelse i innstillinger for å kunne ta bilde.';

  @override
  String get takePhotoCameraPermissionAlert => 'Du må gi kamera tillatelse i innstillinger for å kunne ta bilde.';

  @override
  String get pickPhotoStoragePermissionAlert => 'Du må gi lagring tillatelse i innstillinger for å kunne velge bilder.';

  @override
  String get permissionsAlertTitle => 'Tillatelse trenges';

  @override
  String get add => 'Legg til';

  @override
  String get change => 'Endre';

  @override
  String get recordingFailedTitle => 'Kunne ikke ta opp video';

  @override
  String get recordingFailedMessage => 'Noe gikk feil underveis i videoopptaket.';

  @override
  String get pollSubtitle => 'Avstemming';

  @override
  String get writeHere => 'Skriv her';

  @override
  String get feed => 'Feed';

  @override
  String get atmosphereFeedDescription => 'Bidra i feeden ved å sende inn en hilsen, et vitnesbyrd eller et bilde fra der du er.';

  @override
  String get information => 'Informasjon';

  @override
  String get photoNotSupported => 'Ta og velge bilder er ikke støttet på denne enheten.';

  @override
  String get answerFailed => 'Beklager! Vi kunne ikke sende inn svaret. Vennligst prøv igjen.';

  @override
  String get question => 'Spørsmål';

  @override
  String get notificationChannelPlayerName => 'Spiller';

  @override
  String get now => 'Nå';

  @override
  String get createPost => 'Lag innlegg';

  @override
  String get concernTextPlaceholder => 'Beskriv problemet';

  @override
  String get debugInfoExplanation => 'Meldingen din vil inneholde denne informasjonen for å hjelpe oss å forstå problemet bedre.';

  @override
  String get send => 'Send';

  @override
  String get sending => 'Sender';

  @override
  String get thankYouSupportTitle => 'Takk for din tilbakemelding!';

  @override
  String get thankYouSupportDescription => 'Vi setter pris på alle tilbakemeldinger og vi vil se på problemet så snart som mulig.';

  @override
  String get sendFail => 'Kunne ikke sende din melding';

  @override
  String get sendFailDescription => 'Noe gikk galt. Sjekk internettforbindelsen din og prøv på nytt.';

  @override
  String get today => 'I dag';

  @override
  String get noNewPosts => 'Ingen nye innlegg';

  @override
  String newPostsMultiple(int postCount) {
    return '$postCount nye innlegg!';
  }

  @override
  String newPostsSingle(int postCount) {
    return '$postCount nytt innlegg!';
  }

  @override
  String get expired => 'Utgått';

  @override
  String availableFrom(String date) {
    return 'Tilgjengelig $date';
  }

  @override
  String get howFar => 'Hvor lang var turen din?';

  @override
  String get submit => 'Send inn';

  @override
  String get wellDone => 'Bra jobbet!';

  @override
  String wellDoneDistance(int distanceInKM) {
    return 'Bra jobbet! Du har registrert en total distanse på $distanceInKM km';
  }

  @override
  String get distanceRegistered => 'Din distanse har blitt registrert. Fortsett under hvis du vil legge til en distanse til.';

  @override
  String ranMore(int distanceInKM) {
    return 'Jeg gikk mer enn $distanceInKM km';
  }

  @override
  String moreThan(int distanceInKM) {
    return 'Mer enn $distanceInKM km';
  }

  @override
  String get runningEffort => 'Fantastisk innsats! Skriv inn antallet kilometer du gikk under.';

  @override
  String get slideSelect => 'Sveip for å velge hvor lang turen din var';

  @override
  String get submitAnotherDistance => 'Legg til en distanse til';

  @override
  String get editPicture => 'Rediger bilde';

  @override
  String get profilePicture => 'Profilbilde';

  @override
  String get firstPostTitle => 'Vær den første til å sende inn et bilde eller å skrive en melding';

  @override
  String timezoneInformation(String timeZone) {
    return 'Tv-guide tidstabell er i din lokale tid: $timeZone';
  }

  @override
  String get yourQuestion => 'Ditt spørsmål';

  @override
  String get uploadingInquirySuccess => 'Vi gjør oppmerksom på at ikke alle svarene kan bli besvart i sendingen';

  @override
  String get askQuestion => 'Still et spørsmål';

  @override
  String get submitQuestionInfo => 'Ved å sende inn et spørsmål aksepterer du at dette kan bli brukt for senere publisering.';

  @override
  String get posting => 'Innsending';

  @override
  String get submitPostInfo => 'Ved å sende inn et spørsmål aksepterer du at dette kan bli brukt for senere publisering. ';

  @override
  String get cropImage => 'Beskjær bildet';

  @override
  String get square => 'Kvadrat';

  @override
  String get landscape => 'Landskap';

  @override
  String get pollSingleChoice => 'Du kan bare velge et svar en gang';

  @override
  String get pollMultipleChoice => 'Du kan endre svaret ditt flere ganger.';

  @override
  String get pollEnded => 'Avstemningen er slutt. Takk for dine svar.';

  @override
  String get browserInstall => 'Vennligst installer nettleser for å kunne åpne denne URLen.';

  @override
  String get share => 'Del';

  @override
  String get liveNow => 'Direkte nå';

  @override
  String get program => 'Program';

  @override
  String get participateTab => 'Delta';

  @override
  String get tomorrow => 'I morgen';

  @override
  String get readBy => 'Lest av';

  @override
  String pollAnswer(String answer) {
    return 'Du har svart: $answer';
  }

  @override
  String get broadcasts => 'Sendinger';

  @override
  String get quizAnswered => 'Svar sendt';

  @override
  String get quizNotEnabled => 'Quiz er ikke tilgjengelig for øyeblikket. Vennligst prøv igjen senere.';

  @override
  String get calendar => 'Kalender';

  @override
  String get noEvents => 'Ingen planlagte sendinger';

  @override
  String get appUpdateTitle => 'Krever oppdatering';

  @override
  String get appUpdateRequest => 'Vennligst last ned den siste versjonen av appen for å få gleden av de siste funksjonene og feilrettingene.';

  @override
  String get appUpdateAccepted => 'Oppdater';

  @override
  String get donationNotAvailable => 'Donasjon er ikke tilgjengelig for øyeblikket. Vennligst prøv igjen senere.';

  @override
  String posts(int postsCount) {
    return '$postsCount Innlegg';
  }

  @override
  String get copy => 'Kopier';

  @override
  String get reload => 'Last inn på nytt';

  @override
  String get participantsTitle => 'Hvem svarer?';

  @override
  String get participantsSubtitle => 'Velg en eller flere deltagere.';

  @override
  String get yourFamily => 'Familien din';

  @override
  String get yourTurn => 'Din tur';

  @override
  String get fAQ => 'FAQ';

  @override
  String get shareStart => 'Del fra start';

  @override
  String shareTime(String time) {
    return 'Del fra tid $time';
  }

  @override
  String get loadContentError => 'Kunne ikke laste innhold';

  @override
  String get audioOnlyErrorDescription => 'Sjekk nettverksforbindelsen og prøv en gang til';

  @override
  String get privacyPolicy => 'Personvernerklæring';

  @override
  String get tokenError => 'Vi kunne ikke bekrefte din identitet, mest sannsynlig på grunn av et nettverksproblem. Noen funksjoner i appen fungerer kanskje ikke som de skal.';

  @override
  String get categoriesTab => 'Kategorier';

  @override
  String get settingsTab => 'Innstillinger';

  @override
  String get confirmLogin => 'Bekreft innlogging';

  @override
  String get scanInfo => 'Skann koden med telefonen din for å gå til påloggingssiden.';

  @override
  String get validInfo => 'QR-koden er gyldig i 15 minutter.';

  @override
  String get confirmInfo => 'Etter innlogging, klikk på knappen nedenfor for å bekrefte innlogging.';

  @override
  String get seriesTab => 'Serier';

  @override
  String get filmsTab => 'Filmer';

  @override
  String get eventsTab => 'Eventer';

  @override
  String get audioLanguage => 'Lydspråk';

  @override
  String get subtitlesLanguage => 'Språk for undertekster';

  @override
  String get removeFromRecentSearches => 'Vil du fjerne dette elementet fra siste søk?';

  @override
  String get noTransmissionToday => 'Ingen planlagte sendinger i dag';

  @override
  String get livestreamMaintenanceTitle => 'Direktestrømmen er ikke tilgjengelig';

  @override
  String get start => 'Start';

  @override
  String get transmissionSchedule => 'Sendetider';

  @override
  String get featured => 'Anbefalt';

  @override
  String get errorTryAgain => 'Noe gikk galt, vennligst prøv igjen senere.';

  @override
  String get reportProblem => 'Har du problemer med QR-koden - send oss en epost.';

  @override
  String get phoneReadingProblem => 'Hvis telefonen din ikke kan lese QR-koden send en epost med følgende informasjon til';

  @override
  String get goTo => 'eller gå til';

  @override
  String get watchBrunstad => 'Se BrunstadTV direkte';

  @override
  String get notLogged => 'Ikke logget inn';

  @override
  String get authResponse0 => 'Vennligst bruk ny QR-kode for å logge inn.';

  @override
  String get authResponse1 => 'Vennligst logg inn på mobilen din med QR-kode.';

  @override
  String get authResponse3 => 'Sjekk nettverksforbindelsen og prøv igjen senere.';

  @override
  String get liveHeader => 'Direkte';

  @override
  String get recentlyPublishedSection => 'Nylig publisert';

  @override
  String get exploreCategoriesSection => 'Utforsk kategorier';

  @override
  String get programsSection => 'Programmer';

  @override
  String get episodesSection => 'Episoder';

  @override
  String get categorySeries => 'Serier';

  @override
  String get categoryKids => 'Barn';

  @override
  String get categoryFilms => 'Filmer';

  @override
  String get categoryEvents => 'Eventer';

  @override
  String get categoryMusic => 'Musikk';

  @override
  String get noPlannedEvents => 'Ingen planlagte hendelser i dag';

  @override
  String get watchNow => 'Se nå';

  @override
  String get exploreContent => 'Explore content';
}
