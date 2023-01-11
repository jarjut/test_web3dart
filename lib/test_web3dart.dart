import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:convert/convert.dart';
import 'package:dart_bip32_bip44/dart_bip32_bip44.dart';
import 'package:web3dart/credentials.dart';

enum MnemonicWordsLength { twelve, fifteen, eighteen, twentyOne, twentyFour }

/// Generate a new mnemonic
///
/// wordsLength: 12, 15, 18, 21, 24
Mnemonic generateMnemonic({
  MnemonicWordsLength wordsLength = MnemonicWordsLength.twelve,
}) {
  int entropyLength;
  switch (wordsLength) {
    case MnemonicWordsLength.twelve:
      entropyLength = 128;
      break;
    case MnemonicWordsLength.fifteen:
      entropyLength = 160;
      break;
    case MnemonicWordsLength.eighteen:
      entropyLength = 192;
      break;
    case MnemonicWordsLength.twentyOne:
      entropyLength = 224;
      break;
    case MnemonicWordsLength.twentyFour:
      entropyLength = 256;
      break;
  }
  return Mnemonic.generate(Language.english, entropyLength: entropyLength);
}

/// Import a mnemonic from a sentence
Mnemonic importMnemonic(String sentence) {
  return Mnemonic.fromSentence(sentence, Language.english);
}

/// Convert a mnemonic to a hex seed
String mnemonicToSeed(Mnemonic mnemonic) {
  return hex.encode(mnemonic.seed);
}

/// Get the private key from a seed
String privateKeyFromSeed(String seed) {
  final chain = Chain.seed(seed);
  final key = chain.forPath("m/44'/60'/0'/0/0");
  return key.privateKeyHex();
}

/// Get ETH address from a private key
String getAddressFromPrivateKey(String privateKey) {
  final credentials = EthPrivateKey.fromHex(privateKey);
  return credentials.address.toString();
}
