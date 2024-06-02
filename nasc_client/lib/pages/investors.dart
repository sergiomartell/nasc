import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nasc_client/services/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

class InvestorsPage extends StatefulWidget {
  const InvestorsPage({super.key});

  @override
  State<InvestorsPage> createState() => _InvestorsPageState();
}

class _InvestorsPageState extends State<InvestorsPage> {
  final TextEditingController _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _numberOfTokens = "";
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
          actions: [
            web3.isConnected ? _buildWalletButton(web3) : Container(),
            const SizedBox(width: 20)
          ],
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
              children: [_buildHero(size, context, theme, web3)],
            ),
          ),
        ),
      ),
    );
  }

  //* Widget Builds

  // Widget that builds form to fund project

  Widget _buildFundForm(Web3 web3, TextTheme theme) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 550,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text("Invest in the Project", style: theme.titleMedium),
            Text("Total Supply: 6,000,000", style: theme.labelLarge),
            Text("Price: 0.0001 ETH", style: theme.labelLarge),
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: "Add Number of Tokens to Fund Project",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a number";
                }
                return null;
              },
              onSaved: (value) {
                _numberOfTokens = value!;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  web3.fundProject(int.parse(_numberOfTokens));
                }
              },
              child: const Text("Fund Project"),
            )
          ],
        ),
      ),
    );
  }

  Container _buildHero(
      Size screen, BuildContext context, TextTheme theme, Web3 web3) {
    return Container(
      height: screen.height * .8,
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
            "assets/images/ElMexicanoBanner.png",
          ),
          filterQuality: FilterQuality.high,
          alignment: Alignment.centerLeft,
          fit: BoxFit.cover,
          opacity: .5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            height: 100,
            width: screen.width,
          ),
          _buildGeneralInfo(screen, theme, web3),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildGeneralInfo(Size screen, TextTheme theme, Web3 web3) {
    return Padding(
      padding: const EdgeInsets.all(33),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: screen.width * .10,
        runSpacing: 33,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(33),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("El Mexicano", style: theme.displayMedium),
                    Text("Natural Asset Smart Contract",
                        style: theme.titleMedium),
                    TextButton.icon(
                      onPressed: () {
                        launchUrlString(
                            "https://sepolia.etherscan.io/address/0xb63c7485718cdc27907c702bc6837734eda288f3");
                      },
                      icon: const Icon(FontAwesomeIcons.ethereum),
                      label: const Text(
                        "0xB63c7485718cdc27907c702bC6837734eDA288F3",
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: Text(
                          "El Mexicano is a conservation and regeneration project of 600 hectares in the outskirts of Guadalajara Jalisco",
                          style: theme.bodyMedium),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconIndicator(
                          icon2: const Icon(Icons.location_city),
                          data: "Ixtlahuacán del Río",
                          theme: theme,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IconIndicator(
                          icon2: const Icon(Icons.home_work),
                          data: "Jalisco",
                          theme: theme,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IconIndicator(
                          icon2: const Icon(Icons.water),
                          data: "Lerma-Santiago",
                          theme: theme,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        IconIndicator(
                          icon2: const Icon(Icons.flag),
                          data: "Mexico",
                          theme: theme,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              _buildFundForm(web3, theme),
            ],
          ),
          Image.asset(
            "assets/images/mexicanoMap.png",
            width: 800,
          )
        ],
      ),
    );
  }

  ElevatedButton _buildWalletButton(Web3 web3) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            shape: const StadiumBorder()),
        onPressed: () {
          web3.isConnected ? web3.clear() : web3.connectProvider();
        },
        child: web3.isConnected
            ? Text(
                Utils.abbreviate(web3.currentAddress),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w900,
                ),
              )
            : const Text(
                "Connect Wallet",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w900,
                ),
              ));
  }
}

class IconIndicator extends StatelessWidget {
  const IconIndicator({
    super.key,
    required this.icon2,
    required this.data,
    required this.theme,
  });

  final Icon icon2;
  final String data;
  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon2,
        const SizedBox(
          width: 10,
        ),
        Text(
          data,
          style: theme.labelSmall,
        ),
      ],
    );
  }
}
