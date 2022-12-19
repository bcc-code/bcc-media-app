import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_it.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_tr.dart';

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('hu'),
    Locale('it'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sl'),
    Locale('tr')
  ];

  /// Text displayed when page content is loading.
  ///
  /// In en, this message translates to:
  /// **'Loading content'**
  String get loadingContent;

  /// Text for tooltip displayed when a non-member user opens the home page.
  ///
  /// In en, this message translates to:
  /// **'Sign in to watch more content'**
  String get signInTooltip;

  /// Text for button displayed on login screen to skip sign in and watch public content.
  ///
  /// In en, this message translates to:
  /// **'Skip to watch public content'**
  String get skipToPublicContent;

  /// Text for minutes.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get minutesShort;

  /// Text for This week.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get calendarThisWeek;

  /// Text week.
  ///
  /// In en, this message translates to:
  /// **'week'**
  String get calendarWeek;

  /// Text to indicate loading state.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// Text displayed on login screen.
  ///
  /// In en, this message translates to:
  /// **'The most powerful\n message in the world'**
  String get loginPageDisplay1;

  /// Text displayed on login screen.
  ///
  /// In en, this message translates to:
  /// **'Watch series, shows and films based on Christian values'**
  String get loginPageDisplay2;

  /// Text displayed on login screen.
  ///
  /// In en, this message translates to:
  /// **'Produced by BCC Media'**
  String get loginPageDisplay3;

  /// Title of live page tab
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get liveTab;

  /// Text displayed on Log out button
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOutButton;

  /// Title of the profile page
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTab;

  /// Title of the FAQ page.
  ///
  /// In en, this message translates to:
  /// **'Frequently asked questions'**
  String get faq;

  /// Disclaimer on login page
  ///
  /// In en, this message translates to:
  /// **'BrunstadTV is a non-commercial media center producing and distributing content based on positive and Christian values.'**
  String get bccMediaCenter;

  /// Text displayed on Sign in button
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInButton;

  /// Button on error alert that lets user to retry failed action
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgainButton;

  /// Title of the alert message that is shown when user is logged out automatically.
  ///
  /// In en, this message translates to:
  /// **'Logged out'**
  String get loggedOutTitle;

  /// Text of the alert message that is shown when user is logged out automatically.
  ///
  /// In en, this message translates to:
  /// **'You have been logged out. Please log in again.'**
  String get loggedOutMessage;

  /// Sorting option on audience page
  ///
  /// In en, this message translates to:
  /// **'Most watched'**
  String get mostWatched;

  /// Sorting option on audience page
  ///
  /// In en, this message translates to:
  /// **'Most recent'**
  String get mostRecent;

  /// Title for the list of videos on login page
  ///
  /// In en, this message translates to:
  /// **'Lately published'**
  String get latelyPublished;

  /// Title in error popup
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get anErrorOccurred;

  /// Popup confirmation button
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Login error message
  ///
  /// In en, this message translates to:
  /// **'Login failed. Check your network connection and try again.'**
  String get loginFailedCheckNetwork;

  /// Login error message
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please try again later.'**
  String get loginFailedTryAgain;

  /// Settings item on profile page
  ///
  /// In en, this message translates to:
  /// **'Sound language'**
  String get soundLanguage;

  /// Settings item on profile page
  ///
  /// In en, this message translates to:
  /// **'Subtitle language'**
  String get subtitleLanguage;

  /// Settings item on profile page
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get appLanguage;

  /// Error message for the user displayed in many contexts.
  ///
  /// In en, this message translates to:
  /// **'Check your network connection and try again.'**
  String get checkNetwork;

  /// Error message for the user displayed in many contexts.
  ///
  /// In en, this message translates to:
  /// **'Please try again later.'**
  String get tryAgain;

  /// Error message for the user displayed when video playback attempt failed.
  ///
  /// In en, this message translates to:
  /// **'You can\'t play this video now.'**
  String get cantPlayVideo;

  /// Title of About page and item in profile page settings.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Version ot the application on About page; followed by version number
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// Settings item on profile page
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get contactSupport;

  /// General cancel action button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Title on Up next feature.
  ///
  /// In en, this message translates to:
  /// **'Up next'**
  String get upNext;

  /// General Done button. User confirms that action completed sucessfully.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Title of the Player settings activity in Android
  ///
  /// In en, this message translates to:
  /// **'Player settings'**
  String get playerSettings;

  /// Label of the button to go to Android/iOS settings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Indicator on profile page that subtitles are disabled.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// Indicator on profile page that audio and app language are chosen automatically.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto;

  /// Title of the live stream
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get live;

  /// Title of the Player settings activity tab in Android
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get subtitles;

  /// Title of the Player settings activity tab in Android
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audio;

  /// Title of the Player settings activity tab in Android
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get quality;

  /// Followed by number of seasons in given series.
  ///
  /// In en, this message translates to:
  /// **'Seasons'**
  String get seasons;

  /// Followed by number of episodes in given series.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get episodes;

  /// Button to clear cache
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No search results.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResults;

  /// Prompt displayed to the user
  ///
  /// In en, this message translates to:
  /// **'Do you want to cast this video?'**
  String get doYouWantCast;

  /// Option in prompt dialog.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// Queue page title
  ///
  /// In en, this message translates to:
  /// **'Cast queue'**
  String get castQueue;

  /// Options dialog title
  ///
  /// In en, this message translates to:
  /// **'Options'**
  String get options;

  /// Option in options dialog
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// Title of the alert to the user when attempt to add video to cast queue failed due to full queue.
  ///
  /// In en, this message translates to:
  /// **'Limit'**
  String get queueLimitTitle;

  /// Error message to the user when attempt to add video to cast queue failed due to full queue.
  ///
  /// In en, this message translates to:
  /// **'You cannot have more than {elementCount} elements in queue.'**
  String queueLimitMessage(int elementCount);

  /// Recent searches list title.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get recentSearches;

  /// Title of the TV login alert
  ///
  /// In en, this message translates to:
  /// **'TV Login'**
  String get tVLogin;

  /// Message of the TV login alert
  ///
  /// In en, this message translates to:
  /// **'Log in successful, please confirm on TV.'**
  String get tVLoginSuccessful;

  /// Button on featured item to navigete to page with player
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get seeMore;

  /// Button on explore page to navigete to audience page
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// Title of the tab on info page
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get series;

  /// Message displayed over overlay when livestream is under maintenance.
  ///
  /// In en, this message translates to:
  /// **'We\'re sorry, livestream is currently under maintenance. Please try again later.'**
  String get livestreamMaintenance;

  /// Title of the home page
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTab;

  /// Sorting criteria selector
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get sortBy;

  /// Settings item in profile page for Android.
  ///
  /// In en, this message translates to:
  /// **'Video quality'**
  String get videoQuality;

  /// Low quality video option
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// Medium quality video option
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// High quality video option
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// Message on search page when there is no search results.
  ///
  /// In en, this message translates to:
  /// **'You can search all content from BrunstadTV. Series, videos and episodes.'**
  String get emptySearch;

  /// General back button to navigate back
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Season  letter in label S1E3
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get seasonLetter;

  /// Episode letter in label S1E3
  ///
  /// In en, this message translates to:
  /// **'E'**
  String get episodeLetter;

  /// Sort order
  ///
  /// In en, this message translates to:
  /// **'A-Z'**
  String get atoZ;

  /// Sort order
  ///
  /// In en, this message translates to:
  /// **'Z-A'**
  String get ztoA;

  /// Title of the films collection.
  ///
  /// In en, this message translates to:
  /// **'Short films'**
  String get shortFilms;

  /// Followed by number of videos
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// Option in action sheet for the video that triggers info page for the video.
  ///
  /// In en, this message translates to:
  /// **'More information'**
  String get moreInfo;

  /// Video info page title.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get info;

  /// Title of the tab on info page
  ///
  /// In en, this message translates to:
  /// **'Episode'**
  String get episode;

  /// Option in menu
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get takePhoto;

  /// Option in menu
  ///
  /// In en, this message translates to:
  /// **'Pick from gallery'**
  String get pickPhoto;

  /// Title of the dialog to confirm upload
  ///
  /// In en, this message translates to:
  /// **'Upload file'**
  String get uploadFileTitle;

  /// Content of the dialog to confirm upload
  ///
  /// In en, this message translates to:
  /// **'Do you want to upload this file?'**
  String get uploadFileMessage;

  /// Info on live stream page
  ///
  /// In en, this message translates to:
  /// **'You are watching with {numPeople} others'**
  String watchingWith(int numPeople);

  /// Message during file upload
  ///
  /// In en, this message translates to:
  /// **'Uploading'**
  String get uploading;

  /// Upload result message
  ///
  /// In en, this message translates to:
  /// **'Upload failed'**
  String get uploadFail;

  /// Button to post written testimony
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// Info about limit of characters in written testimony
  ///
  /// In en, this message translates to:
  /// **'{charsLeft} of {charsTotal} characters left'**
  String charactersLimit(int charsLeft, int charsTotal);

  /// Info in upload success page
  ///
  /// In en, this message translates to:
  /// **'Your post has been sent in.'**
  String get uploadingPostSuccess;

  /// Record testimony guideline page info
  ///
  /// In en, this message translates to:
  /// **'Record your video with your phone.'**
  String get testimonyInfo;

  /// Title on recording tip page page
  ///
  /// In en, this message translates to:
  /// **'Your video'**
  String get yourVideo;

  /// Button to record testimony
  ///
  /// In en, this message translates to:
  /// **'Record'**
  String get record;

  /// Record testimony guideline page tip list title
  ///
  /// In en, this message translates to:
  /// **'A few tips to get a good recording'**
  String get recordingTips;

  /// Record testimony guideline page tip list item
  ///
  /// In en, this message translates to:
  /// **'Find a quiet place to record.'**
  String get recordingTipA;

  /// Record testimony guideline page tip list item
  ///
  /// In en, this message translates to:
  /// **'Make sure that your face is evenly lit.'**
  String get recordingTipB;

  /// Record testimony guideline page tip list item
  ///
  /// In en, this message translates to:
  /// **'Think about what you want to say before you start recording.'**
  String get recordingTipC;

  /// Record testimony guideline page tip list item
  ///
  /// In en, this message translates to:
  /// **'Turn your phone in landscape mode.'**
  String get recordingTipD;

  /// Title in upload success page
  ///
  /// In en, this message translates to:
  /// **'Thank you!'**
  String get thankYou;

  /// Title in upload success page
  ///
  /// In en, this message translates to:
  /// **'Thank you for your contribution!'**
  String get thankYouForContribution;

  /// Info in upload success page
  ///
  /// In en, this message translates to:
  /// **'Your video has been sent in.'**
  String get uploadingVideoSuccess;

  /// NEXT program in check in section
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Message in alert dialog informing about missing permission
  ///
  /// In en, this message translates to:
  /// **'You have to grant camera permission in settings to record video.'**
  String get recordVideoCameraPermissionAlert;

  /// Message in alert dialog informing about missing permission
  ///
  /// In en, this message translates to:
  /// **'You have to grant photo album permission in settings to record video.'**
  String get recordVideoPhotosPermissionAlert;

  /// Message in alert dialog informing about missing permission
  ///
  /// In en, this message translates to:
  /// **'You have to grant storage permission in settings to record video.'**
  String get recordVideoStoragePermissionAlert;

  /// Message in alert dialog informing about missing permission
  ///
  /// In en, this message translates to:
  /// **'You have to grant microphone permission in settings to record video.'**
  String get recordVideoMicrophonePermissionAlert;

  /// Message in alert dialog informing about missing permission
  ///
  /// In en, this message translates to:
  /// **'You have to grant storage permission in settings to take photo.'**
  String get takePhotoStoragePermissionAlert;

  /// Message in alert dialog informing about missing permission
  ///
  /// In en, this message translates to:
  /// **'You have to grant camera permission in settings to take photo.'**
  String get takePhotoCameraPermissionAlert;

  /// Message in alert dialog informing about missing permission
  ///
  /// In en, this message translates to:
  /// **'You have to grant storage permission in settings to pick photos.'**
  String get pickPhotoStoragePermissionAlert;

  /// Title of an alert dialog informing about missing permission
  ///
  /// In en, this message translates to:
  /// **'Permissions needed'**
  String get permissionsAlertTitle;

  /// Button text on interactive live avatar section
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Button text on interactive live avatar section
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// Title in alert dialog when recording fails
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t record the video'**
  String get recordingFailedTitle;

  /// Message in alert dialog when recording fails
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while trying to record the video.'**
  String get recordingFailedMessage;

  /// The little title in poll
  ///
  /// In en, this message translates to:
  /// **'Poll'**
  String get pollSubtitle;

  /// New post text field placeholder
  ///
  /// In en, this message translates to:
  /// **'Write here'**
  String get writeHere;

  /// Feed page bar title
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get feed;

  /// Feed page description
  ///
  /// In en, this message translates to:
  /// **'Contribute in the activity feed by sending in a message, testimony or picture from where you are.'**
  String get atmosphereFeedDescription;

  /// Feed information item title
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// Alert displayed when phone can't take photo or pick photo from storage.
  ///
  /// In en, this message translates to:
  /// **'Taking and picking photo are not supported on your device.'**
  String get photoNotSupported;

  /// Message displayed when user's answer hasn't' been sent'.
  ///
  /// In en, this message translates to:
  /// **'Sorry! We were unable to send the answer. Please, try again.'**
  String get answerFailed;

  /// Title of the question page
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// Notification channel name in Android settings
  ///
  /// In en, this message translates to:
  /// **'Player'**
  String get notificationChannelPlayerName;

  /// Tv guide now playing label
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

  /// Button to start text testimony and title on create post page
  ///
  /// In en, this message translates to:
  /// **'Create post'**
  String get createPost;

  /// Placeholder text in text field on contact support page
  ///
  /// In en, this message translates to:
  /// **'Describe the issue'**
  String get concernTextPlaceholder;

  /// Info about debug info usage on contact support page
  ///
  /// In en, this message translates to:
  /// **'Your message will include this information, to help us better understand the issue.'**
  String get debugInfoExplanation;

  /// General button to send a form
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// General sending action indicator
  ///
  /// In en, this message translates to:
  /// **'Sending'**
  String get sending;

  /// Text on contact support confirmation page
  ///
  /// In en, this message translates to:
  /// **'Thank you for your feedback!'**
  String get thankYouSupportTitle;

  /// Text on contact support confirmation page
  ///
  /// In en, this message translates to:
  /// **'We appreciate all feedback and we will address the issue as soon as possible.'**
  String get thankYouSupportDescription;

  /// General error message that sending failed
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t send your message'**
  String get sendFail;

  /// General error message that sending failed
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Check your internet connection and try again.'**
  String get sendFailDescription;

  /// First category in tv guide
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Text displayed on the button, when there are no new posts in the feed.
  ///
  /// In en, this message translates to:
  /// **'No new posts'**
  String get noNewPosts;

  /// Text displayed on the button, when there are number of new posts in the feed.
  ///
  /// In en, this message translates to:
  /// **'{postCount} new posts!'**
  String newPostsMultiple(int postCount);

  /// Text displayed on the button, when there is one new post in the feed.
  ///
  /// In en, this message translates to:
  /// **'{postCount} new post!'**
  String newPostsSingle(int postCount);

  /// Info that episode is no longer available.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// Info that episode will be released at certain date.
  ///
  /// In en, this message translates to:
  /// **'Available {date}'**
  String availableFrom(String date);

  /// Text on running competition page.
  ///
  /// In en, this message translates to:
  /// **'How far did you go?'**
  String get howFar;

  /// Submit button on running competition page.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Text on running competition page.
  ///
  /// In en, this message translates to:
  /// **'Well done!'**
  String get wellDone;

  /// Text on running competition page.
  ///
  /// In en, this message translates to:
  /// **'Well done! You have registered a total distance of {distanceInKM} km'**
  String wellDoneDistance(int distanceInKM);

  /// Text on running competition page.
  ///
  /// In en, this message translates to:
  /// **'Your distance has been registered. Continue below if you want to submit another distance.'**
  String get distanceRegistered;

  /// Text on running competition page.
  ///
  /// In en, this message translates to:
  /// **'I went more than {distanceInKM} km'**
  String ranMore(int distanceInKM);

  /// Text on running competition page.
  ///
  /// In en, this message translates to:
  /// **'More than {distanceInKM} km'**
  String moreThan(int distanceInKM);

  /// Text on running competition page.
  ///
  /// In en, this message translates to:
  /// **'Amazing effort! Type the amount of kilometers you went below.'**
  String get runningEffort;

  /// Text on running competition page.
  ///
  /// In en, this message translates to:
  /// **'Slide to select how far you went'**
  String get slideSelect;

  /// Text on running competition page.
  ///
  /// In en, this message translates to:
  /// **'Submit another distance'**
  String get submitAnotherDistance;

  /// Button on profile page to edit profile picture.
  ///
  /// In en, this message translates to:
  /// **'Edit picture'**
  String get editPicture;

  /// Text on edit profile page.
  ///
  /// In en, this message translates to:
  /// **'Profile picture'**
  String get profilePicture;

  /// Text on feed page when feed is empty.
  ///
  /// In en, this message translates to:
  /// **'Be the first to post a picture or message'**
  String get firstPostTitle;

  /// TV guide footer info text.
  ///
  /// In en, this message translates to:
  /// **'Tv guide timetable is in your local time: {timeZone}'**
  String timezoneInformation(String timeZone);

  /// Title on ask question page
  ///
  /// In en, this message translates to:
  /// **'Your question'**
  String get yourQuestion;

  /// Info in upload question success page
  ///
  /// In en, this message translates to:
  /// **'Please note that not all submitted questions are answered in the broadcast.'**
  String get uploadingInquirySuccess;

  /// Ask question text field placeholder
  ///
  /// In en, this message translates to:
  /// **'Ask a question'**
  String get askQuestion;

  /// Disclaimer on ask question page
  ///
  /// In en, this message translates to:
  /// **'By submitting a question you accept that it can be used for broadcast purposes.'**
  String get submitQuestionInfo;

  /// Information about ongoing posting process
  ///
  /// In en, this message translates to:
  /// **'Posting'**
  String get posting;

  /// Disclaimer on text testimony page
  ///
  /// In en, this message translates to:
  /// **'By submitting a post or photo you accept that it can be used for broadcast purposes. '**
  String get submitPostInfo;

  /// Image crop page title
  ///
  /// In en, this message translates to:
  /// **'Crop image'**
  String get cropImage;

  /// Image crop mode
  ///
  /// In en, this message translates to:
  /// **'Square'**
  String get square;

  /// Image crop mode
  ///
  /// In en, this message translates to:
  /// **'Landscape'**
  String get landscape;

  /// Desciption of the poll type. States that user can change the answer only once.
  ///
  /// In en, this message translates to:
  /// **'You may select your answer only once.'**
  String get pollSingleChoice;

  /// Desciption of the poll type. States that user can change the answer multiple times.
  ///
  /// In en, this message translates to:
  /// **'You may change your answer multiple times.'**
  String get pollMultipleChoice;

  /// Message displayed when poll has been closed by administrator.
  ///
  /// In en, this message translates to:
  /// **'The poll section has ended. Thank you for your responses.'**
  String get pollEnded;

  /// Message displayed when browser couldn't be opened on user's device.
  ///
  /// In en, this message translates to:
  /// **'Please install web browser to be able to open this URL.'**
  String get browserInstall;

  /// Option name to share video.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// Call to action button on featured carousel.
  ///
  /// In en, this message translates to:
  /// **'Live now'**
  String get liveNow;

  /// Title of the program tab on live page.
  ///
  /// In en, this message translates to:
  /// **'Program'**
  String get program;

  /// Title of the participate tab on live page.
  ///
  /// In en, this message translates to:
  /// **'Participate'**
  String get participateTab;

  /// Day of transmission in tv guide.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// Feed verse pre author text.
  ///
  /// In en, this message translates to:
  /// **'Read by'**
  String get readBy;

  /// Snackbar label after user has chosen poll answer
  ///
  /// In en, this message translates to:
  /// **'You\'ve answered: {answer}'**
  String pollAnswer(String answer);

  /// Title for tv guide collection on event page.
  ///
  /// In en, this message translates to:
  /// **'Broadcasts'**
  String get broadcasts;

  /// Text displayed on a button when all answers in quiz have been submitted.
  ///
  /// In en, this message translates to:
  /// **'Answers submitted'**
  String get quizAnswered;

  /// Message on alert that appears when participate item is visible, but quiz is not enabled.
  ///
  /// In en, this message translates to:
  /// **'Quiz is not available at the moment. Please try again later.'**
  String get quizNotEnabled;

  /// Title of calendar page.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// Info in calendar page that no transmissions are scheduled for selected day.
  ///
  /// In en, this message translates to:
  /// **'No scheduled transmissions'**
  String get noEvents;

  /// Title of the message displayed to the user when application is too old and should be updated in a timely manner.
  ///
  /// In en, this message translates to:
  /// **'Update required'**
  String get appUpdateTitle;

  /// Message displayed to the user when application is too old and should be updated in a timely manner.
  ///
  /// In en, this message translates to:
  /// **'Please download the latest app to enjoy all the latest features and bug fixes.'**
  String get appUpdateRequest;

  /// Option that can be chosen by the user to update his application.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get appUpdateAccepted;

  /// Message displayed when donation flow failed.
  ///
  /// In en, this message translates to:
  /// **'Donation is not available at the moment. Please try again later.'**
  String get donationNotAvailable;

  /// Contributions to feed made by the users. Plural of post.
  ///
  /// In en, this message translates to:
  /// **'{postsCount} Posts'**
  String posts(int postsCount);

  /// Copy option for quotes, verses.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// Label on the button that allows to reload the player after error.
  ///
  /// In en, this message translates to:
  /// **'Reload'**
  String get reload;

  /// No description provided for @participantsTitle.
  ///
  /// In en, this message translates to:
  /// **'Who is answering?'**
  String get participantsTitle;

  /// Subtitle label on the participants list before quiz.
  ///
  /// In en, this message translates to:
  /// **'Select one or more participants.'**
  String get participantsSubtitle;

  /// Title on page when user selects family members that take part in the quiz.
  ///
  /// In en, this message translates to:
  /// **'Your family'**
  String get yourFamily;

  /// Title on page informing user that other user will answer question in the next step.
  ///
  /// In en, this message translates to:
  /// **'Your turn'**
  String get yourTurn;

  /// Title on FAQ page and item in profile page settings.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get fAQ;

  /// Option on action sheet for sharing from start
  ///
  /// In en, this message translates to:
  /// **'Share from start'**
  String get shareStart;

  /// Option on action sheet for sharing from time
  ///
  /// In en, this message translates to:
  /// **'Share from {time}'**
  String shareTime(String time);

  /// Error text when content couldn't be loaded.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load content'**
  String get loadContentError;

  /// Error message when audio only fails to play
  ///
  /// In en, this message translates to:
  /// **'Check internet connection and try again'**
  String get audioOnlyErrorDescription;

  /// Title on Privacy Policy page and item in profile page settings.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Message indicating that there is a problem with user's token, and some features may be broken because of this.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t confirm your identity, most likely due to a network problem. Some features of the app may not work correctly.'**
  String get tokenError;

  /// Title of the Categories Tab
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesTab;

  /// Title of the Settings Tab
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTab;

  /// Prompt that asks the user to confirm his log-in
  ///
  /// In en, this message translates to:
  /// **'Confirm login'**
  String get confirmLogin;

  /// Text that informs the user that the QR code can be scanned to enter the login page. Used on AppleTV.
  ///
  /// In en, this message translates to:
  /// **'Scan code with your phone to enter login page.'**
  String get scanInfo;

  /// Message that informs the user for how long the QR Code will be valid.
  ///
  /// In en, this message translates to:
  /// **'QR Code is valid for 15 minutes.'**
  String get validInfo;

  /// Message that asks the user to click the button in order to proceed after successful login.
  ///
  /// In en, this message translates to:
  /// **'After successful login on your device click button below to confirm your login.'**
  String get confirmInfo;

  /// Series Tab title
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get seriesTab;

  /// Films Tab title
  ///
  /// In en, this message translates to:
  /// **'Films'**
  String get filmsTab;

  /// Events Tab title
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get eventsTab;

  /// Label indicating that the Audio Language can be changed here.
  ///
  /// In en, this message translates to:
  /// **'Audio language'**
  String get audioLanguage;

  /// Label indicating that the Subtitles Language can be changed here.
  ///
  /// In en, this message translates to:
  /// **'Subtitles language'**
  String get subtitlesLanguage;

  /// Prompt that asks the user wheter they are certain, that they want to remove the element from recent searches.
  ///
  /// In en, this message translates to:
  /// **'Do you want to remove this element from recent searches?'**
  String get removeFromRecentSearches;

  /// Messages that informs the user, that there are no schedules transmission for today.
  ///
  /// In en, this message translates to:
  /// **'No scheduled transmission for today'**
  String get noTransmissionToday;

  /// Message that informs the user, that the livestream is unavailable.
  ///
  /// In en, this message translates to:
  /// **'Live stream is not available'**
  String get livestreamMaintenanceTitle;

  /// Word used while displaying information about the beggining of a video or an event in tv guide.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// Label that indicates the user is looking at Transmission schedule
  ///
  /// In en, this message translates to:
  /// **'Transmission schedule'**
  String get transmissionSchedule;

  /// Featured videos collection header
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// Message that informs the user, that there was an error. Then politely asks the user to try again later.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again later.'**
  String get errorTryAgain;

  /// Message indicating that whenever the user wants to report a problem, they can scan the QR code to send an email to support.
  ///
  /// In en, this message translates to:
  /// **'In case of any problems use QR code below to send us an email.'**
  String get reportProblem;

  /// Message explaining that if the user's phone can't scan the QR code, they can send the support e-mail with information listed after this message.
  ///
  /// In en, this message translates to:
  /// **'If your phone can\'t read QR code send us an email with following info to'**
  String get phoneReadingProblem;

  /// Message used to point the user to the shortened URL in case they can't use the QR code to log-in. This is used on AppleTV.
  ///
  /// In en, this message translates to:
  /// **'or go to'**
  String get goTo;

  /// Text that entices the user to watch the livestream.
  ///
  /// In en, this message translates to:
  /// **'Watch BrunstadTV live'**
  String get watchBrunstad;

  /// Text that informs the user, that they are not logged in.
  ///
  /// In en, this message translates to:
  /// **'Not logged in'**
  String get notLogged;

  /// Authentication response displayed to the user when an old QR code was used. Asking them to use a new one if they want to log in.
  ///
  /// In en, this message translates to:
  /// **'Please use new QR code to log in.'**
  String get authResponse0;

  /// Message displayed to the user when they tried to proceed with the log-in on AppleTv without first logging through their mobile device.
  ///
  /// In en, this message translates to:
  /// **'Please log in on your mobile using QR code.'**
  String get authResponse1;

  /// Message that indicates there was an error during Authentication process. Asking the user to check their network connection and try again.
  ///
  /// In en, this message translates to:
  /// **'Check your network connection and please try again later.'**
  String get authResponse3;

  /// Header of the Live Tab — the tab that contains the livestream player on AppleTV.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get liveHeader;

  /// Section in explore.
  ///
  /// In en, this message translates to:
  /// **'Recently published'**
  String get recentlyPublishedSection;

  /// Section in explore.
  ///
  /// In en, this message translates to:
  /// **'Explore categories'**
  String get exploreCategoriesSection;

  /// Section in explore.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get programsSection;

  /// Section in explore.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get episodesSection;

  /// Category name
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get categorySeries;

  /// Category name
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get categoryKids;

  /// Category name
  ///
  /// In en, this message translates to:
  /// **'Films'**
  String get categoryFilms;

  /// Category name
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get categoryEvents;

  /// Category name
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get categoryMusic;

  /// Information in tvguide
  ///
  /// In en, this message translates to:
  /// **'No events planned this day'**
  String get noPlannedEvents;

  /// Button on featured carousel
  ///
  /// In en, this message translates to:
  /// **'Watch now'**
  String get watchNow;

  /// A button on the login page
  ///
  /// In en, this message translates to:
  /// **'Explore content'**
  String get exploreContent;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fi', 'fr', 'hu', 'it', 'nb', 'nl', 'pl', 'pt', 'ro', 'ru', 'sl', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return SDe();
    case 'en': return SEn();
    case 'es': return SEs();
    case 'fi': return SFi();
    case 'fr': return SFr();
    case 'hu': return SHu();
    case 'it': return SIt();
    case 'nb': return SNb();
    case 'nl': return SNl();
    case 'pl': return SPl();
    case 'pt': return SPt();
    case 'ro': return SRo();
    case 'ru': return SRu();
    case 'sl': return SSl();
    case 'tr': return STr();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
