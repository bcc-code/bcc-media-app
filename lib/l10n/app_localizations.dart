import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bg.dart';
import 'app_localizations_da.dart';
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
import 'app_localizations_ta.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

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
  S(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bg'),
    Locale('da'),
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
    Locale('ta'),
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

  /// Text displayed on 'Close' button
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

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

  /// Text displayed on onboarding screen for the Bible Kids app.
  ///
  /// In en, this message translates to:
  /// **'We bring the message of the Bible to life!'**
  String get kidsOnboardingTitle;

  /// Text displayed on onboarding screen for the Bible Kids app.
  ///
  /// In en, this message translates to:
  /// **'Our vision is for the children to experience Jesus as their very best friend - for the rest of their lives.'**
  String get kidsOnboardingSecondaryTitle;

  /// Text displayed on login screen.
  ///
  /// In en, this message translates to:
  /// **'Produced by BCC Media'**
  String get loginPageDisplay3;

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

  /// Long title of the FAQ page.
  ///
  /// In en, this message translates to:
  /// **'Frequently asked questions'**
  String get faq;

  /// Disclaimer on login page
  ///
  /// In en, this message translates to:
  /// **'BCC Media is a media foundation in the BCC federation that produces and distributes content with positive and Christian values.'**
  String get bccMediaCenter;

  /// Text displayed on Sign in button
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInButton;

  /// Button to go to the onboarding page (short)
  ///
  /// In en, this message translates to:
  /// **'Sign up / Sign in'**
  String get signInOrSignUp;

  /// Button to start the sign up process
  ///
  /// In en, this message translates to:
  /// **'Sign up now'**
  String get signUpButton;

  /// Title on the sign up page
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUpTitle;

  /// A description on the sign up page explaining why you would want to sign up
  ///
  /// In en, this message translates to:
  /// **'Get access to more content and better features by creating an account.'**
  String get signUpDescription;

  /// REMEMBER: Keep the <a> and </a> tags, but translate the 'Privacy Policy' inside.
  ///
  /// In en, this message translates to:
  /// **'I certify that I am 13 years of age or older, and I agree to the <a>Privacy Policy</a> and <a>Terms of use</a>.'**
  String get signUpAgreePrivacyPolicy;

  /// Title for the 'Set password' page of the signup process.
  ///
  /// In en, this message translates to:
  /// **'Set password'**
  String get setPassword;

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

  /// Text for button which opens donation page.
  ///
  /// In en, this message translates to:
  /// **'Make a donation'**
  String get makeDonation;

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

  /// Open button
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

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

  /// Title for contact support page
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get contactSupport;

  /// Hint for the message box for logged in users
  ///
  /// In en, this message translates to:
  /// **'Describe the issue'**
  String get contactIssueHint;

  /// Title for contact us page
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;

  /// Device info page title
  ///
  /// In en, this message translates to:
  /// **'Device info'**
  String get deviceInfo;

  /// Text for checkbox to include device information
  ///
  /// In en, this message translates to:
  /// **'Include device information for better support.'**
  String get contactIncludeDeviceInfo;

  /// Text for link to see device data
  ///
  /// In en, this message translates to:
  /// **'Click to see data.'**
  String get contactSeeData;

  /// Label for name field in contact support page
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get contactName;

  /// Hint text for name field in contact support page
  ///
  /// In en, this message translates to:
  /// **'Type in your name'**
  String get contactNameHint;

  /// Label for email field in contact support page
  ///
  /// In en, this message translates to:
  /// **'Your contact email'**
  String get contactEmail;

  /// Hint text for name field in contact support page
  ///
  /// In en, this message translates to:
  /// **'Type in your email address'**
  String get contactEmailHint;

  /// Label for message field in contact support page
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get contactMessage;

  /// Hint text for message field in contact support page
  ///
  /// In en, this message translates to:
  /// **'Enter your message here'**
  String get contactMessageHint;

  /// Label for device
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get deviceInfoDevice;

  /// Label for environment override
  ///
  /// In en, this message translates to:
  /// **'Environment override'**
  String get deviceInfoEnvOverride;

  /// Label for manufacturer
  ///
  /// In en, this message translates to:
  /// **'Manufacturer'**
  String get deviceInfoManufacturer;

  /// Label for operating system
  ///
  /// In en, this message translates to:
  /// **'Operating System'**
  String get deviceInfoOs;

  /// Label for screen size
  ///
  /// In en, this message translates to:
  /// **'Screen Size'**
  String get deviceInfoScreenSize;

  /// Label for app Version
  ///
  /// In en, this message translates to:
  /// **'App Version'**
  String get deviceInfoAppVer;

  /// Label for user id
  ///
  /// In en, this message translates to:
  /// **'User ID'**
  String get deviceInfoUserId;

  /// Label for manufacturer
  ///
  /// In en, this message translates to:
  /// **'Your message will include this information, to help us provide better support.'**
  String get deviceInfoPageDesc;

  /// Settings item on profile page to navigate to uservoice
  ///
  /// In en, this message translates to:
  /// **'Suggest a feature'**
  String get userVoice;

  /// General cancel action button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Title text for cancel confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel?'**
  String get cancelConfirmation;

  /// Description for cancel confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Any unsaved changes will be lost.'**
  String get cancelConfirmationDescription;

  /// Text for back button.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// Confirm cancel.
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel'**
  String get yesCancel;

  /// Generic Done button, for example to dismiss a page after completing an action.
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

  /// Button indicating the next video will play soon.
  ///
  /// In en, this message translates to:
  /// **'Next Episode'**
  String get nextEpisode;

  /// Indicator on profile page that audio and app language are chosen automatically.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get auto;

  /// Generic.
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get subtitles;

  /// Generic.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audio;

  /// Generic.
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

  /// Button to submit feedback(Survey)
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get sendFeedback;

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

  /// A button to pause the video.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

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

  /// Button to see all of some collection.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// Title of the tab on info page
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get series;

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
  /// **'You can search all content from BCC Media. Series, videos and episodes.'**
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

  /// Info about limit of characters in a text field
  ///
  /// In en, this message translates to:
  /// **'{charsLeft} of {charsTotal} characters left'**
  String charactersLimit(int charsLeft, int charsTotal);

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

  /// NEXT program in check in section
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// Button text
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Button text
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

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

  /// Feed information item title
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// Title of the question page
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// Tv guide now playing label
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

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

  /// General message when sending is successful
  ///
  /// In en, this message translates to:
  /// **'We appreciate your feedback.'**
  String get sendSuccessDescription;

  /// First category in tv guide
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Label that something is no longer available.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// Info that episode will be released at certain date.
  ///
  /// In en, this message translates to:
  /// **'Available {date}'**
  String availableFrom(String date);

  /// Submit button.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Positive message that may be used e.g. after completing some action.
  ///
  /// In en, this message translates to:
  /// **'Well done!'**
  String get wellDone;

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

  /// TV guide footer info text.
  ///
  /// In en, this message translates to:
  /// **'Tv guide timetable is in your local time: {timeZone}'**
  String timezoneInformation(String timeZone);

  /// Generic.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// Text used on link to expand collapsed text.
  ///
  /// In en, this message translates to:
  /// **'Show more'**
  String get showMore;

  /// Text used on link to collapse expanded text.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get showLess;

  /// Generic, short. Used in buttons, badges, etc to indicate that an item is available soon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// Generic, short. Used in buttons, badges, etc to indicate that an item was recently published.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newEpisode;

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

  /// Title for live broadcasts.
  ///
  /// In en, this message translates to:
  /// **'Broadcasts'**
  String get broadcasts;

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

  /// Small 'copy' button to copy to clipboard for quotes, verses, and similar.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// Label on the button that allows to reload the player after error.
  ///
  /// In en, this message translates to:
  /// **'Reload'**
  String get reload;

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

  /// Title on Privacy Policy page and item in profile page settings.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Title on the 'Terms of use' page.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsOfUse;

  /// Title of the Categories Tab
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesTab;

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

  /// Section in search.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get programsSection;

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

  /// A button
  ///
  /// In en, this message translates to:
  /// **'Explore content'**
  String get exploreContent;

  /// A button on the welcome page
  ///
  /// In en, this message translates to:
  /// **'Explore public content'**
  String get explorePublicContent;

  /// A button on the welcome page
  ///
  /// In en, this message translates to:
  /// **'Start exploring'**
  String get startExploring;

  /// SINGULAR. Note the lowercase T, because its inserted after a count: '0/1 task completed'.
  ///
  /// In en, this message translates to:
  /// **'task completed'**
  String get taskCompleted;

  /// PLURAL. Note the lowercase T, because its inserted after the count: '2/5 tasks completed'.
  ///
  /// In en, this message translates to:
  /// **'tasks completed'**
  String get tasksCompleted;

  /// Description to open the study tasks for this episode. Currently shows below '0/1 tasks completed'.
  ///
  /// In en, this message translates to:
  /// **'Complete tasks and discover related resources'**
  String get studyCompleteTaskDescription;

  /// Generic button text.
  ///
  /// In en, this message translates to:
  /// **'Discover more'**
  String get discoverMore;

  /// Shown on a locked button, short explanation why the button is locked.
  ///
  /// In en, this message translates to:
  /// **'Complete previous tasks to unlock'**
  String get completePreviousTasks;

  /// Description to open the related resources for this episode.
  ///
  /// In en, this message translates to:
  /// **'Find more inspiration and insight from related resources'**
  String get studyDiscoverMoreDescription;

  /// Short button text to watch the video again.
  ///
  /// In en, this message translates to:
  /// **'Watch again'**
  String get watchAgain;

  /// SINGULAR. Button with text 'Continue to task in X'. Can click it to open tasks immediately, otherwise X will count down (10, 9, 8...) and automatically redirect you to the tasks.
  ///
  /// In en, this message translates to:
  /// **'Continue to task in'**
  String get continueToTaskIn;

  /// PLURAL. Button with text 'Continue to tasks in X'. Can click it to open tasks immediately, otherwise X will count down (10, 9, 8...) and automatically redirect you to the tasks.
  ///
  /// In en, this message translates to:
  /// **'Continue to tasks in'**
  String get continueToTasksIn;

  /// SINGULAR. Note the lowercase L, because prepended with a number: '1 lesson completed'.
  ///
  /// In en, this message translates to:
  /// **'lesson completed'**
  String get studyLessonCompleted;

  /// PLURAL. Note the lowercase L, because prepended with a number: '20 lessons completed'.
  ///
  /// In en, this message translates to:
  /// **'lessons completed'**
  String get studyLessonsCompleted;

  /// Button.
  ///
  /// In en, this message translates to:
  /// **'Continue study'**
  String get continueStudy;

  /// Button.
  ///
  /// In en, this message translates to:
  /// **'Start study'**
  String get startStudy;

  /// Shown after completing tasks related to a video.
  ///
  /// In en, this message translates to:
  /// **'Great job on completing the video.'**
  String get videoCompletedText;

  /// Description displayed in a popup when earning the first achievement badge.
  ///
  /// In en, this message translates to:
  /// **'Great job on completing the video and earning your first progress achievement.'**
  String get achievementFirstDescription;

  /// REMEMBER: Include, but do not translate variables like {name} here. Description displayed in a popup when done with a study topic.
  ///
  /// In en, this message translates to:
  /// **'Great job on completing the study topic {name}'**
  String achievementStudyTopic(String name);

  /// REMEMBER: Include, but do not translate variables like {count} here. Keep it very short. Generic, number of videos. Currently used for study topic overviews.
  ///
  /// In en, this message translates to:
  /// **'{count} videos'**
  String videoCount(int count);

  /// REMEMBER: Include, but do not translate variables like {count} here. Keep it very short. Generic, number of tasks. Currently used for study topic overviews.
  ///
  /// In en, this message translates to:
  /// **'{count} tasks'**
  String taskCount(int count);

  /// REMEMBER: Include, but do not translate variables like {count} here. Keep it very short. Generic, number of posters. Currently used for study topic overviews.
  ///
  /// In en, this message translates to:
  /// **'{count} posters'**
  String posterCount(int count);

  /// REMEMBER: Include, but do not translate variables like {count} here. Keep it very short. Generic, number of resources. Currently used for study topic overviews.
  ///
  /// In en, this message translates to:
  /// **'{count} resources'**
  String resourceCount(int count);

  /// Generic button text.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// Generic button text.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerButton;

  /// Generic. Used as page title, etc.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// REMINDER: Do NOT touch variables (like {n}). Password condition, shown when signing up.
  ///
  /// In en, this message translates to:
  /// **'Minimum {n} characters'**
  String passwordConditionLength(int n);

  /// Password condition, shown when signing up.
  ///
  /// In en, this message translates to:
  /// **'Must contain lower case, uppercase and numbers.'**
  String get passwordConditionComplexity;

  /// An informal title on some error screens.
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get oops;

  /// Error message when you open a link to content you dont have access to.
  ///
  /// In en, this message translates to:
  /// **'You do not have access to this content.'**
  String get dontHaveAccess;

  /// Error message when the requested content is not found.
  ///
  /// In en, this message translates to:
  /// **'The content you are looking for doesn\'t seem to exist.'**
  String get notFound;

  /// Error message when you open a link to content you dont have access to, and you are not logged in.
  ///
  /// In en, this message translates to:
  /// **'You need to be logged in to watch this content'**
  String get mustBeLoggedIn;

  /// Shown on an error page indiciating you dont have access to the content, right above a button that takes you back.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry, there\'s still plenty of content to enjoy!'**
  String get plentyOfOtherContent;

  /// A label indicating that this achievement has not been achieved yet.
  ///
  /// In en, this message translates to:
  /// **'Not achieved'**
  String get notAchieved;

  /// A tab name on the episode page which has some extra details about the episode: release date, age rating, etc.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// My list tab name
  ///
  /// In en, this message translates to:
  /// **'My list'**
  String get myList;

  /// Title for info displayed on 'My list' page.
  ///
  /// In en, this message translates to:
  /// **'Did you know?'**
  String get didYouKnowTitle;

  /// Content for info displayed on 'My list' page.
  ///
  /// In en, this message translates to:
  /// **'You can add your favorite shows to \"My List\" by tapping the heart.'**
  String get didYouKnowContent;

  /// A title prompting to select a season from the list.
  ///
  /// In en, this message translates to:
  /// **'Select season'**
  String get selectSeason;

  /// Button to request to delete your account
  ///
  /// In en, this message translates to:
  /// **'Delete my account'**
  String get deleteMyAccount;

  /// Text next to a switch/toggle button, confirming that you want to delete your account.
  ///
  /// In en, this message translates to:
  /// **'I am sure I want to delete my account and my data related to the BCC Media app.'**
  String get iAmSureIWantToDelete;

  /// Generic text. Used at least as a title on the account deletion page.
  ///
  /// In en, this message translates to:
  /// **'Are you sure?'**
  String get areYouSure;

  /// Sentence with contact info after (don't end with a space). Example usage: You can contact us at support@bcc.media.
  ///
  /// In en, this message translates to:
  /// **'You can contact us at'**
  String get youCanContactUsAt;

  /// Shown on about page
  ///
  /// In en, this message translates to:
  /// **'Bible Kids is an initiative by BCC Media, a media foundation within the BCC Federation that produces and distributes content with positive and Christian values.'**
  String get biblekidsAbout;

  /// Shown on the 'parental gate' for bible kids, where a parent needs to solve a puzzle to continue.
  ///
  /// In en, this message translates to:
  /// **'Ask your parents'**
  String get askYourParents;

  /// Shown on the 'parental gate'. Is followed by a math question, for example: 'What is 1 x 1?'
  ///
  /// In en, this message translates to:
  /// **'What is'**
  String get whatIsMath;

  /// Shown on the 'parental gate'. Hint label for the input field where you enter the answer to the puzzle or question.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get answerLabel;

  /// Shown on the 'parental gate'. Short label on the button to check if your answer to the puzzle/question is correct.
  ///
  /// In en, this message translates to:
  /// **'Check answer'**
  String get checkAnswerButton;

  /// Shown when sharing a video, to make it clear which video is public and which isn't.
  ///
  /// In en, this message translates to:
  /// **'This video is only accessible to users that are logged in to the app.'**
  String get videoOnlyAccessibleToLoggedIn;

  /// Title of the page where you can verify your email/account.
  ///
  /// In en, this message translates to:
  /// **'Verify your account'**
  String get verifyYourAccount;

  /// Shown on the verify account page, followed by the email address that the verification email was sent to.
  ///
  /// In en, this message translates to:
  /// **'We have sent an email to'**
  String get weHaveSentAnEmailTo;

  /// Shown on the verify account page.
  ///
  /// In en, this message translates to:
  /// **'Click the link in the email to verify your account.'**
  String get clickTheLinkToVerify;

  /// Shown on the verify account page. Button to open your email app.
  ///
  /// In en, this message translates to:
  /// **'Open email app'**
  String get openEmailApp;

  /// Shown on the verify account page. Button to resend the verification email.
  ///
  /// In en, this message translates to:
  /// **'Resend email'**
  String get resendEmail;

  /// Shown when you click a 'open email app' button. Description when no email apps are installed on the device.
  ///
  /// In en, this message translates to:
  /// **'No mail apps installed'**
  String get noMailAppsDescription;

  /// Shown when the user has requested a new verification email.
  ///
  /// In en, this message translates to:
  /// **'Verification email sent'**
  String get verificationEmailSent;

  /// Shown when the user has requested a new verification email.
  ///
  /// In en, this message translates to:
  /// **'If you still did not receive an email, please contact support at'**
  String get ifYouDidntReceiveVerificationEmail;

  /// Shown when the user has successfully created an account.
  ///
  /// In en, this message translates to:
  /// **'Account created'**
  String get accountCreated;

  /// Shown when the user has successfully completed account setup.
  ///
  /// In en, this message translates to:
  /// **'You can now use your account and explore a variety of edifying content.'**
  String get youCanNowUseYourAccount;

  /// Shown when the user has successfully completed account setup (a variant text when you need to log in first).
  ///
  /// In en, this message translates to:
  /// **'You can now log in to your account and explore a variety of edifying content.'**
  String get youCanNowLogInToYourAccount;

  /// Shown on the account deletion page.
  ///
  /// In en, this message translates to:
  /// **'You are about to request to delete your account with BCC Media and all your data related to this app.'**
  String get accountDeletionExplanation;

  /// Shown on the account deletion page.
  ///
  /// In en, this message translates to:
  /// **'This is an action that cannot be undone.'**
  String get accountDeletionWarning;

  /// Shown on the account deletion page. KEEP THE {x} IN YOUR SENTENCE AS IS! It will become a number, e.g. 7.
  ///
  /// In en, this message translates to:
  /// **'Account deletion will usually be done within {x} business days.'**
  String accountDeletionTimeframe(int x);

  /// Title of the account deletion page.
  ///
  /// In en, this message translates to:
  /// **'Delete my account'**
  String get accountDeletionTitle;

  /// KEEP THE {email} IN YOUR SENTENCE AS IS!! It becomes an email address. Description shown when the user has successfully requested to delete their account.
  ///
  /// In en, this message translates to:
  /// **'Account deletion successfully requested. You will receive an email at {email}. To confirm your identity, we need you reply to that email to proceed with the deletion.'**
  String accountDeletionSuccess(String email);

  /// Title of the games page
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get gamesTab;

  /// Title on a game
  ///
  /// In en, this message translates to:
  /// **'Play Game'**
  String get playGame;

  /// Title on the login screen for TVs
  ///
  /// In en, this message translates to:
  /// **'Scan the code and sign in with your phone'**
  String get tvScanQr;

  /// IMPORTANT: {url} and {code} will be automatically replaced with the url and code, so these must NOT be changed! Context: The login screen on TVs.
  ///
  /// In en, this message translates to:
  /// **'Or go to {url} and enter the code: {code}'**
  String tvEnterCode(String url, String code);

  /// A tab on the episode page. Video chapters, e.g. 'Tale - John Doe', etc.
  ///
  /// In en, this message translates to:
  /// **'Chapters'**
  String get chapters;

  /// Shown when holding on an episode in the 'continue watching' section.
  ///
  /// In en, this message translates to:
  /// **'Remove watch progress'**
  String get removeWatchProgress;

  /// IMPORTANT!! This is NOT 'show' as in 'display'. This is 'show' as in 'a TV show'!!
  ///
  /// In en, this message translates to:
  /// **'Show description'**
  String get showDescription;

  /// Release date of the episode, shown in the 'details' tab under an episode.
  ///
  /// In en, this message translates to:
  /// **'Release date'**
  String get releaseDate;

  /// The date which the episode will available to. Shown in the 'details' tab under an episode.
  ///
  /// In en, this message translates to:
  /// **'Available to'**
  String get availableTo;

  /// Age rating for the episode, shown in the 'details' tab under an episode.
  ///
  /// In en, this message translates to:
  /// **'Age rating'**
  String get ageRating;

  /// Used for age ratings! Short, means 'all ages'. Used like this: Age rating: All.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get ageRatingAll;

  /// Status indicator, indicating that you are offline; not connected to the internet.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// Button text, a button to download the episode to make it available for offline playback.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get downloadButton;

  /// IMPORTANT: {lang} will automatically be replaced with a language. You must include {lang} exactly as it is, but you can move it around in the sentence if needed.
  ///
  /// In en, this message translates to:
  /// **'Audio not available in {lang}'**
  String audioNotAvailableInLanguage(String lang);

  /// Shown when you try to download an episode, but there is not enough space on your device.
  ///
  /// In en, this message translates to:
  /// **'Not enough available space on your device'**
  String get notEnoughAvailableSpace;

  /// Shown when you try to download an episode, but there is not enough space on your device.
  ///
  /// In en, this message translates to:
  /// **'Consider deleting other videos you downloaded in the app.'**
  String get considerDeletingOtherVideos;

  /// IMPORTANT: {size} will automatically be replaced with the file size (e.g. 200 MB). You must include {size} exactly as it is, but you can move it around in the sentence if needed.
  ///
  /// In en, this message translates to:
  /// **'The video file size is {size}.'**
  String theVideoFileSizeIs(String size);

  /// A button to confirm that you have read some information. Synonymous to 'ok', 'understood', etc.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get gotIt;

  /// Shown in the 'favorites' box when you dont have any favorites saved yet.
  ///
  /// In en, this message translates to:
  /// **'Save your favorite videos'**
  String get saveYourFavorites;

  /// Shown in the 'favorites' box when you dont have any favorites saved yet.
  ///
  /// In en, this message translates to:
  /// **'Tap on the heart icon on a video to save it in your profile.'**
  String get saveYourFavoritesDescription;

  /// Shown as a title for the 'favorites' section in the profile tab.
  ///
  /// In en, this message translates to:
  /// **'Your favorites'**
  String get yourFavorites;

  /// Shown as a title for the 'downloaded' section in the profile tab.
  ///
  /// In en, this message translates to:
  /// **'Downloaded'**
  String get downloaded;

  /// Shown when the 'downloaded' section is empty.
  ///
  /// In en, this message translates to:
  /// **'Save videos for offline viewing'**
  String get saveVideosForOfflineViewing;

  /// Shown when the 'downloaded' section is empty.
  ///
  /// In en, this message translates to:
  /// **'Tap on the download icon on a video, to download and play while offline.'**
  String get tapOnTheDownloadIcon;

  /// Shown when holding on a downloaded video in the 'downloaded' section.
  ///
  /// In en, this message translates to:
  /// **'Remove offline video?'**
  String get removeOfflineVideo;

  /// Shown when holding on a downloaded video in the 'downloaded' section.
  ///
  /// In en, this message translates to:
  /// **'By removing this video it will no longer be available without a network connection.'**
  String get removeOfflineVideoDescription;

  /// Button text, to remove a downloaded video from the device.
  ///
  /// In en, this message translates to:
  /// **'Remove from device'**
  String get removeFromDeviceButton;

  /// Button when asking to remove a downloaded video. This button cancels.
  ///
  /// In en, this message translates to:
  /// **'Keep video'**
  String get keepVideoButton;

  /// Shown when you are offline, and the app cannot connect to the internet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetConnection;

  /// Shown when you are offline, and the app cannot connect to the internet.
  ///
  /// In en, this message translates to:
  /// **'Connect to the internet to access all videos.'**
  String get noInternetConnectionDescription;

  /// Shown when you are offline, but you have downloaded some videos. (There will be another sentence after this: 'Here are all the videos you have downloaded to your device.')
  ///
  /// In en, this message translates to:
  /// **'No internet connection,\nbut don\'t worry.'**
  String get noInternetButDontWorry;

  /// Shown when you are offline, but you have downloaded some videos.
  ///
  /// In en, this message translates to:
  /// **'Here are all the videos you have downloaded to your device.'**
  String get hereAreAllTheVideosYouDownloaded;

  /// Shown when you are offline, and the app cannot connect to the internet.
  ///
  /// In en, this message translates to:
  /// **'Connect to the internet to explore all videos.'**
  String get connectToExplore;

  /// A label when selecting a language to download.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// IMPORTANT: {size} will automatically be replaced with the file size (e.g. 200 MB). You must include {size} exactly as it is, but you can move it around in the sentence if needed.
  ///
  /// In en, this message translates to:
  /// **'Estimated file size: {size}'**
  String estimatedFileSize(String size);

  /// Title on the download video form.
  ///
  /// In en, this message translates to:
  /// **'Download video'**
  String get downloadVideo;

  /// Shown in the download form, indicating that there are no subtitles available for the video.
  ///
  /// In en, this message translates to:
  /// **'No subtitles'**
  String get noSubtitles;

  /// Shown in the download form, indicating that all subtitles are included in the video.
  ///
  /// In en, this message translates to:
  /// **'Subtitles included'**
  String get subtitlesIncluded;

  /// Shown in the download form, indicating that all subtitles will be available offline.
  ///
  /// In en, this message translates to:
  /// **'All subtitles will be available offline'**
  String get allSubtitlesWillBeAvailableOffline;

  /// Download status, indicating that the video is currently downloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading'**
  String get downloading;

  /// Generic status label. Used e.g. for downloads that failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// Generic status label. Used e.g. for downloads that finished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get finished;

  /// Generic status label. Used e.g. for downloads that are paused. Can also be used for paused videos.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get paused;

  /// Generic status label. Used e.g. for downloads that are queued. Can also be used for videos that are queued.
  ///
  /// In en, this message translates to:
  /// **'Queued'**
  String get queued;

  /// Generic status label. Used e.g. for downloads that are being deleted right now.
  ///
  /// In en, this message translates to:
  /// **'Removing'**
  String get removing;

  /// IMPORTANT: You must include {time} exactly as it is, but you can move it around in the sentence if needed. {time} will automatically be replaced with the time left (e.g. 1 day).
  ///
  /// In en, this message translates to:
  /// **'Expires in {time}'**
  String expiresIn(String time);

  /// Label indicating that the video is available offline.
  ///
  /// In en, this message translates to:
  /// **'Available offline'**
  String get availableOffline;

  /// Shown when errors occur, and you want to see more technical details about the error.
  ///
  /// In en, this message translates to:
  /// **'Technical details'**
  String get technicalDetails;

  /// Instead of seperate settings for audio and subtitle language, 'Content language' will be used for both audio and subtitles.
  ///
  /// In en, this message translates to:
  /// **'Content language'**
  String get contentLanguage;

  /// IMPORTANT: This is a short version of 'Content language'. Used on small screens.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get contentLanguageShort;

  /// IMPORTANT: This is a short version of 'App language'. Used on small screens.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get appLanguageShort;

  /// Keep it short. Button text in the top right of a show overview. Clicking it plays a random video.
  ///
  /// In en, this message translates to:
  /// **'Play random'**
  String get playRandom;

  /// Shown when you are selecting preferred content languages, and you want to add a language that is not in the list. Button and title.
  ///
  /// In en, this message translates to:
  /// **'Add language'**
  String get addLanguage;

  /// Shown when you are selecting preferred content languages. Title.
  ///
  /// In en, this message translates to:
  /// **'Preferred languages'**
  String get preferredLanguages;

  /// Shown when you are selecting preferred content languages.
  ///
  /// In en, this message translates to:
  /// **'Reorder the languages to match your preference for audio & subtitle language.'**
  String get contentLanguageExplanation;

  /// Languages that are available but in your list of preferred languages.
  ///
  /// In en, this message translates to:
  /// **'Other languages'**
  String get otherLanguages;

  /// Prompt. Shown at the top of a list of options.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// Shown on the settings page.
  ///
  /// In en, this message translates to:
  /// **'Support Bible Kids'**
  String get supportBibleKids;

  /// Shown on the settings page.
  ///
  /// In en, this message translates to:
  /// **'Donate via PayPal'**
  String get donateViaPaypal;

  /// Title of the 'shorts' tab. Shorts is a scrolling collection of short vertical videos. Similar to Youtube Shorts / Instagram Reels.
  ///
  /// In en, this message translates to:
  /// **'Shorts'**
  String get shortsTab;

  /// Shown as a label with a ✨ in front. On places where something is auto-generated in any way, e.g. transcriptions/subtitles/captions/excerpts.
  ///
  /// In en, this message translates to:
  /// **'Auto-generated'**
  String get autoGenerated;

  /// Disclaimer shown on the shorts page.
  ///
  /// In en, this message translates to:
  /// **'The transcriptions are auto-generated and might contain errors.'**
  String get shortsTranscriptionDisclaimer;

  /// 'Beta' features are only available to a selection of users.
  ///
  /// In en, this message translates to:
  /// **'Beta'**
  String get beta;

  /// Shown in a popup on beta features.
  ///
  /// In en, this message translates to:
  /// **'This feature is in beta and is currently not released to all users. Please report any issues or feedback via the \'Contact\' button in settings.'**
  String get betaExplanation;

  /// Title of the 'liked shorts' section. Shorts is a scrolling collection of short vertical videos. Similar to Youtube Shorts / Instagram Reels.
  ///
  /// In en, this message translates to:
  /// **'Liked shorts'**
  String get likedShorts;

  /// Shown in the 'liked shorts' box when you dont have any favorites saved yet.
  ///
  /// In en, this message translates to:
  /// **'Save your favorite shorts'**
  String get saveYourFavoriteShorts;

  /// Shown when you try to access a feature that is not available yet, e.g. because it is still in beta.
  ///
  /// In en, this message translates to:
  /// **'This feature is not available on your device yet. Please try again later.'**
  String get featureNotAvailableYet;

  /// Shown the first time you open the app after a new feature is available.
  ///
  /// In en, this message translates to:
  /// **'New feature'**
  String get newFeature;

  /// Shown the first time you open the app after 'shorts' is enabled.
  ///
  /// In en, this message translates to:
  /// **'Discover short and powerful excerpts, and jump right into its full episode.'**
  String get shortsFeatureDescription;

  /// Shown when you have liked and saved a 'short' for the first time.
  ///
  /// In en, this message translates to:
  /// **'Liked and saved'**
  String get likedAndSaved;

  /// Shown when you have liked and saved a 'short' for the first time.
  ///
  /// In en, this message translates to:
  /// **'You can find all your liked shorts in your profile.'**
  String get shortsLikedAndSavedDescription;

  /// Shown on a 'short' video, indicating that this is an excerpt from a longer video. E.g. Excerpt from 'The Tale of John Doe'.
  ///
  /// In en, this message translates to:
  /// **'Excerpt from'**
  String get excerptFrom;

  /// Shown when you have downloaded a video for the first time.
  ///
  /// In en, this message translates to:
  /// **'You can find your downloaded videos under \"Profile\".'**
  String get downloadedVideosGuideDescription;

  /// A button to open play store / app store.
  ///
  /// In en, this message translates to:
  /// **'Open store'**
  String get openStore;

  /// Shown when you try to download a video that cannot be downloaded.
  ///
  /// In en, this message translates to:
  /// **'This video can\'t be downloaded.'**
  String get thisVideoCantBeDownloaded;

  /// Changing the video language means changing the actual text inside the videos. E.g. for bible analysis videos.
  ///
  /// In en, this message translates to:
  /// **'Video language'**
  String get videoLanguage;

  /// Changing the video text language means changing the text that is shown inside the video. Same as 'video language'. i.e. not subtitles. E.g. for bible analysis videos.
  ///
  /// In en, this message translates to:
  /// **'Video text language'**
  String get videoTextLanguage;

  /// E.g. original language.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get original;

  /// Short text overlayed on the video when there are multiple 'text-in-video' languages available. I.e. not subtitles, but the actual text inside the video. For bible analysis videos.
  ///
  /// In en, this message translates to:
  /// **'Open settings to change the video text language'**
  String get openSettingsToChangeVideoLang;

  /// Generic error title/message.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// This is a short title on a tab that shows all items within a collection. I.e. no filter.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// IMPORTANT: {x} will automatically be replaced with a number. You must include {x} exactly as it is, but you can move it around in the sentence if needed.
  ///
  /// In en, this message translates to:
  /// **'{x} items'**
  String countItems(int x);

  /// IMPORTANT: {chapter} will automatically be replaced with the chapter name. You must include {chapter} exactly as it is, but you can move it around in the sentence if needed.
  ///
  /// In en, this message translates to:
  /// **'Skip to {chapter}'**
  String skipTo(String chapter);

  /// The title shown on the Bible Study widget.
  ///
  /// In en, this message translates to:
  /// **'Your Bible Study'**
  String get bmmBibleStudyTitle;

  /// The users total points in the Bible Study widget. It is shown underneath the title in the widget.
  ///
  /// In en, this message translates to:
  /// **'{points} points'**
  String bmmBibleStudyPoints(int points);

  /// Button text on the Bible Study quiz button.
  ///
  /// In en, this message translates to:
  /// **'Answer the quiz'**
  String get answerTheQuiz;

  /// Description shown on the Bible Study quiz button.
  ///
  /// In en, this message translates to:
  /// **'Earn points by answering correctly'**
  String get studyAnswerTheQuizDescription;

  /// Title shown on the Bible Study quiz button after quiz is done.
  ///
  /// In en, this message translates to:
  /// **'You got {correct} of {total} answers correct'**
  String studySomeAnswersCorrect(int correct, int total);

  /// Title shown on the Bible Study quiz button after quiz is done and all answers were correct.
  ///
  /// In en, this message translates to:
  /// **'You got all answers correct'**
  String get studyAllAnswersCorrect;

  /// Title shown on the Bible Study quiz button after quiz is done and no answers were correct.
  ///
  /// In en, this message translates to:
  /// **'You got no answers correct'**
  String get studyNoAnswersCorrect;

  /// Description shown on the Bible Study quiz button after quiz is done and all answers were correct.
  ///
  /// In en, this message translates to:
  /// **'Well done!'**
  String get studyAllAnswersCorrectDescription;

  /// Description shown on the Bible Study quiz button after quiz is done and no answers were correct.
  ///
  /// In en, this message translates to:
  /// **'Better listen a bit closer next time!'**
  String get studyNoAnswersCorrectDescription;

  /// Description shown on the Bible Study quiz button after quiz is done and some answers were correct.
  ///
  /// In en, this message translates to:
  /// **'Well done! But still room for improvement.'**
  String get studySomeAnswersCorrectDescription;

  /// Title shown on the Bible Study quiz button after all questions were answered, but we don't know if you got all answers correct.
  ///
  /// In en, this message translates to:
  /// **'You answered all questions'**
  String get studyAllQuestionsAnswered;

  /// Description shown on the Bible Study quiz button after all questions were answered, but we don't know if you got all answers correct.
  ///
  /// In en, this message translates to:
  /// **'Well done!'**
  String get studyAllQuestionsAnsweredDescription;

  /// Short button text on the notification reminder widget in the Bible Kids app.
  ///
  /// In en, this message translates to:
  /// **'Turn on'**
  String get kidsNotificationReminderCtaShort;

  /// Long button text on the notification reminder widget in the Bible Kids app.
  ///
  /// In en, this message translates to:
  /// **'Turn on reminders'**
  String get kidsNotificationReminderCtaLong;

  /// Title shown on the notification reminder widget in the Bible Kids app.
  ///
  /// In en, this message translates to:
  /// **'Watch a video every day!'**
  String get kidsNotificationReminderTitle;

  /// Shown alongside a toggle switch in the Bible Kids settings.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Shown alongside a toggle switch in settings.
  ///
  /// In en, this message translates to:
  /// **'Only show content with my preferred languages'**
  String get onlyShowContentWithPreferredLanguages;

  /// Title shown on the login button on the Bible Kids settings page.
  ///
  /// In en, this message translates to:
  /// **'Log in with your BCC account'**
  String get kidsLogInWithBCCTitle;

  /// Title shown on the login button on the Bible Kids settings page when the user is logged in.
  ///
  /// In en, this message translates to:
  /// **'Signed in with BCC'**
  String get kidsLoggedInWithBCCTitle;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'bg',
        'da',
        'de',
        'en',
        'es',
        'fi',
        'fr',
        'hu',
        'it',
        'nb',
        'nl',
        'pl',
        'pt',
        'ro',
        'ru',
        'sl',
        'ta',
        'tr'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bg':
      return SBg();
    case 'da':
      return SDa();
    case 'de':
      return SDe();
    case 'en':
      return SEn();
    case 'es':
      return SEs();
    case 'fi':
      return SFi();
    case 'fr':
      return SFr();
    case 'hu':
      return SHu();
    case 'it':
      return SIt();
    case 'nb':
      return SNb();
    case 'nl':
      return SNl();
    case 'pl':
      return SPl();
    case 'pt':
      return SPt();
    case 'ro':
      return SRo();
    case 'ru':
      return SRu();
    case 'sl':
      return SSl();
    case 'ta':
      return STa();
    case 'tr':
      return STr();
  }

  throw FlutterError(
      'S.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
