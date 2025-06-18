import 'package:colibricmflutter/Utlit/Connect.dart';
import 'package:encrypt/encrypt.dart';

class DekDek {
  static final key = Key.fromBase64(
      "15975315400255448925121356546794"); //hardcode combination of 16 character
  static final iv = IV.fromBase64(
      "15975315400255448925121356546794"); //hardcode combination of 16 character

  static final encrypter = Encrypter(AES(key, mode: AESMode.ecb));
  static final Encrypted enBase64 = Encrypted.from64(dekodeko2.toString());
  static final decrypted = encrypter.decrypt(enBase64, iv: iv);
}

DekDek encryption = DekDek();
var dekodeko = DekDek.decrypted;
