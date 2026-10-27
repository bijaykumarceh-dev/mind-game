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
}
