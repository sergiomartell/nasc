import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              _buildCall2Action(context)
            ],
          ),
        ),
      ),
    );
  }

  Wrap _buildCall2Action(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 33,
      children: <Widget>[
        CallCard(
          onTap: () {},
          icon: Icons.nature_people,
          title: "Land Owners",
          description:
              "Setup a conservation or regeneration project in your land",
        ),
        CallCard(
          onTap: () {},
          icon: Icons.account_balance,
          title: "Municipalities",
          description:
              "Create a conservation or regeneration project in your municipality",
        ),
        CallCard(
          onTap: () {},
          icon: Icons.monetization_on,
          title: "Investors",
          description:
              "Invest in conservation or regeneration projects in your area",
        ),
        CallCard(
          onTap: () {},
          icon: Icons.people,
          title: "Citizen",
          description:
              "Monitor conservation or regeneration projects in your area",
        ),
      ],
    );
  }
}

class CallCard extends StatelessWidget {
  const CallCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(33),
            child: Column(
              children: <Widget>[
                Icon(
                  icon,
                  size: 88,
                  color: Colors.amber,
                ),
                const SizedBox(height: 15),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
