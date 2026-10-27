# Mind Twist — Brain Puzzle

Mind Twist is an Android-first Flutter puzzle game with 100 locally bundled
brain teasers, English and Hindi text, interaction-specific answer validation,
and locally saved player progress. It is an original project and does not
include assets or copied level text from another game.

> **Project status:** this repository contains a playable game prototype. The
> app, bundled puzzle data, tests, and local progress work offline. Real
> in-app purchases, production AdMob configuration/consent, and production
> signing are not included. See [Known limitations](#known-limitations) before
> using it as a production release.

## Features

- 100 bundled levels, checked when the level repository starts.
- Seven interaction mechanics: multiple choice, tap/sequence, drag and drop,
  object positioning, multi-step, pattern/observation, and timed memory.
- Dedicated answer validation for each interaction mechanic.
- English and Hindi questions, instructions, hints, explanations, categories,
  and app navigation.
- Level map with locked, unlocked, and completed states; level replay.
- Local persistence for unlocked/completed levels, stars, coins, hints,
  language, sound preference, and daily reward streak.
- One-time first-completion coin rewards and best-star tracking.
- Daily puzzle and claimable daily reward.
- Statistics, settings, shop, help, and privacy-information screens.
- Google Mobile Ads test unit IDs and optional rewarded-ad entry points. Ad
  failures do not block puzzle gameplay or grant ad rewards.
- Dark, responsive, portrait-first Flutter interface.

## Screens

| Screen | What it does |
| --- | --- |
| Home | Starts the next unlocked level and opens the other game sections. |
| Level map | Shows all 100 levels and prevents opening locked levels. |
| Puzzle | Presents the puzzle's interaction control and validates the answer. |
| Hint | Reveals the next localized hint using inventory or an available rewarded ad. |
| Completion | Shows stars, explanation, replay, and next-level actions. |
| Daily challenge | Opens the date-selected bundled puzzle and daily reward claim. |
| Statistics | Shows completed levels, stars, and coin balance. |
| Settings | Switches English/Hindi and sound/haptics. |
| Shop | Buys hints with earned coins; purchase/ad offers are clearly unavailable in this build. |
| Help & privacy | Explains gameplay and includes the current privacy information. |

## Tech stack and structure

- **Flutter / Dart** for the UI, game logic, and Android app.
- **Provider** for view-model and dependency state.
- **SharedPreferences** for local player data and preferences.
- **Google Mobile Ads** plugin, currently configured with Google's Android test
  app ID and test unit IDs.
- MVVM-style separation between screens, view models, repositories, models,
  and services.

```text
lib/
  core/
    constants/       # app and ad constants
    localization/    # English and Hindi strings
    theme/           # shared dark theme and colors
  models/            # puzzle, interaction, category, and progress models
  puzzle_engine/
    level_data/      # four bundled groups of 25 levels
    validators/      # interaction-specific answer validators
  repositories/      # bundled level repository and content checks
  services/          # persistence, ads, and audio/haptics
  viewmodels/        # game, progress, daily challenge, and shop state
  views/             # home, map, gameplay, and supporting screens
test/                # validator, persistence, and widget tests
android/             # Android app and Gradle configuration
```

## Requirements

- Flutter SDK with Dart SDK `3.13.5` or later, as specified by
  [`pubspec.yaml`](./pubspec.yaml).
- Android Studio or Android SDK command-line tools for Android builds.
- Git.

Check the installed tools:

```powershell
flutter --version
flutter doctor
```

## Run locally

From the repository root:

```powershell
flutter pub get
flutter run
```

The game content is bundled in Dart source; internet access is not needed to
play levels. An internet connection may be needed to resolve packages and to
load ads.

### Windows symlink support

Some Flutter plugins require Windows Developer Mode to be enabled. If
`flutter pub get` reports that plugin builds require symlink support, enable
Developer Mode in Windows Settings, reopen the terminal, then rerun the
command.

## Run checks

```powershell
flutter analyze
flutter test
```

Tests check the 100-level bundle and its required fields, verify that bundled
interaction-specific solutions pass validation, exercise progress persistence
and one-time rewards, and run a home-to-level-completion widget flow.

## Create an Android APK

For a local release-mode APK:

```powershell
flutter build apk --release
```

The expected output path is:

```text
build/app/outputs/flutter-apk/app-release.apk
```

To build a Play Store bundle instead:

```powershell
flutter build appbundle --release
```

Pushing a version tag matching `v*` runs the GitHub Actions workflow at
[`android-release.yml`](./.github/workflows/android-release.yml). If analysis,
tests, and the Android build succeed, it creates a GitHub Release and attaches
the APK. Published downloads appear on the repository's
[Releases page](https://github.com/bijaykumarceh-dev/mind-game/releases).

The Android release build currently uses the debug signing configuration from
[`android/app/build.gradle.kts`](./android/app/build.gradle.kts). That is useful
for local installation/testing, **not for a production Play Store release**.
Create and protect your own upload key, configure release signing locally, and
never commit signing keys or passwords.

## Puzzle content and answer validation

Levels are represented by `PuzzleLevel` and split into four source files under
`lib/puzzle_engine/level_data/`. Every level has an ID, category, interaction
type, English/Hindi question and instructions, hints, explanation, and reward.
Interaction-specific fields hold choices, sequences, drag IDs, position
targets, or pattern answers as appropriate.

`LevelRepository` validates the bundled content at startup and reports invalid
data rather than silently substituting another level. `PuzzleEngine` routes
answers to dedicated validators; for example, drag/drop checks both object
IDs, positioning checks target distance/tolerance, and memory/sequence
mechanics compare the submitted sequence.

When adding or editing a level:

1. Keep IDs unique and in the range `1..100`, unless the repository's content
   validation and progression rules are updated together.
2. Provide both languages, at least three hints per language, a non-empty
   explanation, and a valid answer for the chosen interaction type.
3. Keep the screen control and answer payload consistent with that validator.
4. Add or update tests, then run `flutter analyze` and `flutter test`.

## Progress and offline behavior

Progress is stored locally using SharedPreferences. The first successful
completion records the level, grants its coin reward once, and unlocks the
following level. Replaying a completed level can improve its best star count
without granting the same completion coins again. Hints purchased with coins
and daily claims are also stored on the device.

This is local-device persistence, not cloud sync: uninstalling the app or
clearing its app data can remove saved progress.

## Ads, privacy, and purchases

- Android ad configuration is centralized in
  [`lib/core/constants/app_constants.dart`](./lib/core/constants/app_constants.dart).
- The Android manifest and Dart ad service currently use Google's **test**
  AdMob identifiers. Replace them with your own approved identifiers only
  after reviewing Google's policies and verifying the app's consent setup.
- A rewarded hint/coin must only be granted from the verified rewarded-ad
  callback. A missing, failed, or dismissed ad must not grant an ad reward.
- Ads are optional; puzzle play does not depend on an ad being available.
- The shop can spend earned coins for hints. Remove-ads, paid products, and
  purchase restoration are intentionally shown as unavailable: no billing
  provider or verified purchase flow is implemented.
- This project does not yet include a complete Google UMP consent flow,
  production privacy-policy URL, or age/region-specific compliance handling.
  Supply and review these before production distribution; do not treat the
  sample privacy text as legal advice or a finished policy.

## Known limitations

- No real in-app purchase or restore-purchase integration.
- No production AdMob account configuration or complete consent flow.
- Release signing is configured for local/debug use only.
- No cloud backup or cross-device progress sync.
- Some puzzle interactions use generic interface controls rather than
  individually illustrated scenes.
- Automated tests currently cover validators, progress/rewards, and the main
  widget flow; there is no device-farm or end-to-end Android integration suite.

## Contributing

1. Fork the repository and create a focused branch.
2. Make a small, testable change and update relevant tests/docs.
3. Run `flutter analyze` and `flutter test`.
4. Open a pull request describing the behavior change and verification.

Please use original puzzle text and artwork. Do not add credentials, signing
files, live ad IDs, or personal data to commits.

## License

This project is distributed under the MIT License. See [`LICENSE`](./LICENSE).
