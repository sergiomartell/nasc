import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasc_client/services/services.dart';

class InvestorsPage extends StatefulWidget {
  const InvestorsPage({super.key});

  @override
  State<InvestorsPage> createState() => _InvestorsPageState();
}

class _InvestorsPageState extends State<InvestorsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return GetBuilder<Web3>(
      init: Web3(),
      builder: (web3) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green,
                Colors.blue,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [_buildHero(size, context, theme)],
            ),
          ),
        ),
      ),
    );
  }

  //* Widget Builds
  Container _buildHero(Size screen, BuildContext context, TextTheme theme) {
    return Container(
      height: screen.height * .7,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              spreadRadius: 4.5,
              offset: Offset.fromDirection(1))
        ],
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/bannerElMexicano.png",
          ),
          filterQuality: FilterQuality.high,
          alignment: Alignment.centerLeft,
          fit: BoxFit.cover,
          opacity: .5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            height: 150,
            width: screen.width,
          ),
          const Spacer(),
          _buildGeneralInfo(screen),
          const Spacer(),
        ],
      ),
    );
  }

  Wrap _buildGeneralInfo(Size screen) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: screen.width * .10,
      children: const [
        Column(
          children: [
            Text(
              "Token Price: .0008 ETH}",
            ),
            Text(
              "Goal: \$6,000,000",
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
        /* Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            _buildSupportButton(),
            const SizedBox(
              height: 50,
            ),
          ],
        ) */
      ],
    );
  }

  Row _buildAppBar(BuildContext context, TextTheme theme) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/nasc.png",
            filterQuality: FilterQuality.high,
          ),
        ),
      ],
    );
  }

  ElevatedButton _buildSupportButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 75,
            vertical: 20,
          ),
          shape: const StadiumBorder()),
      onPressed: () {
        //_support();
      },
      child: const Text(
        "Support",
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
