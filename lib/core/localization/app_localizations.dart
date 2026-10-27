import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('en'));
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'app_title': 'Mind Twist',
      'sub_title': 'Brain Puzzle & Trick Riddles',
      'play': 'PLAY',
      'levels': 'LEVELS',
      'daily_challenge': 'DAILY CHALLENGE',
      'stats': 'STATISTICS',
      'settings': 'SETTINGS',
      'shop': 'SHOP',
      'help': 'HELP & PRIVACY',
      'level': 'Level',
      'category': 'Category',
      'hint': 'Hint',
      'hints': 'Hints',
      'coins': 'Coins',
      'reset': 'Reset',
      'skip': 'Skip',
      'submit': 'Submit',
      'wrong_answer': 'Oops! Not quite right. Think outside the box!',
      'try_again': 'Try Again',
      'get_hint': 'Get Hint',
      'congratulations': 'Brilliant Mind!',
      'level_cleared': 'Level Cleared!',
      'next_level': 'Next Level',
      'replay': 'Replay',
      'explanation': 'Why this works:',
      'watch_ad_hint': 'Watch Ad for Free Hint',
      'watch_ad_coins': 'Watch Ad for +30 Coins',
      'buy_hints': 'Buy 3 Hints (50 Coins)',
      'buy_coins': 'Coin Shop',
      'remove_ads': 'Remove Ads',
      'ads_removed': 'Ads Removed',
      'language': 'Language',
      'sound_sfx': 'Sound Effects',
      'privacy_policy': 'Privacy Policy',
      'privacy_text':
          'Mind Twist values your privacy. No personal identifier data is gathered without consent. AdMob test ads are displayed for monetization.',
      'streak': 'Day Streak',
      'claimed': 'Claimed',
      'daily_reward': 'Daily Reward',
      'total_solved': 'Total Solved',
      'accuracy': 'Accuracy',
      'stars_earned': 'Stars Earned',
      'free': 'FREE',
      'ad_unavailable': 'The ad is unavailable right now. Please try again later.',
      'not_available': 'Not available yet',
      'puzzle_of_day': 'Puzzle of the day',
      'restore_purchases': 'Restore purchases',
      'purchase_note': 'Purchases are not configured in this build.',
    },
    'hi': {
      'app_title': 'माइंड ट्विस्ट',
      'sub_title': 'दिमागी पहेलियां और ट्रिक्स',
      'play': 'खेलें',
      'levels': 'स्तर (लेवल्स)',
      'daily_challenge': 'दैनिक चुनौती',
      'stats': 'आंकड़े (आंकड़े)',
      'settings': 'सेटिंग्स',
      'shop': 'दुकान (शॉप)',
      'help': 'सहायता और गोपनीयता',
      'level': 'स्तर',
      'category': 'श्रेणी',
      'hint': 'संकेत (हिंट)',
      'hints': 'संकेत',
      'coins': 'सिक्के',
      'reset': 'रीसेट',
      'skip': 'छोड़ें (स्किप)',
      'submit': 'उत्तर दें',
      'wrong_answer': 'अरे नहीं! थोड़ा हटकर सोचें!',
      'try_again': 'पुनः प्रयास करें',
      'get_hint': 'संकेत लें',
      'congratulations': 'शानदार दिमाग!',
      'level_cleared': 'स्तर पूरा हुआ!',
      'next_level': 'अगला स्तर',
      'replay': 'पुनः खेलें',
      'explanation': 'व्याख्या:',
      'watch_ad_hint': 'मुफ्त संकेत के लिए विज्ञापन देखें',
      'watch_ad_coins': '३० सिक्कों के लिए विज्ञापन देखें',
      'buy_hints': '३ संकेत खरीदें (५० सिक्के)',
      'buy_coins': 'सिक्कों की दुकान',
      'remove_ads': 'विज्ञापन हटाएं',
      'ads_removed': 'विज्ञापन हटा दिए गए',
      'language': 'भाषा',
      'sound_sfx': 'ध्वनि प्रभाव',
      'privacy_policy': 'गोपनीयता नीति',
      'privacy_text':
          'माइंड ट्विस्ट आपकी गोपनीयता का सम्मान करता है। कोई व्यक्तिगत डेटा एकत्र नहीं किया जाता है।',
      'streak': 'लगातार दिन',
      'claimed': 'दावा किया गया',
      'claim_reward': 'इनाम पाएं',
      'daily_reward': 'दैनिक इनाम',
      'total_solved': 'कुल हल किए गए',
      'accuracy': 'सटीकता',
      'stars_earned': 'अर्जित तारे',
      'free': 'मुफ्त',
      'ad_unavailable': 'विज्ञापन अभी उपलब्ध नहीं है। कृपया बाद में प्रयास करें।',
      'not_available': 'अभी उपलब्ध नहीं',
      'puzzle_of_day': 'आज की पहेली',
      'restore_purchases': 'खरीदारी पुनर्स्थापित करें',
      'purchase_note': 'इस बिल्ड में खरीदारी सुविधा कॉन्फ़िगर नहीं है।',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ??
        _localizedValues['en']?[key] ??
        key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hi'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
