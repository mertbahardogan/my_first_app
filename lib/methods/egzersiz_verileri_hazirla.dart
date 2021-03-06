import 'package:cocuklar_icin_spor_app/models/egzersiz.dart';
import 'package:cocuklar_icin_spor_app/utils/strings.dart';

List<Egzersiz> egzersizVerileriHazirla() {
  List<Egzersiz> egzersizler = [];

  for (int i = 0; i < Strings.EGZERSIZ_ADLARI.length; i++) {
    String resim = Strings.EGZERSIZ_DOSYA_ADLARI[i] + "${i + 1}.png";

    Egzersiz eklenecekEgzersiz = Egzersiz(
      i,
      Strings.EGZERSIZ_ADLARI[i],
      Strings.EGZERSIZ_DOSYA_ADLARI[i],
      Strings.EGZERSIZ_CALISAN_BOLGELER[i],
      Strings.EGZERSIZ_NASIL_YAPILIR[i],
      resim,
      Strings.EGZERSIZ_SEVIYE[i],
    );
    egzersizler.add(eklenecekEgzersiz);
  }
  return egzersizler;
}
