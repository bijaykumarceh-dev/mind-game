/// Types of interactive puzzle mechanics supported by the engine.
enum InteractionType {
  /// Tap specific object(s) or sequence of targets.
  tap,

  /// Select the correct answer among options (with potential trick choices).
  multipleChoice,

  /// Drag an item onto another or into a drop zone.
  dragDrop,

  /// Move, scale, align, or position objects to target bounds.
  positioning,

  /// Complete a sequential multi-step puzzle (Step 1 -> Step 2 -> Step 3).
  multiStep,

  /// Observation & pattern puzzles (spot difference, count objects, sequence).
  patternObservation,

  /// Memory or timed-reaction puzzles.
  timedMemory,
}
