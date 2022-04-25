import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrlLauncher({
  required String url,
  VoidCallback? onUrlUnAvailable,
}) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    onUrlUnAvailable?.call();
  }
}
