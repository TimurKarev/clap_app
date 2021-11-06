
import 'package:clap_app/pages/common_widgets/background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rating_dialog/rating_dialog.dart';


import '../../styles.dart';
import 'legal_widget.dart';

class OnBoardTemplate extends StatelessWidget {
  final String imagePath;
  final Widget textOrButton;
  final bool isTappable;
  final Function() onPressed;
  final String buttonText;
  final bool legalWidget;

  const OnBoardTemplate({
    Key? key,
    required this.imagePath,
    required this.textOrButton,
    this.isTappable = false,
    required this.onPressed,
    required this.buttonText,
    this.legalWidget = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Flexible(
                flex: 3,
                child: SvgPicture.asset(imagePath),
              ),
              Flexible(
                flex: 2,
                child: GestureDetector(
                  child: Center(child: textOrButton),
                  onTap: () {
                    _showRatingAppDialog(context);
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  color: Styles.primaryColor,
                  //disabledColor: Styles.buttonDisableColor,
                  child: Text(
                    buttonText,
                    style: Styles.buttonText,
                  ),
                  onPressed: () {
                    onPressed();
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: legalWidget ? const LegalWidget() : Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showRatingAppDialog(context) {
    final _ratingDialog = RatingDialog(
      //ratingColor: Styles.thirdColor,
      title: const Text('Rate the app'),
      message: const Text('Tap a star to rate. Tou can also leave a'
          ' comment'),
      image: Image.asset(
        "assets/png/blood_pressure_dialog_icon.png",
        height: 100,
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