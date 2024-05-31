import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/nasc.png", height: 200),
              const SizedBox(height: 33),
              Text(
                'Natural Asset Smart Contracts',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 33),
              Text(
                "The biggest challenge in the world today is climate change, and we, as a community have the solutions that can be applied locally to have a global impact, wether you are a land owner, municipality, investor or a concerned citizen, you can participate in regeneration or conservations projects for our natural wealth.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 33),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 33,
                children: <Widget>[
                  SizedBox(
                    width: 300,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(33),
                        child: Column(
                          children: <Widget>[
                            const Icon(
                              Icons.nature_people,
                              size: 88,
                              color: Colors.green,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Land Owners',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Setup a conservation or regeneration project in your land',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(33),
                        child: Column(
                          children: <Widget>[
                            const Icon(
                              Icons.account_balance,
                              size: 88,
                              color: Colors.green,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Municipalities',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Setup a conservation or regeneration project in your land',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
