import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('en'));
  }

  static const Map<String, String> _en = {
    'app_title': 'Mind Twist',
    'sub_title': 'Brain Puzzle & Trick Riddles',
    'play': 'PLAY',
    'levels': 'LEVELS',
    'daily_challenge': 'DAILY CHALLENGE',
    'stats': 'STATISTICS',
    'settings': 'SETTINGS',
    'shop': 'SHOP',
    'help': 'HELP & PRIVACY',
    'achievements': 'ACHIEVEMENTS',
    'random_practice': 'RANDOM PRACTICE',
    'level': 'Level',
    'category': 'Category',
    'hint': 'Hint',
    'hints': 'Hints',
    'coins': 'Coins',
    'reset': 'Reset',
    'skip': 'Skip',
    'submit': 'Submit',
    'continue_label': 'Continue',
    'option': 'Option',
    'wrong_answer': 'Oops! Not quite right. Think outside the box!',
    'try_again': 'Try Again',
    'get_hint': 'Get Hint',
    'congratulations': 'Brilliant Mind!',
    'level_cleared': 'Level Cleared!',
    'next_level': 'Next Level',
    'replay': 'Replay',
    'explanation': 'Why this works:',
    'sequence': 'Sequence',
    'drop_on': 'Drop on',
    'your_answer': 'Your answer',
    'memorize': 'Memorize this sequence',
    'repeat_sequence': 'Repeat the sequence',
    'time_left': 'Time left',
    'times_up': 'Time is up!',
    'watch_ad_hint': 'Watch Ad for Free Hint',
    'watch_ad_coins': 'Watch Ad for +30 Coins',
    'watch_ad_for_hint': 'Watch ad for a free hint',
    'watch_ad_for_hints': 'Watch ad for 2 hints',
    'buy_hints': 'Buy 3 Hints (50 Coins)',
    'buy_coins': 'Coin Shop',
    'remove_ads': 'Remove Ads',
    'ads_removed': 'Ads Removed',
    'language': 'Language',
    'sound_sfx': 'Sound Effects',
    'text_size': 'Text size',
    'export_progress': 'Export progress',
    'import_progress': 'Import progress',
    'progress_copied': 'Progress copied to clipboard',
    'paste_progress_hint': 'Paste your saved progress here',
    'progress_imported': 'Progress imported successfully',
    'invalid_progress': 'Invalid progress data',
    'privacy_policy': 'Privacy Policy',
    'privacy_text': 'Mind Twist values your privacy. No personal identifier data is gathered without consent. AdMob test ads are displayed for monetization.',
    'streak': 'Day Streak',
    'claimed': 'Claimed',
    'claim_reward': 'Claim Reward',
    'daily_reward': 'Daily Reward',
    'total_solved': 'Total Solved',
    'total_answers': 'Answers Given',
    'no_hint_clears': 'Levels Without Hints',
    'accuracy': 'Answer Accuracy',
    'stars_earned': 'Stars Earned',
    'free': 'FREE',
    'ad_unavailable':
        'The ad is unavailable right now. Please try again later.',
    'not_available': 'Not available yet',
    'puzzle_of_day': 'Puzzle of the day',
    'last_30_days': 'Last 30 days',
    'restore_purchases': 'Restore purchases',
    'purchase_note': 'Purchases are not configured in this build.',
    'how_to_play': 'How to play',
    'how_to_play_text':
        'Read each puzzle carefully and use the interaction shown on screen. '
        'Hints cost one hint from your inventory. Completing a level for the '
        'first time earns its coin reward and unlocks the next level. '
        'Previously completed levels can be replayed without earning the '
        'completion reward again.',
    'ads_note':
        'This build uses Google Mobile Ads test unit IDs. Ads are optional '
        'and failing to load does not block puzzle gameplay.',
    'not_enough_coins': 'Not enough coins',
    'unlocked': 'Unlocked',
    'locked': 'Locked',
    'ach_first_title': 'First Steps',
    'ach_first_desc': 'Clear your first level',
    'ach_10_title': 'Brain Warm-up',
    'ach_10_desc': 'Clear 10 levels',
    'ach_25_title': 'Halfway There',
    'ach_25_desc': 'Clear 25 levels',
    'ach_50_title': 'Mind Master',
    'ach_50_desc': 'Clear 50 levels',
    'ach_100_title': 'Legend',
    'ach_100_desc': 'Clear all 100 levels',
    'ach_stars_title': 'Star Collector',
    'ach_stars_desc': 'Earn 150 stars',
    'ach_nohint_title': 'Perfectionist',
    'ach_nohint_desc': 'Clear 10 levels without any hint',
    'ach_streak_title': 'Week Warrior',
    'ach_streak_desc': 'Reach a 7-day claim streak',
    'ach_coins_title': 'Coin Hoarder',
    'ach_coins_desc': 'Hold 500 coins at once',
  };

  static const Map<String, String> _hi = {
    'app_title': 'माइंड ट्विस्ट',
    'sub_title': 'दिमागी पहेलियां और ट्रिक्स',
    'play': 'खेलें',
    'levels': 'लेवल्स',
    'daily_challenge': 'दैनिक चुनौती',
    'stats': 'आंकड़े',
    'settings': 'सेटिंग्स',
    'shop': 'शॉप',
    'help': 'सहायता और गोपनीयता',
    'achievements': 'उपलब्धियाँ',
    'random_practice': 'रैंडम अभ्यास',
    'level': 'स्तर',
    'category': 'श्रेणी',
    'hint': 'संकेत',
    'hints': 'संकेत',
    'coins': 'सिक्के',
    'reset': 'रीसेट',
    'skip': 'छोड़ें',
    'submit': 'उत्तर दें',
    'continue_label': 'आगे बढ़ें',
    'option': 'विकल्प',
    'wrong_answer': 'अरे नहीं! थोड़ा हटकर सोचें!',
    'try_again': 'पुनः प्रयास करें',
    'get_hint': 'संकेत लें',
    'congratulations': 'शानदार दिमाग!',
    'level_cleared': 'स्तर पूरा हुआ!',
    'next_level': 'अगला स्तर',
    'replay': 'पुनः खेलें',
    'explanation': 'व्याख्या:',
    'sequence': 'क्रम',
    'drop_on': 'इस पर छोड़ें',
    'your_answer': 'आपका उत्तर',
    'memorize': 'यह क्रम याद करें',
    'repeat_sequence': 'क्रम दोहराएं',
    'time_left': 'बचा हुआ समय',
    'times_up': 'समय समाप्त!',
    'watch_ad_hint': 'मुफ्त संकेत के लिए विज्ञापन देखें',
    'watch_ad_coins': '३० सिक्कों के लिए विज्ञापन देखें',
    'watch_ad_for_hint': 'मुफ्त संकेत के लिए विज्ञापन देखें',
    'watch_ad_for_hints': '2 संकेतों के लिए विज्ञापन देखें',
    'buy_hints': '३ संकेत खरीदें (५० सिक्के)',
    'buy_coins': 'सिक्कों की दुकान',
    'remove_ads': 'विज्ञापन हटाएं',
    'ads_removed': 'विज्ञापन हटा दिए गए',
    'language': 'भाषा',
    'sound_sfx': 'ध्वनि प्रभाव',
    'text_size': 'टेक्स्ट का आकार',
    'export_progress': 'प्रगति निर्यात करें',
    'import_progress': 'प्रगति आयात करें',
    'progress_copied': 'प्रगति क्लिपबोर्ड पर कॉपी हो गई',
    'paste_progress_hint': 'यहाँ अपनी सहेजी गई प्रगति चिपकाएं',
    'progress_imported': 'प्रगति सफलतापूर्वक आयात हो गई',
    'invalid_progress': 'अमान्य प्रगति डेटा',
    'privacy_policy': 'गोपनीयता नीति',
    'privacy_text':
        'माइंड ट्विस्ट आपकी गोपनीयता का सम्मान करता है। बिना सहमति के कोई '
        'व्यक्तिगत पहचान डेटा एकत्र नहीं किया जाता है। मनोरंजन के लिए AdMob '
        'टेस्ट विज्ञापन दिखाए जाते हैं।',
    'streak': 'लगातार दिन',
    'claimed': 'दावा किया गया',
    'claim_reward': 'इनाम पाएं',
    'daily_reward': 'दैनिक इनाम',
    'total_solved': 'कुल हल किए गए',
    'total_answers': 'दिए गए उत्तर',
    'no_hint_clears': 'बिना संकेत पूरे किए स्तर',
    'accuracy': 'उत्तर सटीकता',
    'stars_earned': 'अर्जित तारे',
    'free': 'मुफ्त',
    'ad_unavailable': 'विज्ञापन अभी उपलब्ध नहीं है। कृपया बाद में प्रयास करें।',
    'not_available': 'अभी उपलब्ध नहीं',
    'puzzle_of_day': 'आज की पहेली',
    'last_30_days': 'पिछले 30 दिन',
    'restore_purchases': 'खरीदारी पुनर्स्थापित करें',
    'purchase_note': 'इस बिल्ड में खरीदारी सुविधा कॉन्फ़िगर नहीं है।',
    'how_to_play': 'खेलने का तरीका',
    'how_to_play_text':
        'हर पहेली ध्यान से पढ़ें और स्क्रीन पर दिए गए इंटरैक्शन का उपयोग करें। '
        'हर संकेत के लिए एक संकेत खर्च होता है। किसी स्तर को पहली बार पूरा '
        'करने पर सिक्के मिलते हैं और अगला स्तर खुल जाता है। पहले पूरे किए गए '
        'स्तर दोबारा खेले जा सकते हैं, पर इनाम दोबारा नहीं मिलता।',
    'ads_note':
        'यह बिल्ड Google Mobile Ads टेस्ट यूनिट आईडी का उपयोग करता है। '
        'विज्ञापन वैकल्पिक हैं और विज्ञापन न लोड होने पर खेल नहीं रुकता।',
    'not_enough_coins': 'पर्याप्त सिक्के नहीं हैं',
    'unlocked': 'खुल गई',
    'locked': 'बंद',
    'ach_first_title': 'पहला कदम',
    'ach_first_desc': 'अपना पहला स्तर पूरा करें',
    'ach_10_title': 'दिमाग की गर्माहट',
    'ach_10_desc': '10 स्तर पूरे करें',
    'ach_25_title': 'आधा सफर',
    'ach_25_desc': '25 स्तर पूरे करें',
    'ach_50_title': 'दिमाग के उस्ताद',
    'ach_50_desc': '50 स्तर पूरे करें',
    'ach_100_title': 'महान खिलाड़ी',
    'ach_100_desc': 'सभी 100 स्तर पूरे करें',
    'ach_stars_title': 'सितारा संग्राहक',
    'ach_stars_desc': '150 सितारे कमाएं',
    'ach_nohint_title': 'पूर्णतावादी',
    'ach_nohint_desc': 'बिना किसी संकेत के 10 स्तर पूरे करें',
    'ach_streak_title': 'सप्ताह योद्धा',
    'ach_streak_desc': '7 दिन की लगातार स्ट्रीक बनाएं',
    'ach_coins_title': 'सिक्का संग्राहक',
    'ach_coins_desc': 'एक साथ 500 सिक्के जमा करें',
  };

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': _en,
    'hi': _hi,
  };

  /// Available locales, exposed so tests can verify key parity.
  static const List<String> supportedLanguageCodes = ['en', 'hi'];

  static Map<String, String> valuesFor(String languageCode) =>
      _localizedValues[languageCode] ?? const <String, String>{};

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ??
        _localizedValues['en']?[key] ??
        key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.supportedLanguageCodes.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
