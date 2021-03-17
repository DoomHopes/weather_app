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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Daily`
  String get Daily {
    return Intl.message(
      'Daily',
      name: 'Daily',
      desc: '',
      args: [],
    );
  }

  /// `Hourly`
  String get Hourly {
    return Intl.message(
      'Hourly',
      name: 'Hourly',
      desc: '',
      args: [],
    );
  }

  /// `Daytime temperature `
  String get DaytimeTemperature {
    return Intl.message(
      'Daytime temperature ',
      name: 'DaytimeTemperature',
      desc: '',
      args: [],
    );
  }

  /// `Description `
  String get Description {
    return Intl.message(
      'Description ',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `During the day it feels like `
  String get DuringTheDayItFeelsLike {
    return Intl.message(
      'During the day it feels like ',
      name: 'DuringTheDayItFeelsLike',
      desc: '',
      args: [],
    );
  }

  /// `Temperature: `
  String get Temperature {
    return Intl.message(
      'Temperature: ',
      name: 'Temperature',
      desc: '',
      args: [],
    );
  }

  /// `Temperature at day: `
  String get TemperatureAtDay {
    return Intl.message(
      'Temperature at day: ',
      name: 'TemperatureAtDay',
      desc: '',
      args: [],
    );
  }

  /// `Temperature at night: `
  String get TemperatureAtNight {
    return Intl.message(
      'Temperature at night: ',
      name: 'TemperatureAtNight',
      desc: '',
      args: [],
    );
  }

  /// `Humidity: `
  String get Humidity {
    return Intl.message(
      'Humidity: ',
      name: 'Humidity',
      desc: '',
      args: [],
    );
  }

  /// `Wind speed: `
  String get WindSpeed {
    return Intl.message(
      'Wind speed: ',
      name: 'WindSpeed',
      desc: '',
      args: [],
    );
  }

  /// ` metre/sec`
  String get metreSec {
    return Intl.message(
      ' metre/sec',
      name: 'metreSec',
      desc: '',
      args: [],
    );
  }

  /// `Wind direction: `
  String get WindDirection {
    return Intl.message(
      'Wind direction: ',
      name: 'WindDirection',
      desc: '',
      args: [],
    );
  }

  /// `Probability of precipitation: `
  String get Probability {
    return Intl.message(
      'Probability of precipitation: ',
      name: 'Probability',
      desc: '',
      args: [],
    );
  }

  /// `Sunrise: `
  String get Sunrise {
    return Intl.message(
      'Sunrise: ',
      name: 'Sunrise',
      desc: '',
      args: [],
    );
  }

  /// `Sunset: `
  String get Sunset {
    return Intl.message(
      'Sunset: ',
      name: 'Sunset',
      desc: '',
      args: [],
    );
  }

  /// `Loading data ...`
  String get LoadData {
    return Intl.message(
      'Loading data ...',
      name: 'LoadData',
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
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}