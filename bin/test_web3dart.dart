import 'dart:io';

import 'package:http/http.dart';
import 'package:test_web3dart/test_web3dart.dart';

void main(List<String> arguments) async {
  // final mnemonic = generateMnemonic();
  // print('Sentence: ${mnemonic.sentence}');
  // print('Total Words: ${mnemonic.words.length}');

  final mnemonic = importMnemonic(
      'remember liar pilot indoor hamster pink token senior caught midnight carpet alone oval grief clean exchange about unit ticket unlock cube alpha fancy process');
  final seed = mnemonicToSeed(mnemonic);
  print('Seed: $seed');

  final privateKey = privateKeyFromSeed(seed);
  print('Private Key: $privateKey');

  final credentials = getCredentialsFromPrivateKey(privateKey);
  print('Address: ${credentials.address}');

  final wallet = Wallet(
    credentials: credentials,
    httpClient: Client(),
    url: Network.maticMumbaiTestNet,
  );

  await wallet.checkCurrentNetwork();

  final balance = await wallet.getBalance();
  print('Balance: $balance');

  exit(0);
}

class Network {
  static const String ethSepoliaTestNet = 'https://rpc.sepolia.org';
  static const String maticMumbaiTestNet = 'https://rpc-mumbai.maticvigil.com/';
}
