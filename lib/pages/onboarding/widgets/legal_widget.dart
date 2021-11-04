
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../styles.dart';

class LegalWidget extends StatelessWidget {
  const LegalWidget({Key? key}) : super(key: key);

  static const String privacyPolicy = "";
  static const String termsOfUse = "";
  static const String restorePurchases = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
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
                        style: Styles.subtitleText,
                      ),
                    ),
              ),
              Text(
                "  |  ",
                style: Styles.subtitleText,
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
                        style: Styles.subtitleText,
                      ),
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          Link(
            uri: Uri.parse(restorePurchases),
            builder:
                (BuildContext context, Future<void> Function()? followLink) =>
                GestureDetector(
                  onTap: followLink,
                  child: Text(
                    "Restore purchases",
                    style: Styles.subtitleText,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}