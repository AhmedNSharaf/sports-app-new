// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sports Category`
  String get categoryTitle {
    return Intl.message(
      'Sports Category',
      name: 'categoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `01017358350`
  String get drawerPhone {
    return Intl.message(
      '01017358350',
      name: 'drawerPhone',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load countries data`
  String get Failedtoloadcountriesdata {
    return Intl.message(
      'Failed to load countries data',
      name: 'Failedtoloadcountriesdata',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load leagues data`
  String get Failedtoloadleaguesdata {
    return Intl.message(
      'Failed to load leagues data',
      name: 'Failedtoloadleaguesdata',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load Teams data`
  String get Failedtoloadteamsdata {
    return Intl.message(
      'Failed to load Teams data',
      name: 'Failedtoloadteamsdata',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load players data`
  String get Failedtoloadplayersdata {
    return Intl.message(
      'Failed to load players data',
      name: 'Failedtoloadplayersdata',
      desc: '',
      args: [],
    );
  }

  /// `Countries`
  String get countriesTitle {
    return Intl.message(
      'Countries',
      name: 'countriesTitle',
      desc: '',
      args: [],
    );
  }

  /// `No countries available`
  String get NoCountriesAvailable {
    return Intl.message(
      'No countries available',
      name: 'NoCountriesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No leagues available`
  String get NoLeaguesAvailable {
    return Intl.message(
      'No leagues available',
      name: 'NoLeaguesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No players available`
  String get Noplayersavailable {
    return Intl.message(
      'No players available',
      name: 'Noplayersavailable',
      desc: '',
      args: [],
    );
  }

  /// `No Teams available`
  String get Noteamsavailable {
    return Intl.message(
      'No Teams available',
      name: 'Noteamsavailable',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get dialogTitle {
    return Intl.message(
      'Coming Soon',
      name: 'dialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Palestine leagues are coming soon.`
  String get palestineDialogContent {
    return Intl.message(
      'Palestine leagues are coming soon.',
      name: 'palestineDialogContent',
      desc: '',
      args: [],
    );
  }

  /// `This feature is coming soon.`
  String get dialogContent {
    return Intl.message(
      'This feature is coming soon.',
      name: 'dialogContent',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get dialogAction {
    return Intl.message(
      'OK',
      name: 'dialogAction',
      desc: '',
      args: [],
    );
  }

  /// `Free\nPalestine`
  String get palestineCardContent {
    return Intl.message(
      'Free\nPalestine',
      name: 'palestineCardContent',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeTab {
    return Intl.message(
      'Home',
      name: 'homeTab',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get myAccountTap {
    return Intl.message(
      'My Account',
      name: 'myAccountTap',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebookName {
    return Intl.message(
      'Facebook',
      name: 'facebookName',
      desc: '',
      args: [],
    );
  }

  /// `Youtube`
  String get youtubeName {
    return Intl.message(
      'Youtube',
      name: 'youtubeName',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get instagramName {
    return Intl.message(
      'Instagram',
      name: 'instagramName',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get whatsAppName {
    return Intl.message(
      'WhatsApp',
      name: 'whatsAppName',
      desc: '',
      args: [],
    );
  }

  /// `X`
  String get XName {
    return Intl.message(
      'X',
      name: 'XName',
      desc: '',
      args: [],
    );
  }

  /// `Telegram`
  String get TelegramName {
    return Intl.message(
      'Telegram',
      name: 'TelegramName',
      desc: '',
      args: [],
    );
  }

  /// `Share App`
  String get ShareAppName {
    return Intl.message(
      'Share App',
      name: 'ShareAppName',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get ContactUsName {
    return Intl.message(
      'Contact Us',
      name: 'ContactUsName',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Polici`
  String get PrivacyPoliciName {
    return Intl.message(
      'Privacy Polici',
      name: 'PrivacyPoliciName',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get SettingsName {
    return Intl.message(
      'Settings',
      name: 'SettingsName',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get LogOutName {
    return Intl.message(
      'Log Out',
      name: 'LogOutName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Phone {
    return Intl.message(
      'Phone',
      name: 'Phone',
      desc: '',
      args: [],
    );
  }

  /// `Foot Ball`
  String get FootBall {
    return Intl.message(
      'Foot Ball',
      name: 'FootBall',
      desc: '',
      args: [],
    );
  }

  /// `Volley Ball`
  String get VolleyBall {
    return Intl.message(
      'Volley Ball',
      name: 'VolleyBall',
      desc: '',
      args: [],
    );
  }

  /// `Basket Ball`
  String get BasketBall {
    return Intl.message(
      'Basket Ball',
      name: 'BasketBall',
      desc: '',
      args: [],
    );
  }

  /// `Hand Ball`
  String get HandBall {
    return Intl.message(
      'Hand Ball',
      name: 'HandBall',
      desc: '',
      args: [],
    );
  }

  /// `League Details`
  String get LeagueDetails {
    return Intl.message(
      'League Details',
      name: 'LeagueDetails',
      desc: '',
      args: [],
    );
  }

  /// `Leagues`
  String get Leagues {
    return Intl.message(
      'Leagues',
      name: 'Leagues',
      desc: '',
      args: [],
    );
  }

  /// `Teams`
  String get Teams {
    return Intl.message(
      'Teams',
      name: 'Teams',
      desc: '',
      args: [],
    );
  }

  /// `Top Scorers`
  String get TopScorers {
    return Intl.message(
      'Top Scorers',
      name: 'TopScorers',
      desc: '',
      args: [],
    );
  }

  /// `Search for a team`
  String get Searchforateam {
    return Intl.message(
      'Search for a team',
      name: 'Searchforateam',
      desc: '',
      args: [],
    );
  }

  /// `Search for a player`
  String get Searchforaplayer {
    return Intl.message(
      'Search for a player',
      name: 'Searchforaplayer',
      desc: '',
      args: [],
    );
  }

  /// `Players`
  String get players {
    return Intl.message(
      'Players',
      name: 'players',
      desc: '',
      args: [],
    );
  }

  /// `Players Number`
  String get playerNumber {
    return Intl.message(
      'Players Number',
      name: 'playerNumber',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get PlayerCountry {
    return Intl.message(
      'Country',
      name: 'PlayerCountry',
      desc: '',
      args: [],
    );
  }

  /// `Position`
  String get PlayerPosition {
    return Intl.message(
      'Position',
      name: 'PlayerPosition',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get PlayerAge {
    return Intl.message(
      'Age',
      name: 'PlayerAge',
      desc: '',
      args: [],
    );
  }

  /// `Yellow Cards`
  String get YellowCards {
    return Intl.message(
      'Yellow Cards',
      name: 'YellowCards',
      desc: '',
      args: [],
    );
  }

  /// `Red Cards`
  String get RedCards {
    return Intl.message(
      'Red Cards',
      name: 'RedCards',
      desc: '',
      args: [],
    );
  }

  /// `Goals`
  String get Goals {
    return Intl.message(
      'Goals',
      name: 'Goals',
      desc: '',
      args: [],
    );
  }

  /// `Assists`
  String get Assists {
    return Intl.message(
      'Assists',
      name: 'Assists',
      desc: '',
      args: [],
    );
  }

  /// `Player Name`
  String get PlayerName {
    return Intl.message(
      'Player Name',
      name: 'PlayerName',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get Share {
    return Intl.message(
      'Share',
      name: 'Share',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get Close {
    return Intl.message(
      'Close',
      name: 'Close',
      desc: '',
      args: [],
    );
  }

  /// `Welcom`
  String get notificationTitle {
    return Intl.message(
      'Welcom',
      name: 'notificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcom`
  String get welcom {
    return Intl.message(
      'Welcom',
      name: 'welcom',
      desc: '',
      args: [],
    );
  }

  /// `Hello Everybody!`
  String get notificationContent {
    return Intl.message(
      'Hello Everybody!',
      name: 'notificationContent',
      desc: '',
      args: [],
    );
  }

  /// `Sports App`
  String get SplashTitle {
    return Intl.message(
      'Sports App',
      name: 'SplashTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Sports App`
  String get OnBoardingTitle1 {
    return Intl.message(
      'Welcome to Sports App',
      name: 'OnBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Live Scores`
  String get OnBoardingTitle2 {
    return Intl.message(
      'Live Scores',
      name: 'OnBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Latest News`
  String get OnBoardingTitle3 {
    return Intl.message(
      'Latest News',
      name: 'OnBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Track your favorite sports and teams.`
  String get OnBoardingbody1 {
    return Intl.message(
      'Track your favorite sports and teams.',
      name: 'OnBoardingbody1',
      desc: '',
      args: [],
    );
  }

  /// `Get live updates and scores from ongoing matches.`
  String get OnBoardingbody2 {
    return Intl.message(
      'Get live updates and scores from ongoing matches.',
      name: 'OnBoardingbody2',
      desc: '',
      args: [],
    );
  }

  /// `Stay updated with the latest sports news.`
  String get OnBoardingbody3 {
    return Intl.message(
      'Stay updated with the latest sports news.',
      name: 'OnBoardingbody3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get OTP {
    return Intl.message(
      'OTP',
      name: 'OTP',
      desc: '',
      args: [],
    );
  }

  /// `Verify OTP`
  String get VerifyOTP {
    return Intl.message(
      'Verify OTP',
      name: 'VerifyOTP',
      desc: '',
      args: [],
    );
  }

  /// `Generate OTP`
  String get GenerateOTP {
    return Intl.message(
      'Generate OTP',
      name: 'GenerateOTP',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get LoginwithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'LoginwithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get Donthavanaccount {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'Donthavanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Have an account ?`
  String get Havanaccount {
    return Intl.message(
      'Have an account ?',
      name: 'Havanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `Your OTP`
  String get YourOTP {
    return Intl.message(
      'Your OTP',
      name: 'YourOTP',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get Error {
    return Intl.message(
      'Error',
      name: 'Error',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP`
  String get InvalidOTP {
    return Intl.message(
      'Invalid OTP',
      name: 'InvalidOTP',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Signout`
  String get Signout {
    return Intl.message(
      'Signout',
      name: 'Signout',
      desc: '',
      args: [],
    );
  }

  /// `Signin`
  String get Signin {
    return Intl.message(
      'Signin',
      name: 'Signin',
      desc: '',
      args: [],
    );
  }

  /// `Signinwithgoogle`
  String get Signinwithgoogle {
    return Intl.message(
      'Signinwithgoogle',
      name: 'Signinwithgoogle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
