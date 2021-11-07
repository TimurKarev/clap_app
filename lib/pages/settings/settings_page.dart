import 'package:clap_app/pages/common_widgets/background_widget.dart';
import 'package:clap_app/pages/common_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_svg/svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    FlutterRingtonePlayer.playNotification();
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/images/clap_phone.svg"),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 25.0,
                ),
                child: TextWidget(
                  header: 'Clap To Find',
                  text: 'Find your device with just couple of claps,'
                      ' Claps will be detected when screen is off.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
