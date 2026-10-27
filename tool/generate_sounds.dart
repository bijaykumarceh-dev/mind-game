// Generates the game's sound-effect WAV files into assets/sounds/.
// Run from the repository root:  dart run tool/generate_sounds.dart
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

enum Wave { sine, square, saw }

class Seg {
  final double start;
  final double dur;
  final double freqStart;
  final double freqEnd;
  final double amp;
  final double attack;
  final double release;
  final Wave wave;

  const Seg({
    required this.start,
    required this.dur,
    required this.freqStart,
    this.freqEnd = -1,
    this.amp = 0.5,
    this.attack = 0.005,
    this.release = 0.05,
    this.wave = Wave.sine,
  });
}

const int rate = 44100;

List<double> render(double totalDur, List<Seg> segs) {
  final buf = List<double>.filled((totalDur * rate).round(), 0);
  for (final s in segs) {
    final fEnd = s.freqEnd < 0 ? s.freqStart : s.freqEnd;
    final len = (s.dur * rate).round();
    final startIdx = (s.start * rate).round();
    final attackSamples = max(1, (s.attack * rate).round());
    final releaseSamples = max(1, (s.release * rate).round());
    var phase = 0.0;
    for (var i = 0; i < len; i++) {
      final frac = i / len;
      final f = s.freqStart + (fEnd - s.freqStart) * frac;
      phase += 2 * pi * f / rate;
      final double v;
      switch (s.wave) {
        case Wave.sine:
          v = sin(phase);
        case Wave.square:
          v = sin(phase) >= 0 ? 1.0 : -1.0;
        case Wave.saw:
          v = ((phase / (2 * pi)) % 1) * 2 - 1;
      }
      var env = 1.0;
      if (i < attackSamples) env = i / attackSamples;
      if (i > len - releaseSamples) {
        env *= max(0, (len - i) / releaseSamples);
      }
      final idx = startIdx + i;
      if (idx >= 0 && idx < buf.length) {
        buf[idx] += v * s.amp * env;
      }
    }
  }
  return buf;
}

void writeWav(String path, List<double> samples) {
  final dataLen = samples.length * 2;
  final header = ByteData(44);
  void text(int offset, String value) {
    for (var i = 0; i < value.length; i++) {
      header.setUint8(offset + i, value.codeUnitAt(i));
    }
  }

  text(0, 'RIFF');
  header.setUint32(4, 36 + dataLen, Endian.little);
  text(8, 'WAVE');
  text(12, 'fmt ');
  header.setUint32(16, 16, Endian.little);
  header.setUint16(20, 1, Endian.little); // PCM
  header.setUint16(22, 1, Endian.little); // mono
  header.setUint32(24, rate, Endian.little);
  header.setUint32(28, rate * 2, Endian.little);
  header.setUint16(32, 2, Endian.little);
  header.setUint16(34, 16, Endian.little);
  text(36, 'data');
  header.setUint32(40, dataLen, Endian.little);

  final pcm = ByteData(dataLen);
  for (var i = 0; i < samples.length; i++) {
    final v = samples[i].clamp(-1.0, 1.0);
    pcm.setInt16(i * 2, (v * 32767).round(), Endian.little);
  }

  File(path)
    ..createSync(recursive: true)
    ..writeAsBytesSync(<int>[
      ...header.buffer.asUint8List(),
      ...pcm.buffer.asUint8List(),
    ]);
}

void main() {
  final outDir = Directory('assets/sounds');
  outDir.createSync(recursive: true);

  final sounds = <String, (double, List<Seg>)>{
    'click.wav': (
      0.12,
      [
        const Seg(
          start: 0,
          dur: 0.08,
          freqStart: 1400,
          freqEnd: 2400,
          amp: 0.40,
          release: 0.04,
        ),
      ],
    ),
    'tick.wav': (
      0.06,
      [
        const Seg(
          start: 0,
          dur: 0.04,
          freqStart: 2400,
          amp: 0.28,
          release: 0.02,
        ),
      ],
    ),
    'hint.wav': (
      0.24,
      [
        const Seg(
          start: 0,
          dur: 0.22,
          freqStart: 880,
          amp: 0.32,
          attack: 0.02,
          release: 0.12,
        ),
      ],
    ),
    'correct.wav': (
      0.42,
      [
        const Seg(
          start: 0,
          dur: 0.12,
          freqStart: 523.25,
          amp: 0.45,
          release: 0.05,
        ),
        const Seg(
          start: 0.12,
          dur: 0.12,
          freqStart: 659.25,
          amp: 0.45,
          release: 0.05,
        ),
        const Seg(
          start: 0.24,
          dur: 0.17,
          freqStart: 783.99,
          amp: 0.45,
          release: 0.10,
        ),
      ],
    ),
    'wrong.wav': (
      0.32,
      [
        const Seg(
          start: 0,
          dur: 0.28,
          freqStart: 233,
          freqEnd: 196,
          amp: 0.30,
          wave: Wave.square,
          attack: 0.01,
          release: 0.12,
        ),
        const Seg(
          start: 0,
          dur: 0.28,
          freqStart: 247,
          freqEnd: 208,
          amp: 0.22,
          wave: Wave.square,
          attack: 0.01,
          release: 0.12,
        ),
      ],
    ),
    'coin.wav': (
      0.28,
      [
        const Seg(
          start: 0,
          dur: 0.10,
          freqStart: 1318.51,
          amp: 0.42,
          release: 0.04,
        ),
        const Seg(
          start: 0.11,
          dur: 0.16,
          freqStart: 1760,
          amp: 0.42,
          release: 0.09,
        ),
      ],
    ),
    'victory.wav': (
      0.80,
      [
        const Seg(
          start: 0,
          dur: 0.14,
          freqStart: 523.25,
          amp: 0.48,
          release: 0.05,
        ),
        const Seg(
          start: 0.14,
          dur: 0.14,
          freqStart: 659.25,
          amp: 0.48,
          release: 0.05,
        ),
        const Seg(
          start: 0.28,
          dur: 0.14,
          freqStart: 783.99,
          amp: 0.48,
          release: 0.05,
        ),
        const Seg(
          start: 0.42,
          dur: 0.36,
          freqStart: 1046.50,
          amp: 0.48,
          release: 0.28,
        ),
      ],
    ),
  };

  for (final entry in sounds.entries) {
    final path = '${outDir.path}${Platform.pathSeparator}${entry.key}';
    writeWav(path, render(entry.value.$1, entry.value.$2));
    stdout.writeln('wrote $path');
  }
}
