import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

class Web3 extends GetxController {
  final int operatingChain = 11155111;
  static const String elMexicano = "";
  final abi = [
    "function contractURI() public view returns (string memory)",
    "function registerDataProvider(address provider, DataProviderType providerType) external onlyOwner",
    "function setBaselineDataURI(uint256 tokenId, string memory tokenURI) public onlyOwner",
    "function setLegalDocumentURI(uint256 tokenId, string memory tokenURI) public onlyOwner",
    "function setMonitoringDataURI(uint256 tokenId, string memory tokenURI) public",
    "function selectRandomDataProvider(DataProviderType providerType) external view returns (address)"
        "function fundProject(uint256 amount) external payable",
  ];

  bool get isInOperatingChain => currentChain == operatingChain;

  bool get isConnected => Ethereum.isSupported && currentAddress.isNotEmpty;

  bool get isWeb3 => Ethereum.isSupported;

  String currentAddress = '';

  String selectedAddress = "";

  int currentChain = -1;

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
