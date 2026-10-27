import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../services/ad_service.dart';

/// Bottom banner that only takes up space once Google has actually loaded an
/// ad. Any failure simply leaves the widget empty, so it can never block or
/// break gameplay.
class BannerAdView extends StatefulWidget {
  const BannerAdView({super.key});

  @override
  State<BannerAdView> createState() => _BannerAdViewState();
}

class _BannerAdViewState extends State<BannerAdView> {
  BannerAd? _banner;
  bool _loaded = false;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    _load();
  }

  Future<void> _load() async {
    if (kIsWeb) return;
    final ads = context.read<AdService>();
    await ads.ready;
    if (!mounted || !ads.isInitialized) return;
    try {
      final banner = ads.createBannerAd(() {
        if (mounted) setState(() => _loaded = true);
      });
      _banner = banner;
      await banner.load();
    } catch (error) {
      debugPrint('Banner ad unavailable: $error');
      if (mounted) {
        setState(() => _banner = null);
      }
    }
  }

  @override
  void dispose() {
    _banner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final banner = _banner;
    if (!_loaded || banner == null) return const SizedBox.shrink();
    return SizedBox(
      width: banner.size.width.toDouble(),
      height: banner.size.height.toDouble(),
      child: AdWidget(ad: banner),
    );
  }
}
