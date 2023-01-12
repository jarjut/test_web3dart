import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class Wallet {
  final Credentials credentials;
  final Web3Client client;

  Wallet({
    required this.credentials,
    required Client httpClient,
    required String url,
  }) : client = Web3Client(url, httpClient);

  Future<double> getBalance() async {
    final address = credentials.address;
    final etherAmount = await client.getBalance(address);
    final balance = etherAmount.getValueInUnit(EtherUnit.ether);
    return balance;
  }

  Future<void> checkCurrentNetwork() async {
    final chainId = await client.getChainId();
    print('Chain ID: $chainId');
  }
}
