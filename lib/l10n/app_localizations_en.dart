import 'app_localizations.dart';

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

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
  String get loading => 'Loading';

  @override
  String get loginPageDisplay1 => 'The most powerful message in the world';

  @override
  String get loginPageDisplay2 => 'Watch series, shows and films based on Christian values';

  @override
  String get loginPageDisplay3 => 'Produced by BCC Media';

  @override
  String get liveTab => 'Live';

  @override
  String get logOutButton => 'Log out';

  @override
  String get profileTab => 'Profile';

  @override
  String get faq => 'Frequently asked questions';

  @override
  String get bccMediaCenter => 'BrunstadTV is a non-commercial media center producing and distributing content based on positive and Christian values.';

  @override
  String get signInButton => 'Sign in';

  @override
  String get tryAgainButton => 'Try again';

  @override
  String get loggedOutTitle => 'Logged out';

  @override
  String get loggedOutMessage => 'You have been logged out. Please log in again.';

  @override
  String get mostWatched => 'Most watched';

  @override
  String get mostRecent => 'Most recent';

  @override
  String get latelyPublished => 'Lately published';

  @override
  String get anErrorOccurred => 'An error occurred';

  @override
  String get ok => 'OK';

  @override
  String get loginFailedCheckNetwork => 'Login failed. Check your network connection and try again.';

  @override
  String get loginFailedTryAgain => 'Login failed. Please try again later.';

  @override
  String get soundLanguage => 'Sound language';

  @override
  String get subtitleLanguage => 'Subtitle language';

  @override
  String get appLanguage => 'App language';

  @override
  String get checkNetwork => 'Check your network connection and try again.';

  @override
  String get tryAgain => 'Please try again later.';

  @override
  String get cantPlayVideo => 'You can\'t play this video now.';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get contactSupport => 'Contact support';

  @override
  String get cancel => 'Cancel';

  @override
  String get upNext => 'Up next';

  @override
  String get done => 'Done';

  @override
  String get playerSettings => 'Player settings';

  @override
  String get settings => 'Settings';

  @override
  String get none => 'None';

  @override
  String get auto => 'Auto';

  @override
  String get live => 'Live';

  @override
  String get subtitles => 'Subtitles';

  @override
  String get audio => 'Audio';

  @override
  String get quality => 'Quality';

  @override
  String get seasons => 'Seasons';

  @override
  String get episodes => 'Episodes';

  @override
  String get search => 'Search';

  @override
  String get noResults => 'No results found';

  @override
  String get doYouWantCast => 'Do you want to cast this video?';

  @override
  String get play => 'Play';

  @override
  String get castQueue => 'Cast queue';

  @override
  String get options => 'Options';

  @override
  String get remove => 'Remove';

  @override
  String get queueLimitTitle => 'Limit';

  @override
  String queueLimitMessage(int elementCount) {
    return 'You cannot have more than $elementCount elements in queue.';
  }

  @override
  String get recentSearches => 'Recent Searches';

  @override
  String get tVLogin => 'TV Login';

  @override
  String get tVLoginSuccessful => 'Log in successful, please confirm on TV.';

  @override
  String get seeMore => 'See more';

  @override
  String get seeAll => 'See all';

  @override
  String get series => 'Series';

  @override
  String get livestreamMaintenance => 'We\'re sorry, livestream is currently under maintenance. Please try again later.';

  @override
  String get homeTab => 'Home';

  @override
  String get sortBy => 'Sort by';

  @override
  String get videoQuality => 'Video quality';

  @override
  String get low => 'Low';

  @override
  String get medium => 'Medium';

  @override
  String get high => 'High';

  @override
  String get emptySearch => 'You can search all content from BrunstadTV. Series, videos and episodes.';

  @override
  String get back => 'Back';

  @override
  String get seasonLetter => 'S';

  @override
  String get episodeLetter => 'E';

  @override
  String get atoZ => 'A-Z';

  @override
  String get ztoA => 'Z-A';

  @override
  String get shortFilms => 'Short films';

  @override
  String get videos => 'Videos';

  @override
  String get moreInfo => 'More information';

  @override
  String get info => 'Information';

  @override
  String get episode => 'Episode';

  @override
  String get takePhoto => 'Take a photo';

  @override
  String get pickPhoto => 'Pick from gallery';

  @override
  String get uploadFileTitle => 'Upload file';

  @override
  String get uploadFileMessage => 'Do you want to upload this file?';

  @override
  String watchingWith(int numPeople) {
    return 'You are watching with $numPeople others';
  }

  @override
  String get uploading => 'Uploading';

  @override
  String get uploadFail => 'Upload failed';

  @override
  String get post => 'Post';

  @override
  String charactersLimit(int charsLeft, int charsTotal) {
    return '$charsLeft of $charsTotal characters left';
  }

  @override
  String get uploadingPostSuccess => 'Your post has been sent in.';

  @override
  String get testimonyInfo => 'Record your video with your phone.';

  @override
  String get yourVideo => 'Your video';

  @override
  String get record => 'Record';

  @override
  String get recordingTips => 'A few tips to get a good recording';

  @override
  String get recordingTipA => 'Find a quiet place to record.';

  @override
  String get recordingTipB => 'Make sure that your face is evenly lit.';

  @override
  String get recordingTipC => 'Think about what you want to say before you start recording.';

  @override
  String get recordingTipD => 'Turn your phone in landscape mode.';

  @override
  String get thankYou => 'Thank you!';

  @override
  String get thankYouForContribution => 'Thank you for your contribution!';

  @override
  String get uploadingVideoSuccess => 'Your video has been sent in.';

  @override
  String get next => 'Next';

  @override
  String get recordVideoCameraPermissionAlert => 'You have to grant camera permission in settings to record video.';

  @override
  String get recordVideoPhotosPermissionAlert => 'You have to grant photo album permission in settings to record video.';

  @override
  String get recordVideoStoragePermissionAlert => 'You have to grant storage permission in settings to record video.';

  @override
  String get recordVideoMicrophonePermissionAlert => 'You have to grant microphone permission in settings to record video.';

  @override
  String get takePhotoStoragePermissionAlert => 'You have to grant storage permission in settings to take photo.';

  @override
  String get takePhotoCameraPermissionAlert => 'You have to grant camera permission in settings to take photo.';

  @override
  String get pickPhotoStoragePermissionAlert => 'You have to grant storage permission in settings to pick photos.';

  @override
  String get permissionsAlertTitle => 'Permissions needed';

  @override
  String get add => 'Add';

  @override
  String get change => 'Change';

  @override
  String get recordingFailedTitle => 'Couldn\'t record the video';

  @override
  String get recordingFailedMessage => 'Something went wrong while trying to record the video.';

  @override
  String get pollSubtitle => 'Poll';

  @override
  String get writeHere => 'Write here';

  @override
  String get feed => 'Feed';

  @override
  String get atmosphereFeedDescription => 'Contribute in the activity feed by sending in a message, testimony or picture from where you are.';

  @override
  String get information => 'Information';

  @override
  String get photoNotSupported => 'Taking and picking photo are not supported on your device.';

  @override
  String get answerFailed => 'Sorry! We were unable to send the answer. Please, try again.';

  @override
  String get question => 'Question';

  @override
  String get notificationChannelPlayerName => 'Player';

  @override
  String get now => 'Now';

  @override
  String get createPost => 'Create post';

  @override
  String get concernTextPlaceholder => 'Describe the issue';

  @override
  String get debugInfoExplanation => 'Your message will include this information, to help us better understand the issue.';

  @override
  String get send => 'Send';

  @override
  String get sending => 'Sending';

  @override
  String get thankYouSupportTitle => 'Thank you for your feedback!';

  @override
  String get thankYouSupportDescription => 'We appreciate all feedback and we will address the issue as soon as possible.';

  @override
  String get sendFail => 'Couldn\'t send you message';

  @override
  String get sendFailDescription => 'Something went wrong. Check your internet connection and try again.';

  @override
  String get today => 'Today';

  @override
  String get noNewPosts => 'No new posts';

  @override
  String newPostsMultiple(int postCount) {
    return '$postCount new posts!';
  }

  @override
  String newPostsSingle(int postCount) {
    return '$postCount new post!';
  }

  @override
  String get expired => 'Expired';

  @override
  String availableFrom(String date) {
    return 'Available $date';
  }

  @override
  String get howFar => 'How far did you go?';

  @override
  String get submit => 'Submit';

  @override
  String get wellDone => 'Well done!';

  @override
  String wellDoneDistance(int distanceInKM) {
    return 'Well done! You have registered a total distance of $distanceInKM km';
  }

  @override
  String get distanceRegistered => 'Your distance has been registered. Continue below if you want to submit another distance.';

  @override
  String ranMore(int distanceInKM) {
    return 'I went more than $distanceInKM km';
  }

  @override
  String moreThan(int distanceInKM) {
    return 'More than $distanceInKM km';
  }

  @override
  String get runningEffort => 'Amazing effort! Type the amount of kilometers you went below.';

  @override
  String get slideSelect => 'Slide to select how far you went';

  @override
  String get submitAnotherDistance => 'Submit another distance';

  @override
  String get editPicture => 'Edit picture';

  @override
  String get profilePicture => 'Profile picture';

  @override
  String get firstPostTitle => 'Be the first to post a picture or message';

  @override
  String timezoneInformation(String timeZone) {
    return 'Tv guide timetable is in your local time: $timeZone';
  }

  @override
  String get yourQuestion => 'Your question';

  @override
  String get uploadingInquirySuccess => 'Please note that not all submitted questions are answered in the broadcast.';

  @override
  String get askQuestion => 'Ask a question';

  @override
  String get submitQuestionInfo => 'By submitting a question you accept that it can be used for broadcast purposes.';

  @override
  String get posting => 'Posting';

  @override
  String get submitPostInfo => 'By submitting a post or photo you accept that it can be used for broadcast purposes. ';

  @override
  String get cropImage => 'Crop image';

  @override
  String get square => 'Square';

  @override
  String get landscape => 'Landscape';

  @override
  String get pollSingleChoice => 'You may select your answer only once.';

  @override
  String get pollMultipleChoice => 'You may change your answer multiple times.';

  @override
  String get pollEnded => 'The poll section has ended. Thank you for your responses.';

  @override
  String get browserInstall => 'Please install web browser to be able to open this URL.';

  @override
  String get share => 'Share';

  @override
  String get liveNow => 'Live now';

  @override
  String get program => 'Program';

  @override
  String get participateTab => 'Participate';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get readBy => 'Read by';

  @override
  String pollAnswer(String answer) {
    return 'You\'ve answered: $answer';
  }

  @override
  String get broadcasts => 'Broadcasts';

  @override
  String get quizAnswered => 'Answers submitted';

  @override
  String get quizNotEnabled => 'Quiz is not available at the moment. Please try again later.';

  @override
  String get calendar => 'Calendar';

  @override
  String get noEvents => 'No scheduled transmissions';

  @override
  String get appUpdateTitle => 'Update required';

  @override
  String get appUpdateRequest => 'Please download the latest app to enjoy all the latest features and bug fixes.';

  @override
  String get appUpdateAccepted => 'Update';

  @override
  String get donationNotAvailable => 'Donation is not available at the moment. Please try again later.';

  @override
  String posts(int postsCount) {
    return '$postsCount Posts';
  }

  @override
  String get copy => 'Copy';

  @override
  String get reload => 'Reload';

  @override
  String get participantsTitle => 'Who is answering?';

  @override
  String get participantsSubtitle => 'Select one or more participants.';

  @override
  String get yourFamily => 'Your family';

  @override
  String get yourTurn => 'Your turn';

  @override
  String get fAQ => 'FAQ';

  @override
  String get shareStart => 'Share from start';

  @override
  String shareTime(String time) {
    return 'Share from time $time';
  }

  @override
  String get loadContentError => 'Couldn\'t load content';

  @override
  String get audioOnlyErrorDescription => 'Check internet connection and try again';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get tokenError => 'We couldn\'t confirm your identity, most likely due to a network problem. Some features of the app may not work correctly.';

  @override
  String get categoriesTab => 'Categories';

  @override
  String get settingsTab => 'Settings';

  @override
  String get confirmLogin => 'Confirm login';

  @override
  String get scanInfo => 'Scan code with your phone to enter login page.';

  @override
  String get validInfo => 'QR Code is valid for 15 minutes.';

  @override
  String get confirmInfo => 'After successful login on your device click button below to confirm your login.';

  @override
  String get seriesTab => 'Series';

  @override
  String get filmsTab => 'Films';

  @override
  String get eventsTab => 'Events';

  @override
  String get audioLanguage => 'Audio language';

  @override
  String get subtitlesLanguage => 'Subtitles language';

  @override
  String get removeFromRecentSearches => 'Do you want to remove this element from recent searches?';

  @override
  String get noTransmissionToday => 'No scheduled transmission for today';

  @override
  String get livestreamMaintenanceTitle => 'Live stream is not available';

  @override
  String get start => 'Start';

  @override
  String get transmissionSchedule => 'Transmission schedule';

  @override
  String get featured => 'Featured';

  @override
  String get errorTryAgain => 'Something went wrong, please try again later.';

  @override
  String get reportProblem => 'In case of any problems use QR code below to send us an email.';

  @override
  String get phoneReadingProblem => 'If your phone can\'t read QR code send us an email with following info to';

  @override
  String get goTo => 'or go to';

  @override
  String get watchBrunstad => 'Watch BrunstadTV live';

  @override
  String get notLogged => 'Not logged in';

  @override
  String get authResponse0 => 'Please use new QR code to log in.';

  @override
  String get authResponse1 => 'Please log in on your mobile using QR code.';

  @override
  String get authResponse3 => 'Check your network connection and please try again later.';

  @override
  String get liveHeader => 'Live';

  @override
  String get recentlyPublishedSection => 'Recently published';

  @override
  String get exploreCategoriesSection => 'Explore categories';

  @override
  String get programsSection => 'Programs';

  @override
  String get episodesSection => 'Episodes';

  @override
  String get categorySeries => 'Series';

  @override
  String get categoryKids => 'Kids';

  @override
  String get categoryFilms => 'Films';

  @override
  String get categoryEvents => 'Events';

  @override
  String get categoryMusic => 'Music';

  @override
  String get noPlannedEvents => 'No planned events today';

  @override
  String get watchNow => 'Watch now';
}
