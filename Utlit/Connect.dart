import 'package:colibricmflutter/String.dart';
import 'package:encrypt/encrypt.dart';

class DekDek2 {
  static final key = Key.fromBase64(
      "12457145874588881245714587451253"); //hardcode combination of 16 character
  static final iv = IV.fromBase64(
      "12457145874588881245714587451253"); //hardcode combination of 16 character

  static final encrypter = Encrypter(AES(key, mode: AESMode.ofb64));
  static final Encrypted enBase64 = Encrypted.from64(keyWowo.toString());
  static final decrypted = encrypter.decrypt(enBase64, iv: iv);
}

DekDek2 encryption2 = DekDek2();
var dekodeko2 = DekDek2.decrypted;
