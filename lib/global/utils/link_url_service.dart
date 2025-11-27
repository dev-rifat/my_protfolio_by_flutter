import 'package:url_launcher/url_launcher.dart';

Future<void> openCustomUrl(String urlString, {String? subject, String? body}) async {
  try {
    Uri url;

    // Check if it's an email
    if (urlString.startsWith("mailto:") || RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$').hasMatch(urlString)) {
      // If plain email, convert to mailto:
      final email = urlString.contains("mailto:") ? urlString : "mailto:$urlString";
      url = Uri(
        scheme: 'mailto',
        path: email.replaceFirst('mailto:', ''),
        queryParameters: {
          if (subject != null) 'subject': subject,
          if (body != null) 'body': body,
        },
      );
    } else {
      // Normal web URL
      url = Uri.parse(urlString);
    }

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      print("Could not launch $url");
    }
  } catch (e) {
    print("Error launching URL: $e");
  }
}




Future<void> openEmail(String email, {String? subject, String? body}) async {
  try {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      query: _encodeQueryParameters(<String, String>{
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      }),
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print("Could not launch email client for $email");
    }
  } catch (e) {
    print("Error launching email: $e");
  }
}

/// Helper to encode query parameters properly
String? _encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

