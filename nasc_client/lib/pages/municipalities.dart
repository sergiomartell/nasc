import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MunicipalityPage extends StatelessWidget {
  const MunicipalityPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            /* image: DecorationImage(
              opacity: 0.3,
              image: AssetImage("assets/images/sanjose.jpg"),
              fit: BoxFit.cover,
            ), */
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 33),
                Text(
                  'Municipalities',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 33),
                Padding(
                  padding: const EdgeInsets.all(33.0),
                  child: Text("Local Action, Global Impact",
                      textAlign: TextAlign.start,
                      style: theme.textTheme.displayLarge),
                ),
                Container(
                  padding: const EdgeInsets.all(33),
                  width: 900,
                  child: Text(
                    "Natural Asset Smart Contracts are composable by ways of Hierearchical Referencing, this then becomes a powerful coordination mechanism that allows compounding action that has permanence and traction.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 33),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(33),
                      child: Image.asset("assets/images/composability.png"),
                    ),
                    const SizedBox(width: 33),
                    Padding(
                      padding: const EdgeInsets.all(33),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 88,
                          ),
                          Text(
                            "Composability",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineMedium,
                          ),
                          SizedBox(
                            width: 600,
                            child: Text(
                              "Composability is the ability to combine different parts of a system to achieve a desired outcome. In the context of Natural Asset Smart Contracts, composability is the ability to achieve momentum and a nonstopable force to create a more sustainable and resilient future.",
                              textAlign: TextAlign.start,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 33),
                Padding(
                  padding: const EdgeInsets.all(33),
                  child: Text(
                    "We have the solutions, it is time we apply them!",
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "You don't need to be a land owner to get started, if you know how to deploy a NASC you can coordinate with stakeholders to get your municipality involved.",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(33),
                  child: Image.asset("assets/images/roadmap.png"),
                ),
                const SizedBox(height: 33),
                // Create button with link to github repo
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 33,
                      vertical: 20,
                    ),
                  ),
                  onPressed: () {
                    launchUrlString("https://github.com/sergiomartell/nasc");
                  },
                  child: Text(
                    "Get Started",
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: 33),
              ],
            ),
          ),
        ));
  }
}
