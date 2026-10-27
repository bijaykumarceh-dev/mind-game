import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_twist/core/localization/app_localizations.dart';

void main() {
  group('Localization tests', () {
    test('English and Hindi define exactly the same keys', () {
      final en = AppLocalizations.valuesFor('en').keys.toSet();
      final hi = AppLocalizations.valuesFor('hi').keys.toSet();

      final missingInHindi = en.difference(hi);
      final missingInEnglish = hi.difference(en);

      expect(
        missingInHindi,
        isEmpty,
        reason: 'Keys defined in English but missing in Hindi: $missingInHindi',
      );
      expect(
        missingInEnglish,
        isEmpty,
        reason:
            'Keys defined in Hindi but missing in English: $missingInEnglish',
      );
    });

    test('No translation value is empty', () {
      for (final code in AppLocalizations.supportedLanguageCodes) {
        AppLocalizations.valuesFor(code).forEach((key, value) {
          expect(
            value.trim(),
            isNotEmpty,
            reason: '$code key "$key" has an empty value',
          );
        });
      }
    });

    test('Every supported locale resolves well-known strings', () {
      for (final code in AppLocalizations.supportedLanguageCodes) {
        final text = AppLocalizations(Locale(code));
        for (final key in [
          'app_title',
          'play',
          'submit',
          'claim_reward',
          'how_to_play',
          'achievements',
          'random_practice',
          'export_progress',
        ]) {
          expect(
            text.translate(key),
            isNot(key),
            reason: '$code key "$key" was not translated',
          );
        }
      }
    });

    test('Unknown keys fall back to the key itself', () {
      final text = AppLocalizations(const Locale('hi'));
      expect(
        text.translate('definitely_missing_key'),
        'definitely_missing_key',
      );
    });
  });
}
