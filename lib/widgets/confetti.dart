import 'dart:math';

import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

/// A short, finite burst of falling confetti used on the level-complete
/// panel. It paints itself only while its animation runs, so it never keeps
/// the widget tree scheduling frames.
class ConfettiBurst extends StatefulWidget {
  final Duration duration;

  const ConfettiBurst({super.key, this.duration = const Duration(seconds: 3)});

  @override
  State<ConfettiBurst> createState() => _ConfettiBurstState();
}

class _ConfettiBurstState extends State<ConfettiBurst>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_ConfettiPiece> _pieces;

  static const List<Color> _palette = [
    AppTheme.warningColor,
    AppTheme.secondaryColor,
    AppTheme.accentColor,
    AppTheme.successColor,
    AppTheme.primaryColor,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward();
    final random = Random(7);
    _pieces = List<_ConfettiPiece>.generate(46, (index) {
      return _ConfettiPiece(
        startX: random.nextDouble(),
        delay: random.nextDouble() * 0.35,
        drift: (random.nextDouble() * 2 - 1) * 40,
        spin: (random.nextDouble() * 2 - 1) * 6,
        phase: random.nextDouble() * pi * 2,
        size: 6 + random.nextDouble() * 7,
        color: _palette[index % _palette.length],
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        if (_controller.status == AnimationStatus.completed) {
          return const SizedBox.shrink();
        }
        return CustomPaint(
          painter: _ConfettiPainter(_controller.value, _pieces),
          size: Size.infinite,
        );
      },
    );
  }
}

class _ConfettiPiece {
  final double startX;
  final double delay;
  final double drift;
  final double spin;
  final double phase;
  final double size;
  final Color color;

  const _ConfettiPiece({
    required this.startX,
    required this.delay,
    required this.drift,
    required this.spin,
    required this.phase,
    required this.size,
    required this.color,
  });
}

class _ConfettiPainter extends CustomPainter {
  final double progress;
  final List<_ConfettiPiece> pieces;

  _ConfettiPainter(this.progress, this.pieces);

  @override
  void paint(Canvas canvas, Size size) {
    for (final piece in pieces) {
      final local = ((progress - piece.delay) / (1 - piece.delay)).clamp(
        0.0,
        1.0,
      );
      if (local <= 0) continue;

      final fade = local < 0.12 ? local / 0.12 : (1 - local).clamp(0.0, 1.0);
      final x =
          piece.startX * size.width +
          piece.drift * local +
          sin(local * 4 + piece.phase) * 12;
      final y = -20 + local * (size.height + 40);

      final paint = Paint()
        ..color = piece.color.withValues(alpha: fade.clamp(0.0, 1.0));

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(piece.spin * local + piece.phase);
      canvas.drawRect(
        Rect.fromCenter(
          center: Offset.zero,
          width: piece.size,
          height: piece.size * 0.6,
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
