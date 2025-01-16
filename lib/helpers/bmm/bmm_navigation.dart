import 'package:url_launcher/url_launcher.dart';

Future<void> openBmmPage(String path) async {
  final url = Uri.https('bmm.bcc.media', path);
  if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }
}
