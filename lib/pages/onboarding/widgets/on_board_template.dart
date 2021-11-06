
import 'package:clap_app/pages/common_widgets/background_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
                child: Center(child: textOrButton),
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
}