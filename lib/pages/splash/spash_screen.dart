import 'package:clap_app/pages/common_widgets/background_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _forwardToBoard(context);
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Container(),
                  ),
                  SvgPicture.asset("assets/images/clap_phone.svg"),
                  Flexible(
                    child: Container(),
                  ),
                ],
              ),
              Text(
                "Clap To Find",
                style: Styles.titleText,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _forwardToBoard(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3), () {
      // 5 seconds over, navigate to Page2.
      Navigator.push(context, MaterialPageRoute(builder: (_) => BackgroundWidget()));
    });
  }
}
