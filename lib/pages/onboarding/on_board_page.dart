import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../styles.dart';
import 'widgets/on_board_template.dart';
import 'widgets/onboard_text_widget.dart';

class OnBoardPage extends StatefulWidget {
  OnBoardPage({Key? key}) : super(key: key);
  final PageController controller = PageController(initialPage: 0);
  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {


  static const List<String> _imagePath = [
    "assets/images/clap_phone.svg",
    "assets/images/clapping.svg",
    "assets/images/phone_with_icon.svg",
    "assets/images/problem.svg",
    "assets/images/rate.svg",
  ];

  static const List<String> _titles = [
    "Can't find your phone?",
    "Help us to improve our app!",
    "Just clap 3 times",
    "Your phone will make a sound",
    "Clap To Find",
  ];

  static const List<String> _text = [
    "Our app will help you!",
    "We want our application to be useful to you",
    "Wait a second...",
    "You made it!",
    "Subscribe to unlock all the features, just \$9.99/week",
  ];

  static final List<Widget> _widgets = [
    OnBoardTextWidget(header: _titles[0], text: _text[0]),
    OnBoardTextWidget(header: _titles[1], text: _text[1]),
    OnBoardTextWidget(header: _titles[2], text: _text[2]),
    OnBoardTextWidget(header: _titles[3], text: _text[3]),
  ];

  final Curve curve = Curves.easeInOut;
  final Duration duration = const Duration(milliseconds: 400);
  double _currentPage = 0;


  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            onPageChanged: (_) {
              setState(() {
                _currentPage = controller.page ?? 0;
              });
            } ,
            children: [
              OnBoardTemplate(
                imagePath: _imagePath[0],
                textOrButton: _widgets[0],
                buttonText: "Next",
                onPressed: () {
                  controller.nextPage(duration: duration, curve: curve);
                },
              ),
              OnBoardTemplate(
                imagePath: _imagePath[1],
                textOrButton: _widgets[1],
                buttonText: "Next",
                onPressed: () {
                  controller.nextPage(duration: duration, curve: curve);
                },
              ),
              OnBoardTemplate(
                imagePath: _imagePath[2],
                textOrButton: _widgets[2],
                buttonText: "Next",
                isTappable: true,
                onPressed: () {
                  controller.nextPage(duration: duration, curve: curve);
                },
              ),
              OnBoardTemplate(
                imagePath: _imagePath[3],
                textOrButton: _widgets[3],
                buttonText: "Continue",
                legalWidget: true,
                onPressed: () {
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //         //TODO: Fix landing logic HomeFullPage - is not the best solution
                  //         const HomeFullPage()),
                  //         (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 3,
                child: Container(),
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DotsIndicator(
                      dotsCount: 4,
                      position: _currentPage,
                      decorator: const DotsDecorator(
                        color: Styles.brightTextColor,
                        activeColor: Styles.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}