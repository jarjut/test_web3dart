import 'package:test_web3dart/test_web3dart.dart';

void main(List<String> arguments) {
  final mnemonic = generateMnemonic();
  print('Sentence: ${mnemonic.sentence}');
  print('Total Words: ${mnemonic.words.length}');
  final seed = mnemonicToSeed(mnemonic);
  print('Seed: $seed');
  final privateKey = privateKeyFromSeed(seed);
  print('Private Key: $privateKey');
  final address = getAddressFromPrivateKey(privateKey);
  print('Address: $address');
}
