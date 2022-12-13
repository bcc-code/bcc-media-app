import 'app_localizations.dart';

/// The translations for French (`fr`).
class SFr extends S {
  SFr([String locale = 'fr']) : super(locale);

  @override
  String get loadingContent => 'Chargement du contenu';

  @override
  String get signInTooltip => 'Se connecter pour voir plus de contenu';

  @override
  String get skipToPublicContent => 'Passer à la visualisation du contenu public';

  @override
  String get minutesShort => 'min';

  @override
  String get calendarThisWeek => 'Cette semaine';

  @override
  String get calendarWeek => 'semaine';

  @override
  String get loading => 'Chargement';

  @override
  String get loginPageDisplay1 => 'Le message le plus\n puissant au monde';

  @override
  String get loginPageDisplay2 => 'Regarde des séries, des émissions et des films basés sur les valeurs chrétiennes';

  @override
  String get loginPageDisplay3 => 'Produit par BCC Media';

  @override
  String get liveTab => 'En direct';

  @override
  String get logOutButton => 'Déconnexion';

  @override
  String get profileTab => 'Profil';

  @override
  String get faq => 'Foire aux Questions';

  @override
  String get bccMediaCenter => 'BrunstadTV est un média à caractère non lucratif qui produit et distribue du contenu basé sur des valeurs positives et chrétiennes.';

  @override
  String get signInButton => 'Se connecter';

  @override
  String get tryAgainButton => 'Essayer à nouveau';

  @override
  String get loggedOutTitle => 'Déconnecté';

  @override
  String get loggedOutMessage => 'Tu as été déconnecté. Merci de te connecter à nouveau.';

  @override
  String get mostWatched => 'Le plus regardé';

  @override
  String get mostRecent => 'Le plus récent';

  @override
  String get latelyPublished => 'Publié récemment';

  @override
  String get anErrorOccurred => 'Une erreur s\'est produite';

  @override
  String get ok => 'OK';

  @override
  String get loginFailedCheckNetwork => 'Échec de la connexion. Vérifie ta connexion internet et retente à nouveau.';

  @override
  String get loginFailedTryAgain => 'Échec de la connexion. Merci de retenter plus tard.';

  @override
  String get soundLanguage => 'Langage audio';

  @override
  String get subtitleLanguage => 'Langue des sous-titres';

  @override
  String get appLanguage => 'Langue de l\'application';

  @override
  String get checkNetwork => 'Vérifie ta connexion internet et retente à nouveau.';

  @override
  String get tryAgain => 'Merci de retenter plus tard.';

  @override
  String get cantPlayVideo => 'Tu ne peux pas lire cette vidéo maintenant.';

  @override
  String get about => 'À propos';

  @override
  String get version => 'Version';

  @override
  String get contactSupport => 'Contacter le support';

  @override
  String get cancel => 'Annuler';

  @override
  String get upNext => 'Suivant';

  @override
  String get done => 'Terminé';

  @override
  String get playerSettings => 'Paramètres du lecteur';

  @override
  String get settings => 'Paramètres';

  @override
  String get none => 'Aucun';

  @override
  String get auto => 'Auto';

  @override
  String get live => 'En direct';

  @override
  String get subtitles => 'Sous-titres';

  @override
  String get audio => 'Audio';

  @override
  String get quality => 'Qualité';

  @override
  String get seasons => 'Saisons';

  @override
  String get episodes => 'Épisodes';

  @override
  String get search => 'Rechercher';

  @override
  String get noResults => 'Aucun résultat trouvé';

  @override
  String get doYouWantCast => 'Veux-tu caster cette vidéo ?';

  @override
  String get play => 'Lire';

  @override
  String get castQueue => 'File d\'attente du Chromecast';

  @override
  String get options => 'Options';

  @override
  String get remove => 'Supprimer';

  @override
  String get queueLimitTitle => 'Limite';

  @override
  String queueLimitMessage(int elementCount) {

    return 'Tu ne peux pas avoir plus de $elementCount éléments dans la file d\'attente.';
  }

  @override
  String get recentSearches => 'Recherches récentes';

  @override
  String get tVLogin => 'Connexion TV';

  @override
  String get tVLoginSuccessful => 'Connexion réussie, merci de confirmer sur la TV.';

  @override
  String get seeMore => 'Voir plus';

  @override
  String get seeAll => 'Voir tout';

  @override
  String get series => 'Séries';

  @override
  String get livestreamMaintenance => 'Désolés, la diffusion en direct est en maintenance pour le moment. Merci de retenter plus tard.';

  @override
  String get homeTab => 'Accueil';

  @override
  String get sortBy => 'Trié par';

  @override
  String get videoQuality => 'Qualité vidéo';

  @override
  String get low => 'Basse';

  @override
  String get medium => 'Moyenne';

  @override
  String get high => 'Haute';

  @override
  String get emptySearch => 'Tu peux faire une recherche sur tout le contenu de BrunstadTV. Séries, films et épisodes.';

  @override
  String get back => 'Retour';

  @override
  String get seasonLetter => 'S';

  @override
  String get episodeLetter => 'E';

  @override
  String get atoZ => 'A-Z';

  @override
  String get ztoA => 'Z-A';

  @override
  String get shortFilms => 'Courts-métrages';

  @override
  String get videos => 'Vidéos';

  @override
  String get moreInfo => 'Plus d\'informations';

  @override
  String get info => 'Information';

  @override
  String get episode => 'Épisode';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get pickPhoto => 'Choisir dans la galerie';

  @override
  String get uploadFileTitle => 'Télécharger un fichier';

  @override
  String get uploadFileMessage => 'Veux-tu télécharger ce fichier ?';

  @override
  String watchingWith(int numPeople) {

    return 'Tu regardes avec $numPeople autres personnes';
  }

  @override
  String get uploading => 'Téléchargement';

  @override
  String get uploadFail => 'Echec du téléchargement';

  @override
  String get post => 'Publier';

  @override
  String charactersLimit(int charsLeft, int charsTotal) {

    return '$charsLeft sur $charsTotal caractères restants';
  }

  @override
  String get uploadingPostSuccess => 'Ta contribution a été envoyée.';

  @override
  String get testimonyInfo => 'Enregistre ta vidéo avec ton téléphone.';

  @override
  String get yourVideo => 'Ta vidéo';

  @override
  String get record => 'Enregistrer';

  @override
  String get recordingTips => 'Quelques recommandations pour avoir un bel enregistrement';

  @override
  String get recordingTipA => 'Trouve un endroit calme pour t\'enregistrer.';

  @override
  String get recordingTipB => 'Veille à ce que ton visage soit éclairé de manière uniforme.';

  @override
  String get recordingTipC => 'Pense à ce que tu souhaites dire avant de commencer l\'enregistrement.';

  @override
  String get recordingTipD => 'Mettez votre téléphone en mode paysage.';

  @override
  String get thankYou => 'Merci beaucoup !';

  @override
  String get thankYouForContribution => 'Merci pour ta contribution !';

  @override
  String get uploadingVideoSuccess => 'Ta vidéo a été envoyée.';

  @override
  String get next => 'Suivant';

  @override
  String get recordVideoCameraPermissionAlert => 'Tu dois autoriser l\'utilisation de la caméra dans les paramètres d\'enregistrement vidéo.';

  @override
  String get recordVideoPhotosPermissionAlert => 'Tu dois autoriser l\'utilisation de la galerie dans les paramètres d\'enregistrement vidéo.';

  @override
  String get recordVideoStoragePermissionAlert => 'Tu dois autoriser l\'utilisation du stockage dans les paramètres pour enregistrer des vidéos.';

  @override
  String get recordVideoMicrophonePermissionAlert => 'Tu dois autoriser l\'utilisation du micro dans les paramètres pour enregistrer des vidéos.';

  @override
  String get takePhotoStoragePermissionAlert => 'Tu dois autoriser l\'utilisation du stockage dans les paramètres pour prendre des photos.';

  @override
  String get takePhotoCameraPermissionAlert => 'Tu dois autoriser l\'utilisation de la caméra dans les paramètres pour prendre une photo.';

  @override
  String get pickPhotoStoragePermissionAlert => 'Tu dois autoriser l\'utilisation du stockage dans les paramètres pour choisir des photos.';

  @override
  String get permissionsAlertTitle => 'Autorisations nécessaires';

  @override
  String get add => 'Ajouter';

  @override
  String get change => 'Modifier';

  @override
  String get recordingFailedTitle => 'Vidéo non enregistrée';

  @override
  String get recordingFailedMessage => 'Erreur lors de l\'enregistrement de la vidéo.';

  @override
  String get pollSubtitle => 'Sondage';

  @override
  String get writeHere => 'Écris ici';

  @override
  String get feed => 'Flux';

  @override
  String get atmosphereFeedDescription => 'Contribue dans le flux, en envoyant un message, un témoignage ou une photo prise là où tu te trouves.';

  @override
  String get information => 'Information';

  @override
  String get photoNotSupported => 'Cet appareil ne prend pas en charge la prise ou la sélection de photos.';

  @override
  String get answerFailed => 'Désolé ! Ta réponse n\'a pas été envoyée. Merci de réessayer.';

  @override
  String get question => 'Question';

  @override
  String get notificationChannelPlayerName => 'Lecteur';

  @override
  String get now => 'Maintenant';

  @override
  String get createPost => 'Créer une publication';

  @override
  String get concernTextPlaceholder => 'Décris le problème';

  @override
  String get debugInfoExplanation => 'Ton message inclura cette information, pour nous aider à mieux comprendre le problème.';

  @override
  String get send => 'Envoyer';

  @override
  String get sending => 'Envoi en cours';

  @override
  String get thankYouSupportTitle => 'Merci pour ton commentaire !';

  @override
  String get thankYouSupportDescription => 'Nous apprécions tous les commentaires et nous nous pencherons sur ce problème dès que possible.';

  @override
  String get sendFail => 'Ton message n\'a pas pu être envoyé';

  @override
  String get sendFailDescription => 'Une erreur est survenue. Vérifie ta connexion internet et réessaye.';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get noNewPosts => 'Aucune nouvelle publication';

  @override
  String newPostsMultiple(int postCount) {

    return '$postCount nouvelles publications !';
  }

  @override
  String newPostsSingle(int postCount) {

    return '$postCount nouvelle publication !';
  }

  @override
  String get expired => 'Expiré';

  @override
  String availableFrom(String date) {

    return 'Disponible $date';
  }

  @override
  String get howFar => 'Quelle distance as-tu parcourue ?';

  @override
  String get submit => 'Envoyer';

  @override
  String get wellDone => 'Bien joué !';

  @override
  String wellDoneDistance(int distanceInKM) {

    return 'Bien joué ! Tu as enregistré une distance totale de $distanceInKM km';
  }

  @override
  String get distanceRegistered => 'Ta distance a été enregistrée. Continue ci-dessous si tu souhaites enregistrer une nouvelle distance.';

  @override
  String ranMore(int distanceInKM) {

    return 'J\'ai marché plus de $distanceInKM km';
  }

  @override
  String moreThan(int distanceInKM) {

    return 'Plus de $distanceInKM km';
  }

  @override
  String get runningEffort => 'Quel effort impressionnant ! Inscris le nombre de kilomètres parcourus ci-dessous.';

  @override
  String get slideSelect => 'Fais défiler le menu déroulant pour choisir la distance parcourue';

  @override
  String get submitAnotherDistance => 'Ajouter une autre distance';

  @override
  String get editPicture => 'Modifier l\'image';

  @override
  String get profilePicture => 'Photo de profil';

  @override
  String get firstPostTitle => 'Sois le premier à envoyer une photo ou un message';

  @override
  String timezoneInformation(String timeZone) {

    return 'Le calendrier du guide TV s\'affiche selon l\'heure locale : $timeZone';
  }

  @override
  String get yourQuestion => 'Ta question';

  @override
  String get uploadingInquirySuccess => 'Nous attirons l\'attention sur le fait que nous ne répondrons pas à toutes les questions posées pendant l\'émission.';

  @override
  String get askQuestion => 'Poser une question';

  @override
  String get submitQuestionInfo => 'En posant une question, tu acceptes qu\'elle soit utilisée dans le cadre de l\'émission.';

  @override
  String get posting => 'Envoyer';

  @override
  String get submitPostInfo => 'En postant un message ou une photo, tu acceptes son utilisation dans le cadre de l\'émission. ';

  @override
  String get cropImage => 'Recouper l\'image';

  @override
  String get square => 'Carré';

  @override
  String get landscape => 'Paysage';

  @override
  String get pollSingleChoice => 'Tu ne peux sélectionner qu\'une seule réponse à la fois.';

  @override
  String get pollMultipleChoice => 'Tu peux modifier ta réponse plusieurs fois.';

  @override
  String get pollEnded => 'Le sondage est clos. Merci pour tes réponses.';

  @override
  String get browserInstall => 'Merci d\'installer un navigateur Web pour pouvoir ouvrir cet URL.';

  @override
  String get share => 'Partager';

  @override
  String get liveNow => 'En direct maintenant';

  @override
  String get program => 'Programme';

  @override
  String get participateTab => 'Participer';

  @override
  String get tomorrow => 'Demain';

  @override
  String get readBy => 'Lu par';

  @override
  String pollAnswer(String answer) {

    return 'Tu as répondu : $answer';
  }

  @override
  String get broadcasts => 'Transmissions';

  @override
  String get quizAnswered => 'Réponses envoyées';

  @override
  String get quizNotEnabled => 'Le quiz n\'est pas disponible pour le moment. Merci de retenter plus tard.';

  @override
  String get calendar => 'Calendrier';

  @override
  String get noEvents => 'Aucune transmission prévue';

  @override
  String get appUpdateTitle => 'Mise à jour requise';

  @override
  String get appUpdateRequest => 'Merci de télécharger la dernière version de l\'application pour profiter des dernières fonctionnalités et éviter les bugs.';

  @override
  String get appUpdateAccepted => 'Mettre à jour';

  @override
  String get donationNotAvailable => 'Il n\'est pas possible de faire un don pour le moment. Merci de retenter plus tard.';

  @override
  String posts(int postsCount) {

    return '$postsCount Publications';
  }

  @override
  String get copy => 'Copier';

  @override
  String get reload => 'Recharger';

  @override
  String get participantsTitle => 'Qui répond ?';

  @override
  String get participantsSubtitle => 'Sélectionne un ou plusieurs participants.';

  @override
  String get yourFamily => 'Ta famille';

  @override
  String get yourTurn => 'Ton tour';

  @override
  String get fAQ => 'FAQ';

  @override
  String get shareStart => 'Partager depuis le début';

  @override
  String shareTime(String time) {

    return 'Partager à partir de $time';
  }

  @override
  String get loadContentError => 'Impossible de charger le contenu';

  @override
  String get audioOnlyErrorDescription => 'Vérifie ta connexion internet et retente à nouveau';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get tokenError => 'Nous n\'avons pas pu confirmer ton identité, probablement en raison d\'un problème de réseau. Certaines fonctionnalités de l\'application peuvent ne pas fonctionner correctement.';

  @override
  String get categoriesTab => 'Catégories';

  @override
  String get settingsTab => 'Paramètres';

  @override
  String get confirmLogin => 'Confirme la connexion';

  @override
  String get scanInfo => 'Scanne le code avec ton téléphone pour accéder à la page de connexion.';

  @override
  String get validInfo => 'Le QR code est valable 15 minutes.';

  @override
  String get confirmInfo => 'Après une connexion réussie sur ton appareil, clique sur le bouton ci-dessous pour confirmer ta connexion.';

  @override
  String get seriesTab => 'Séries';

  @override
  String get filmsTab => 'Films';

  @override
  String get eventsTab => 'Événements';

  @override
  String get audioLanguage => 'Langue audio';

  @override
  String get subtitlesLanguage => 'Langue des sous-titres';

  @override
  String get removeFromRecentSearches => 'Veux-tu supprimer cet élément des recherches récentes ?';

  @override
  String get noTransmissionToday => 'Aucune transmission prévue aujourd\'hui';

  @override
  String get livestreamMaintenanceTitle => 'La diffusion en direct n\'est pas disponible';

  @override
  String get start => 'Démarrer';

  @override
  String get transmissionSchedule => 'Horaires de transmission';

  @override
  String get featured => 'Recommandé';

  @override
  String get errorTryAgain => 'Une erreur est survenue, merci de réessayer plus tard.';

  @override
  String get reportProblem => 'En cas de problème, utilise le QR code ci-dessous pour nous envoyer un mail.';

  @override
  String get phoneReadingProblem => 'Si ton téléphone ne parvient pas à lire le QR code, envoie-nous un mail avec l\'information suivante à';

  @override
  String get goTo => 'ou va sur';

  @override
  String get watchBrunstad => 'Regarde BrunstadTV en direct';

  @override
  String get notLogged => 'Non connecté';

  @override
  String get authResponse0 => 'Merci d\'utiliser un nouveau QR code pour la connexion.';

  @override
  String get authResponse1 => 'Merci de te connecter sur ton portable en utilisant un QR code.';

  @override
  String get authResponse3 => 'Vérifie ta connexion internet et retente plus tard, merci.';

  @override
  String get liveHeader => 'En direct';

  @override
  String get recentlyPublishedSection => 'Publié récemment';

  @override
  String get exploreCategoriesSection => 'Explorer les catégories';

  @override
  String get programsSection => 'Programmes';

  @override
  String get episodesSection => 'Épisodes';

  @override
  String get categorySeries => 'Séries';

  @override
  String get categoryKids => 'Enfants';

  @override
  String get categoryFilms => 'Films';

  @override
  String get categoryEvents => 'Événements';

  @override
  String get categoryMusic => 'Musique';

  @override
  String get noPlannedEvents => 'Aucun événement prévu ce jour';

  @override
  String get watchNow => 'Regarder maintenant';

  @override
  String get exploreContent => 'Explorer le contenu';
}
