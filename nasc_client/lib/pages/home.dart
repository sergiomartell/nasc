import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasc_client/shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.3,
            image: AssetImage("assets/images/sanjose.jpg"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.blue,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _createBody(context),
      ),
    );
  }

  SingleChildScrollView _createBody(BuildContext context) {
    return SingleChildScrollView(
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
          SizedBox(
            width: 900,
            child: Text(
              "Climate change is our most pressing challenge. By participating in local regeneration and conservation projects, landowners, municipalities, investors, and citizens can make a global impact and protect our natural wealth.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 33),
          Text(
            "We have the solutions, it is time we apply them!",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 33),
          _buildCall2Action(context)
        ],
      ),
    );
  }

  Wrap _buildCall2Action(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 33,
      children: <Widget>[
        CallCard(
          onTap: () {
            Get.toNamed('/land_owners');
          },
          icon: Icons.nature_people,
          title: "Land Owners",
          description:
              "Setup a conservation or regeneration project in your land",
        ),
        CallCard(
          onTap: () {
            Get.toNamed('/municipalities');
          },
          icon: Icons.account_balance,
          title: "Municipalities",
          description:
              "Create a conservation or regeneration project in your municipality",
        ),
        CallCard(
          onTap: () {},
          icon: Icons.people,
          title: "Citizen",
          description:
              "Monitor conservation or regeneration projects in your area",
        ),
        CallCard(
          onTap: () {},
          icon: Icons.monetization_on,
          title: "Investors",
          description:
              "Invest in conservation or regeneration projects in your area",
        ),
      ],
    );
  }
}
