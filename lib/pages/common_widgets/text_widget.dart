import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../styles.dart';

class TextWidget extends StatelessWidget {
  final String header;
  final String text;
  final bool tapable;

  const TextWidget({
    Key? key,
    required this.header,
    required this.text,
    this.tapable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              header,
              style: Styles.titleText,
            ),
          ),
          const SizedBox(height: 10.0),
          Center(
              child: Text(
            text,
            style: Styles.subtitleText,
            textAlign: TextAlign.center,
            //overflow: TextOverflow.ellipsis,
          )),
        ],
      ),
      onTap: tapable ? () => _showRatingAppDialog(context) : null,
    );
  }

  void _showRatingAppDialog(context) {
    final _ratingDialog = RatingDialog(
      //ratingColor: Styles.thirdColor,
      title: const Text(
        'Rate the app',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
        ),
      ),
      message: const Text(
        'Tap a star to rate. You can also leave a'
        ' comment',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.0),
      ),
      image: Image.asset(
        "assets/icons/dialog_icon.png",
        height: 48.0,
        width: 48.0,
      ),
      submitButtonText: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');

        if (response.rating < 3.0) {
          print('response.rating: ${response.rating}');
        } else {
          Container();
        }
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }
}
