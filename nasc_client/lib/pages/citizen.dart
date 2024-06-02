import 'package:flutter/material.dart';

class CitizenPage extends StatelessWidget {
  const CitizenPage({super.key});

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
                  'Citizens',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 33),
                Padding(
                  padding: const EdgeInsets.all(33.0),
                  child: Text("Randomized Stratified Data",
                      textAlign: TextAlign.start,
                      style: theme.textTheme.displayLarge),
                ),
                Container(
                  padding: const EdgeInsets.all(33),
                  width: 900,
                  child: Text(
                    "To ensure certainty about the state of a Natural Asset Smart Contract, our protocol uses a randomized stratified dataset that provides statistical accuracy regarding the ecosystem's condition.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 33),
                Padding(
                  padding: const EdgeInsets.all(33),
                  child: Text(
                      "NASCs will be provide transparency and accountability to obscure carbon markets.",
                      style: theme.textTheme.displaySmall),
                ),
                Padding(
                  padding: const EdgeInsets.all(33.0),
                  child: Wrap(
                    spacing: 33,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset("assets/images/dataSources.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(33),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /* const SizedBox(
                              height: 33,
                            ), */
                            Text(
                              "Stratified Data from Decentralized Data Sources",
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineMedium,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 600,
                              child: Column(
                                children: [
                                  Text(
                                    "In compliance with IPCC (Intergovernmental Panel on Climate Change) guidelines for Land Management, we use stratified data from decentralized data sources to make inferences about the state of a Natural Asset Smart Contract.",
                                    textAlign: TextAlign.start,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Using Satellite, Drone or Field Observations, a NASC provides unprecedented transparency and accountability in the management of Natural Assets. Anyone can participate in the monitoring and verification of the state of a Natural Asset Smart Contract.",
                                    textAlign: TextAlign.start,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "NACS are the best Use Case for Decentralized Physical Infrastructure, as a NASC can reward participants for their contributions to the monitoring and verification of the state of a Natural Asset Smart Contract.",
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 33),
              ],
            ),
          ),
        ));
  }
}
