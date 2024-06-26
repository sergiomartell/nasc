import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

class Web3 extends GetxController {
  final int operatingChain = 11155111;
  static const String elMexicano = "0xB63c7485718cdc27907c702bC6837734eDA288F3";
  final abi = [
    "function contractURI() public view returns (string memory)",
    "function registerDataProvider(address provider, DataProviderType providerType) external",
    "function setBaselineDataURI(uint256 tokenId, string memory tokenURI) public",
    "function setLegalDocumentURI(uint256 tokenId, string memory tokenURI) public",
    "function setMonitoringDataURI(uint256 tokenId, string memory tokenURI) public",
    "function selectRandomDataProvider(DataProviderType providerType) external view returns (address)",
    "function fundProject(uint256 amount) external payable",
  ];

  bool get isInOperatingChain => currentChain == operatingChain;

  bool get isConnected => Ethereum.isSupported && currentAddress.isNotEmpty;

  bool get isWeb3 => Ethereum.isSupported;

  String currentAddress = '';

  String selectedAddress = "";

  int currentChain = -1;

// Function to fundProject
  Future<dynamic> fundProject(int quantity) async {
    final contract = Contract(elMexicano, abi, provider?.getSigner());
    try {
      final tx = await contract.send(
        "fundProject",
        [quantity],
        TransactionOverride(
          value: BigInt.from(quantity * 100000000000000),
        ),
      );
      return tx;
    } catch (e) {
      rethrow;
    }
  }

  // Function to set baseline data URI
  Future<dynamic> setBaselineDataURI(int tokenId, String tokenURI) async {
    final contract = Contract(elMexicano, abi, provider?.getSigner());
    try {
      final tx = await contract.send(
        "setBaselineDataURI",
        [tokenId, tokenURI],
      );
      return tx;
    } catch (e) {
      rethrow;
    }
  }

  // Function to set legal document URI
  Future<dynamic> setLegalDocumentURI(int tokenId, String tokenURI) async {
    final contract = Contract(elMexicano, abi, provider?.getSigner());
    try {
      final tx = await contract.send(
        "setLegalDocumentURI",
        [tokenId, tokenURI],
      );
      return tx;
    } catch (e) {
      rethrow;
    }
  }

  // Function to set monitoring data URI
  Future<dynamic> setMonitoringDataURI(int tokenId, String tokenURI) async {
    final contract = Contract(elMexicano, abi, provider?.getSigner());
    try {
      final tx = await contract.send(
        "setMonitoringDataURI",
        [tokenId, tokenURI],
      );
      return tx;
    } catch (e) {
      rethrow;
    }
  }

  connectProvider() async {
    if (Ethereum.isSupported) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) {
        currentAddress = accs.first;
        selectedAddress = currentAddress;
        currentChain = await ethereum!.getChainId();
      }
      update();
    }
  }

  verifyChain() async {
    if (Ethereum.isSupported) {
      currentChain = await ethereum!.getChainId();
    }
    update();
  }

  clear() {
    currentAddress = '';
    selectedAddress = '';
    update();
  }

  init() {
    if (Ethereum.isSupported) {
      verifyChain();
      connectProvider();

      ethereum!.onAccountsChanged((accs) {
        clear();
      });

      ethereum!.onChainChanged((chain) {
        connectProvider();
      });
    }
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
