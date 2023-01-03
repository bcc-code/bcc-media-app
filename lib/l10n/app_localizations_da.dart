import 'app_localizations.dart';

/// The translations for Danish (`da`).
class SDa extends S {
  SDa([String locale = 'da']) : super(locale);

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
  String get loginPageDisplay1 => 'The most powerful\n message in the world';

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
  String get bccMediaCenter => 'BCC Media is a media foundation in the BCC federation that produces and distributes content with positive and Christian values.';

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
  String get emptySearch => 'You can search all content from BCC Media. Series, videos and episodes.';

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
  String get uploading => 'Uploading';

  @override
  String get uploadFail => 'Upload failed';

  @override
  String charactersLimit(int charsLeft, int charsTotal) {
    return '$charsLeft of $charsTotal characters left';
  }

  @override
  String get thankYou => 'Thank you!';

  @override
  String get thankYouForContribution => 'Thank you for your contribution!';

  @override
  String get next => 'Next';

  @override
  String get add => 'Add';

  @override
  String get change => 'Change';

  @override
  String get writeHere => 'Write here';

  @override
  String get feed => 'Feed';

  @override
  String get information => 'Information';

  @override
  String get question => 'Question';

  @override
  String get now => 'Now';

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
  String get sendFail => 'Couldn\'t send your message';

  @override
  String get sendFailDescription => 'Something went wrong. Check your internet connection and try again.';

  @override
  String get today => 'Today';

  @override
  String get expired => 'Expired';

  @override
  String availableFrom(String date) {
    return 'Available $date';
  }

  @override
  String get submit => 'Submit';

  @override
  String get wellDone => 'Well done!';

  @override
  String get editPicture => 'Edit picture';

  @override
  String get profilePicture => 'Profile picture';

  @override
  String timezoneInformation(String timeZone) {
    return 'Tv guide timetable is in your local time: $timeZone';
  }

  @override
  String get share => 'Share';

  @override
  String get liveNow => 'Live now';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get readBy => 'Read by';

  @override
  String get broadcasts => 'Broadcasts';

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
  String get copy => 'Copy';

  @override
  String get reload => 'Reload';

  @override
  String get fAQ => 'FAQ';

  @override
  String get shareStart => 'Share from start';

  @override
  String shareTime(String time) {
    return 'Share from $time';
  }

  @override
  String get loadContentError => 'Couldn\'t load content';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get categoriesTab => 'Categories';

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
  String get featured => 'Featured';

  @override
  String get errorTryAgain => 'Something went wrong, please try again later.';

  @override
  String get liveHeader => 'Live';

  @override
  String get programsSection => 'Programs';

  @override
  String get noPlannedEvents => 'No events planned this day';

  @override
  String get watchNow => 'Watch now';

  @override
  String get exploreContent => 'Explore content';
}
