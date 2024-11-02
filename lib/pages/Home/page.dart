import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      appBar: AppBar(
        backgroundColor: HexColor('#f5f5f5'),
        actions: [
          SvgPicture.asset(
            "assets/images/message_notice.svg",
            width: 22,
            height: 22,
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Home Page'),
      ),
    );
  }
}
