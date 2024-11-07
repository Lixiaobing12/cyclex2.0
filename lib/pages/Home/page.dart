import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Components/Charts/homeLineCharts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f5f5f5'),
      appBar: AppBar(
        backgroundColor: HexColor('#f5f5f5'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              "assets/images/message_notice.svg",
              width: 22,
              height: 22,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            AssetCard(),
            ProofCard(),
          ],
        ),
      ),
    );
  }
}

class AssetCard extends StatefulWidget {
  @override
  _AssetCard createState() => _AssetCard();
}

class _AssetCard extends State<AssetCard> {
  static const String profit_bg = "assets/images/profit_bg.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 16),
          width: double.infinity,
          height: 121,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(profit_bg), fit: BoxFit.fill)),
          child: const Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Portofolio",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$723,241.00',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                        color: Colors.white),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class ProofCard extends StatefulWidget {
  @override
  _ProofCard createState() => _ProofCard();
}

class _ProofCard extends State<ProofCard> {
  double turns = 0.0;
  Timer? _debounceTimer;

  void reloadTap() {
    if (_debounceTimer?.isActive ?? false) {
      return;
    }
    setState(() {
      turns += 1.0;
    });
    _debounceTimer = Timer(const Duration(seconds: 1), () {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      turns = 0.0;
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel(); // 清理计时器
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Card(
          elevation: 0,
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("POR (Proof of Reserve)",
                            style: TextStyle(
                                color: HexColor("#3D3D3D"),
                                fontWeight: FontWeight.w700,
                                fontSize: 18)),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SvgPicture.asset(
                            "assets/images/qs.svg",
                            width: 12,
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: HexColor("#525252"),
                      size: 14,
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "Until 01/July, 2024",
                          style: TextStyle(
                              color: HexColor("#525252"),
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: AnimatedRotation(
                              turns: turns,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                              child: SvgPicture.asset(
                                "assets/images/reload.svg",
                                width: 13,
                                height: 13,
                              ),
                            ),
                          ),
                          onTap: () {
                            reloadTap();
                          },
                        ),
                      ],
                    )),
                Text(
                  "New/locked real assets are updated/updated monthly and disclosed, through authoritative auditing institutions",
                  style: TextStyle(
                      color: HexColor("#707070"),
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
                ChatView(),
                const LineChartSample2()
              ]))),
    );
  }
}

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  var activeIndex = 0;
  final tabs = ['Scale', 'Market'];
  void setIndexSelect(String tab) {
    setState(() {
      if (tab == 'Scale')
        activeIndex = 0;
      else
        activeIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: IntrinsicWidth(
          child: Container(
            height: 28,
            margin: const EdgeInsets.only(top: 24, bottom: 12),
            decoration: BoxDecoration(
              color: HexColor("#F5F5F5"),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
                children: List.generate(
                    tabs.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setIndexSelect(tabs[index]);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                                color: activeIndex == index
                                    ? HexColor("#3D3D3D")
                                    : HexColor("#F5F5F5"),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                border: Border.all(color: Colors.transparent)),
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                  color: activeIndex == index
                                      ? Colors.white
                                      : HexColor("#3D3D3D"),
                                  fontSize: 14,
                                  height: 1.8,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ))),
          ),
        ));
  }
}
