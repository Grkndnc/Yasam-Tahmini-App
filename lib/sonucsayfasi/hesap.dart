import 'package:yasam_beklenti/User_Data.dart';

class Hesap {
  User_Data _user_data;
  Hesap(this._user_data);

  double? hesaplama() {
    double sonuc;

    sonuc = 90 + (_user_data.sporSayisi ?? 0) - _user_data.sigaraSayisi!;
    sonuc = sonuc + (_user_data.boy! / _user_data.kilo!);

    return _user_data.secilibuton == 'ERKEK' ? sonuc + 5 : sonuc;
  }
}
