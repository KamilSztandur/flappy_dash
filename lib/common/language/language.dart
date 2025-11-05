import 'package:flappy_dash/resources/assets.gen.dart';
import 'package:flutter/material.dart';

enum AppLanguage {
  polish('pl'),
  english('en_EN');

  const AppLanguage(this.countryCode);

  final String countryCode;

  Locale get locale => Locale(countryCode);

  SvgGenImage get flag => switch (this) {
    AppLanguage.polish => Assets.flags.pl,
    AppLanguage.english => Assets.flags.uk,
  };
}
