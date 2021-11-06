import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../styles.dart';

class LegalWidget extends StatelessWidget {
  const LegalWidget({Key? key}) : super(key: key);

  static const String privacyPolicy = "";
  static const String termsOfUse = "";
  static const String restorePurchases = "";

  static TextStyle textStyle =  Styles.legacyText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Link(
            uri: Uri.parse(privacyPolicy),
            builder:
                (BuildContext context, Future<void> Function()? followLink) =>
                    GestureDetector(
              onTap: followLink,
              child: Text(
                "Privacy Policy",
                style: textStyle,
              ),
            ),
          ),
          Text(
            "  |  ",
            style: textStyle,
            textAlign: TextAlign.start,
          ),
          Link(
            uri: Uri.parse(termsOfUse),
            builder:
                (BuildContext context, Future<void> Function()? followLink) =>
                    GestureDetector(
              onTap: followLink,
              child: Text(
                "Terms of Use",
                style: textStyle,
              ),
            ),
          ),
          Text(
            "  |  ",
            style: textStyle,
            textAlign: TextAlign.start,
          ),
          Link(
            uri: Uri.parse(restorePurchases),
            builder:
                (BuildContext context, Future<void> Function()? followLink) =>
                    GestureDetector(
              onTap: followLink,
              child: Text(
                "Restore purchases",
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
