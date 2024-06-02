import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LandOwnersPage extends StatelessWidget {
  const LandOwnersPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Uri url = Uri.parse('https://hopetowns.earth/');
    Future<void> gotoPage() async {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          scrolledUnderElevation: 0,
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
            padding: const EdgeInsets.all(33),
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 20,
              spacing: 33,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    InkWell(
                      onTap: () {
                        gotoPage();
                      },
                      child: Image.asset(
                        "assets/images/block1.png",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    /* Image.asset(
                      "assets/images/block2.png",
                      height: 210,
                    ), */
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/block3.png",
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/block4.png",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/block5.png",
                    ),
                    Image.asset(
                      "assets/images/block6.png",
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/block10.png",
                    ),
                    Image.asset(
                      "assets/images/block7.png",
                    ),
                    Image.asset(
                      "assets/images/block9.png",
                    ),
                    Image.asset(
                      "assets/images/block11.png",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
