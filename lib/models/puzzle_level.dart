import 'interaction_type.dart';
import 'puzzle_category.dart';

class PuzzleLevel {
  final int id;
  final PuzzleCategory category;
  final InteractionType interactionType;
  final String questionEn;
  final String questionHi;
  final String instructionEn;
  final String instructionHi;
  final String explanationEn;
  final String explanationHi;
  final List<String> hintsEn;
  final List<String> hintsHi;
  final int rewardCoins;
  final List<String> assetReferences;

  // Interaction specific parameters
  final List<String>? options;
  final List<String>? optionsHi;
  final int? solutionIndex;
  final List<int>? targetSequence;
  final String? dragSourceId;
  final String? dragTargetId;
  final Map<String, dynamic>? positionTarget;
  final Map<String, dynamic>? extraData;

  const PuzzleLevel({
    required this.id,
    required this.category,
    required this.interactionType,
    required this.questionEn,
    required this.questionHi,
    required this.instructionEn,
    required this.instructionHi,
    required this.explanationEn,
    required this.explanationHi,
    required this.hintsEn,
    required this.hintsHi,
    this.rewardCoins = 10,
    this.assetReferences = const [],
    this.options,
    this.optionsHi,
    this.solutionIndex,
    this.targetSequence,
    this.dragSourceId,
    this.dragTargetId,
    this.positionTarget,
    this.extraData,
  });

  String getQuestion(String languageCode) =>
      languageCode == 'hi' ? questionHi : questionEn;

  String getInstruction(String languageCode) =>
      languageCode == 'hi' ? instructionHi : instructionEn;

  String getExplanation(String languageCode) =>
      languageCode == 'hi' ? explanationHi : explanationEn;

  List<String> getHints(String languageCode) =>
      languageCode == 'hi' ? hintsHi : hintsEn;

  List<String>? getOptions(String languageCode) =>
      languageCode == 'hi' ? (optionsHi ?? options) : options;

  /// Localized description of a single multi-step stage (1-based), or null
  /// when the level does not provide step texts.
  String? getStepText(String languageCode, int stepNumber) {
    final data = extraData;
    if (data == null) return null;
    final Object? raw = languageCode == 'hi'
        ? data['stepTextsHi']
        : data['stepTextsEn'];
    if (raw is! List) return null;
    final index = stepNumber - 1;
    if (index < 0 || index >= raw.length) return null;
    final value = raw[index]?.toString().trim();
    return (value == null || value.isEmpty) ? null : value;
  }
}
